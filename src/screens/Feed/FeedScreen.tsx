import React, { useState, useCallback } from 'react';
import { View, Text, FlatList, StyleSheet, TouchableOpacity, RefreshControl } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useQuery, useQueryClient } from '@tanstack/react-query';
import { useNavigation } from '@react-navigation/native';
import { StackNavigationProp } from '@react-navigation/stack';
import { FeedStackParamList } from '../../navigation/types';
import { FeedPost, SortType } from '../../types';
import { FeedPostCard } from './FeedPostCard';
import { LoadingSpinner } from '../../components/ui/LoadingSpinner';
import { EmptyState } from '../../components/ui/EmptyState';
import { getFeedPosts, voteFeedPost } from '../../services/api/feed';
import { colors } from '../../theme/colors';
import { spacing } from '../../theme/spacing';
import { typography } from '../../theme/typography';
import Toast from 'react-native-toast-message';

type FeedScreenNavigationProp = StackNavigationProp<FeedStackParamList, 'FeedList'>;

export function FeedScreen() {
  const navigation = useNavigation<FeedScreenNavigationProp>();
  const [sortBy, setSortBy] = useState<SortType>('hot');
  const [page, setPage] = useState(1);
  const queryClient = useQueryClient();

  // Fetch posts
  const { data, isLoading, isError, refetch, isFetching } = useQuery({
    queryKey: ['feedPosts', sortBy, page],
    queryFn: () => getFeedPosts(page, 10, sortBy),
    staleTime: 5 * 60 * 1000, // 5 minutes
  });

  // Handle voting with optimistic update
  const handleVote = useCallback(async (postId: string, vote: 'up' | 'down') => {
    try {
      // Optimistic update
      queryClient.setQueryData(['feedPosts', sortBy, page], (old: any) => {
        if (!old) return old;
        
        return {
          ...old,
          data: old.data.map((post: FeedPost) => {
            if (post.id !== postId) return post;
            
            let newVotes = post.votes;
            
            // Remove previous vote
            if (post.userVote === 'up') {
              newVotes--;
            } else if (post.userVote === 'down') {
              newVotes++;
            }
            
            // Add new vote
            if (vote === 'up') {
              newVotes++;
            } else {
              newVotes--;
            }
            
            return {
              ...post,
              votes: newVotes,
              userVote: vote,
            };
          }),
        };
      });

      // API call
      await voteFeedPost(postId, vote);

      Toast.show({
        type: 'success',
        text1: 'Vote Recorded',
        text2: `You ${vote}voted this post`,
        position: 'bottom',
        visibilityTime: 2000,
      });
    } catch (error) {
      // Revert optimistic update on error
      queryClient.invalidateQueries({ queryKey: ['feedPosts', sortBy, page] });
      Toast.show({
        type: 'error',
        text1: 'Error',
        text2: 'Failed to record vote',
        position: 'bottom',
      });
    }
  }, [sortBy, page, queryClient]);

  // Handle post press (navigate to details)
  const handlePostPress = useCallback((post: FeedPost) => {
    navigation.navigate('FeedPostDetail', { postId: post.id });
  }, [navigation]);

  // Handle refresh
  const handleRefresh = useCallback(() => {
    setPage(1);
    refetch();
  }, [refetch]);

  // Handle load more
  const handleLoadMore = useCallback(() => {
    if (data?.pagination.hasMore && !isFetching) {
      setPage(prev => prev + 1);
    }
  }, [data?.pagination.hasMore, isFetching]);

  // Render filter tabs
  const renderFilterTabs = () => (
    <View style={styles.filterTabs}>
      {(['hot', 'new', 'top'] as SortType[]).map((filter) => (
        <TouchableOpacity
          key={filter}
          style={[styles.filterTab, sortBy === filter && styles.filterTabActive]}
          onPress={() => {
            setSortBy(filter);
            setPage(1);
          }}
        >
          <Text style={[styles.filterTabText, sortBy === filter && styles.filterTabTextActive]}>
            {filter.charAt(0).toUpperCase() + filter.slice(1)}
          </Text>
        </TouchableOpacity>
      ))}
    </View>
  );

  // Render list footer
  const renderListFooter = () => {
    if (!isFetching || page === 1) return null;
    return (
      <View style={styles.footerLoader}>
        <LoadingSpinner text="Loading more..." />
      </View>
    );
  };

  return (
    <SafeAreaView style={styles.container} edges={['top']}>
      {/* Header */}
      <View style={styles.header}>
        <Text style={styles.title}>Feed</Text>
        <Text style={styles.subtitle}>Community Discussions</Text>
      </View>

      {/* Filter Tabs */}
      {renderFilterTabs()}

      {/* Content */}
      {isLoading && page === 1 ? (
        <LoadingSpinner fullScreen text="Loading posts..." />
      ) : isError ? (
        <EmptyState
          icon="⚠️"
          title="Something went wrong"
          subtitle="Please try again later"
        />
      ) : !data || data.data.length === 0 ? (
        <EmptyState
          icon="📰"
          title="No posts yet"
          subtitle="Be the first to start a discussion"
        />
      ) : (
        <FlatList
          data={data.data}
          renderItem={({ item }) => (
            <FeedPostCard
              post={item}
              onPress={handlePostPress}
              onVote={handleVote}
            />
          )}
          keyExtractor={(item) => item.id}
          contentContainerStyle={styles.listContent}
          refreshControl={
            <RefreshControl
              refreshing={isFetching && page === 1}
              onRefresh={handleRefresh}
              tintColor={colors.primary}
              colors={[colors.primary]}
            />
          }
          onEndReached={handleLoadMore}
          onEndReachedThreshold={0.5}
          ListFooterComponent={renderListFooter}
        />
      )}
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  header: {
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.md,
    borderBottomWidth: 1,
    borderBottomColor: colors.border,
  },
  title: {
    fontSize: typography.fontSizes.xxl,
    fontWeight: typography.fontWeights.bold,
    color: colors.text,
  },
  subtitle: {
    fontSize: typography.fontSizes.sm,
    color: colors.textSecondary,
    marginTop: spacing.xxs,
  },
  filterTabs: {
    flexDirection: 'row',
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm,
    backgroundColor: colors.white,
    borderBottomWidth: 1,
    borderBottomColor: colors.border,
  },
  filterTab: {
    paddingHorizontal: spacing.lg,
    paddingVertical: spacing.sm,
    marginRight: spacing.sm,
    borderRadius: 20,
    backgroundColor: colors.background,
  },
  filterTabActive: {
    backgroundColor: colors.primary,
  },
  filterTabText: {
    fontSize: typography.fontSizes.md,
    fontWeight: typography.fontWeights.medium,
    color: colors.textSecondary,
  },
  filterTabTextActive: {
    color: colors.white,
  },
  listContent: {
    paddingVertical: spacing.sm,
  },
  footerLoader: {
    paddingVertical: spacing.md,
  },
});


import React, { useState, useCallback } from 'react';
import { View, Text, FlatList, StyleSheet, TouchableOpacity, RefreshControl } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useQuery, useQueryClient } from '@tanstack/react-query';
import { useNavigation } from '@react-navigation/native';
import { StackNavigationProp } from '@react-navigation/stack';
import { HomeStackParamList } from '../../navigation/types';
import { MenPost, SortType } from '../../types';
import { MenPostCard } from './MenPostCard';
import { LoadingSpinner } from '../../components/ui/LoadingSpinner';
import { EmptyState } from '../../components/ui/EmptyState';
import { getMenPosts, flagMenPost } from '../../services/api/menPosts';
import { colors } from '../../theme/colors';
import { spacing } from '../../theme/spacing';
import { typography } from '../../theme/typography';
import Toast from 'react-native-toast-message';

type HomeScreenNavigationProp = StackNavigationProp<HomeStackParamList, 'HomeList'>;

export function HomeScreen() {
  const navigation = useNavigation<HomeScreenNavigationProp>();
  const [sortBy, setSortBy] = useState<SortType>('hot');
  const [page, setPage] = useState(1);
  const queryClient = useQueryClient();

  // Fetch posts
  const { data, isLoading, isError, refetch, isFetching } = useQuery({
    queryKey: ['menPosts', sortBy, page],
    queryFn: () => getMenPosts(page, 10, sortBy),
    staleTime: 5 * 60 * 1000, // 5 minutes
  });

  // Handle flag voting with optimistic update
  const handleFlag = useCallback(async (postId: string, flag: 'red' | 'green' | 'neutral') => {
    try {
      // Optimistic update
      queryClient.setQueryData(['menPosts', sortBy, page], (old: any) => {
        if (!old) return old;
        
        return {
          ...old,
          data: old.data.map((post: MenPost) => {
            if (post.id !== postId) return post;
            
            const newFlags = { ...post.flags };
            
            // Remove previous flag
            if (post.userFlag) {
              newFlags[post.userFlag]--;
            }
            
            // Add new flag
            newFlags[flag]++;
            
            return {
              ...post,
              flags: newFlags,
              userFlag: flag,
            };
          }),
        };
      });

      // API call
      await flagMenPost(postId, flag);

      Toast.show({
        type: 'success',
        text1: 'Flag Updated',
        text2: 'Your flag has been recorded',
        position: 'bottom',
        visibilityTime: 2000,
      });
    } catch (error) {
      // Revert optimistic update on error
      queryClient.invalidateQueries({ queryKey: ['menPosts', sortBy, page] });
      Toast.show({
        type: 'error',
        text1: 'Error',
        text2: 'Failed to update flag',
        position: 'bottom',
      });
    }
  }, [sortBy, page, queryClient]);

  // Handle post press (navigate to details)
  const handlePostPress = useCallback((post: MenPost) => {
    navigation.navigate('MenPostDetail', { postId: post.id });
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
        <Text style={styles.title}>Home</Text>
        <Text style={styles.subtitle}>Safety Reviews</Text>
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
          icon="🚩"
          title="No posts yet"
          subtitle="Be the first to share a safety review"
        />
      ) : (
        <FlatList
          data={data.data}
          renderItem={({ item }) => (
            <MenPostCard
              post={item}
              onPress={handlePostPress}
              onFlag={handleFlag}
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
    paddingVertical: spacing.md,
  },
  footerLoader: {
    paddingVertical: spacing.md,
  },
});


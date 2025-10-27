import React from 'react';
import { View, Text, StyleSheet, ScrollView, TouchableOpacity, ActivityIndicator, Image } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { StackScreenProps } from '@react-navigation/stack';
import { FeedStackParamList } from '../../navigation/types';
import { Avatar } from '../../components/ui/Avatar';
import { VoteButtons } from '../../components/feed/VoteButtons';
import { EmptyState } from '../../components/ui/EmptyState';
import { colors } from '../../theme/colors';
import { spacing } from '../../theme/spacing';
import { typography } from '../../theme/typography';
import { formatTimeAgo } from '../../utils/timeFormat';

type Props = StackScreenProps<FeedStackParamList, 'FeedPostDetail'>;

export function FeedPostDetailScreen({ route, navigation }: Props) {
  const { postId } = route.params;

  // TODO: Replace with real hook in next step
  const isLoading = false;
  const isError = false;
  const post = null;

  if (isLoading) {
    return (
      <View style={styles.centerContainer}>
        <ActivityIndicator size="large" color={colors.primary} />
      </View>
    );
  }

  if (isError || !post) {
    return (
      <SafeAreaView style={styles.container} edges={['top', 'bottom']}>
        <EmptyState
          icon="⚠️"
          title="Post Not Found"
          subtitle="This post may have been removed or doesn't exist"
        />
        <TouchableOpacity
          style={styles.backButton}
          onPress={() => navigation.goBack()}
        >
          <Text style={styles.backButtonText}>Go Back</Text>
        </TouchableOpacity>
      </SafeAreaView>
    );
  }

  const handleVote = (vote: 'up' | 'down') => {
    // TODO: Implement vote update in next step
    console.log('Vote updated:', vote);
  };

  return (
    <SafeAreaView style={styles.container} edges={['top', 'bottom']}>
      <ScrollView
        style={styles.scrollView}
        contentContainerStyle={styles.scrollContent}
        showsVerticalScrollIndicator={false}
      >
        {/* Author Info */}
        <View style={styles.authorContainer}>
          <Avatar
            name={post?.author?.name || 'User'}
            size={48}
            uri={post?.author?.avatar}
          />
          <View style={styles.authorInfo}>
            <Text style={styles.authorName}>{post?.author?.name || 'Anonymous'}</Text>
            <Text style={styles.timestamp}>
              {formatTimeAgo(post?.createdAt || new Date().toISOString())}
            </Text>
          </View>
        </View>

        {/* Post Title */}
        <Text style={styles.title}>{post?.title || 'Untitled Post'}</Text>

        {/* Post Image (if exists) */}
        {post?.image && (
          <TouchableOpacity
            style={styles.imageContainer}
            onPress={() => {
              // TODO: Open image gallery
              console.log('Open image gallery');
            }}
          >
            <Image source={{ uri: post.image }} style={styles.image} resizeMode="cover" />
          </TouchableOpacity>
        )}

        {/* Post Body */}
        <Text style={styles.body}>{post?.body || 'No content available'}</Text>

        {/* Vote Buttons */}
        <View style={styles.voteContainer}>
          <VoteButtons
            votes={post?.votes || 0}
            userVote={post?.userVote}
            onVote={handleVote}
          />
          <Text style={styles.commentsCount}>
            💬 {post?.commentsCount || 0} comments
          </Text>
        </View>

        {/* Divider */}
        <View style={styles.divider} />

        {/* Comments Section Placeholder */}
        <View style={styles.commentsSection}>
          <Text style={styles.sectionTitle}>Comments</Text>
          <EmptyState
            icon="💬"
            title="Comments Coming Soon"
            subtitle="Comment functionality will be added in the next step"
          />
        </View>
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  centerContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: colors.background,
  },
  scrollView: {
    flex: 1,
  },
  scrollContent: {
    paddingBottom: spacing.xl,
  },
  authorContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    padding: spacing.md,
    borderBottomWidth: 1,
    borderBottomColor: colors.border,
  },
  authorInfo: {
    marginLeft: spacing.sm,
    flex: 1,
  },
  authorName: {
    fontSize: typography.fontSizes.md,
    fontWeight: typography.fontWeights.semibold,
    color: colors.text,
  },
  timestamp: {
    fontSize: typography.fontSizes.sm,
    color: colors.textSecondary,
    marginTop: spacing.xxs,
  },
  title: {
    fontSize: typography.fontSizes.xxl,
    fontWeight: typography.fontWeights.bold,
    color: colors.text,
    padding: spacing.md,
    paddingBottom: spacing.sm,
  },
  imageContainer: {
    width: '100%',
    height: 300,
    backgroundColor: colors.gray200,
    marginBottom: spacing.md,
  },
  image: {
    width: '100%',
    height: '100%',
  },
  body: {
    fontSize: typography.fontSizes.md,
    lineHeight: typography.fontSizes.md * 1.6,
    color: colors.text,
    paddingHorizontal: spacing.md,
    paddingBottom: spacing.md,
  },
  voteContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm,
  },
  commentsCount: {
    fontSize: typography.fontSizes.sm,
    color: colors.textSecondary,
    fontWeight: typography.fontWeights.medium,
  },
  divider: {
    height: 1,
    backgroundColor: colors.border,
    marginVertical: spacing.md,
  },
  commentsSection: {
    padding: spacing.md,
  },
  sectionTitle: {
    fontSize: typography.fontSizes.lg,
    fontWeight: typography.fontWeights.semibold,
    color: colors.text,
    marginBottom: spacing.md,
  },
  backButton: {
    margin: spacing.md,
    padding: spacing.md,
    backgroundColor: colors.primary,
    borderRadius: spacing.sm,
    alignItems: 'center',
  },
  backButtonText: {
    fontSize: typography.fontSizes.md,
    fontWeight: typography.fontWeights.semibold,
    color: colors.white,
  },
});


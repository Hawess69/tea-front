import React from 'react';
import { View, Text, TouchableOpacity, Image, StyleSheet } from 'react-native';
import { FeedPost } from '../../types';
import { Avatar } from '../../components/ui/Avatar';
import { VoteButtons } from '../../components/feed/VoteButtons';
import { colors } from '../../theme/colors';
import { spacing } from '../../theme/spacing';
import { typography } from '../../theme/typography';
import { getTimeAgo } from '../../utils/timeFormat';

interface FeedPostCardProps {
  post: FeedPost;
  onPress: (post: FeedPost) => void;
  onVote: (postId: string, vote: 'up' | 'down') => void;
}

export function FeedPostCard({ post, onPress, onVote }: FeedPostCardProps) {
  const truncateText = (text: string, maxLength: number = 180): string => {
    if (text.length <= maxLength) return text;
    return text.substring(0, maxLength) + '...';
  };

  return (
    <TouchableOpacity style={styles.container} onPress={() => onPress(post)} activeOpacity={0.9}>
      <View style={styles.contentContainer}>
        {/* Vote Buttons (Left) */}
        <VoteButtons
          votes={post.votes}
          userVote={post.userVote}
          onVote={(vote) => onVote(post.id, vote)}
          size="small"
        />

        {/* Main Content (Right) */}
        <View style={styles.mainContent}>
          {/* Author Info */}
          <View style={styles.header}>
            <Avatar name={post.author.name} avatar={post.author.avatar} size="small" />
            <View style={styles.authorInfo}>
              <Text style={styles.authorName}>{post.author.name}</Text>
              <Text style={styles.time}>{getTimeAgo(post.createdAt)}</Text>
            </View>
          </View>

          {/* Title */}
          <Text style={styles.title}>{post.title}</Text>

          {/* Body Preview */}
          <Text style={styles.body}>{truncateText(post.body)}</Text>

          {/* Image Preview (if exists) */}
          {post.image && (
            <Image source={{ uri: post.image }} style={styles.image} resizeMode="cover" />
          )}

          {/* Footer */}
          <View style={styles.footer}>
            <Text style={styles.commentsCount}>💬 {post.commentsCount} comments</Text>
          </View>
        </View>
      </View>
    </TouchableOpacity>
  );
}

const styles = StyleSheet.create({
  container: {
    backgroundColor: colors.white,
    borderRadius: 12,
    marginHorizontal: spacing.md,
    marginBottom: spacing.sm,
    overflow: 'hidden',
    // Shadow for iOS
    shadowColor: colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.08,
    shadowRadius: 4,
    // Elevation for Android
    elevation: 2,
  },
  contentContainer: {
    flexDirection: 'row',
    padding: spacing.md,
  },
  mainContent: {
    flex: 1,
    marginLeft: spacing.sm,
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: spacing.sm,
  },
  authorInfo: {
    marginLeft: spacing.sm,
    flex: 1,
  },
  authorName: {
    fontSize: typography.fontSizes.sm,
    fontWeight: typography.fontWeights.medium,
    color: colors.text,
  },
  time: {
    fontSize: typography.fontSizes.xs,
    color: colors.textSecondary,
    marginTop: 2,
  },
  title: {
    fontSize: typography.fontSizes.lg,
    fontWeight: typography.fontWeights.bold,
    color: colors.text,
    lineHeight: typography.lineHeights.tight,
    marginBottom: spacing.xs,
  },
  body: {
    fontSize: typography.fontSizes.md,
    color: colors.textSecondary,
    lineHeight: typography.lineHeights.relaxed,
    marginBottom: spacing.sm,
  },
  image: {
    width: '100%',
    height: 150,
    borderRadius: 8,
    marginBottom: spacing.sm,
  },
  footer: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  commentsCount: {
    fontSize: typography.fontSizes.sm,
    color: colors.textSecondary,
  },
});


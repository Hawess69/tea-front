import React from 'react';
import { View, Text, TouchableOpacity, StyleSheet } from 'react-native';
import { MenPost } from '../../types';
import { BlurredImage } from '../../components/home/BlurredImage';
import { FlagBar } from '../../components/home/FlagBar';
import { Chip } from '../../components/ui/Chip';
import { colors } from '../../theme/colors';
import { spacing } from '../../theme/spacing';
import { typography } from '../../theme/typography';
import { getTimeAgo } from '../../utils/timeFormat';

interface MenPostCardProps {
  post: MenPost;
  onPress: (post: MenPost) => void;
  onFlag: (postId: string, flag: 'red' | 'green' | 'neutral') => void;
}

export function MenPostCard({ post, onPress, onFlag }: MenPostCardProps) {
  const truncateText = (text: string, maxLength: number = 120): string => {
    if (text.length <= maxLength) return text;
    return text.substring(0, maxLength) + '...';
  };

  return (
    <TouchableOpacity style={styles.container} onPress={() => onPress(post)} activeOpacity={0.9}>
      {/* Blurred Image */}
      <BlurredImage uri={post.photo} height={180} borderRadius={12} />

      {/* Content */}
      <View style={styles.content}>
        {/* Name and City */}
        <View style={styles.header}>
          <Text style={styles.name}>{post.fullName}</Text>
          <Text style={styles.city}>📍 {post.city}</Text>
        </View>

        {/* Tags */}
        <View style={styles.tagsContainer}>
          {post.tags.map((tag, index) => (
            <Chip key={index} label={tag} variant="default" style={styles.tag} />
          ))}
        </View>

        {/* Caption Preview */}
        <Text style={styles.caption}>{truncateText(post.caption)}</Text>

        {/* Flag Bar */}
        <FlagBar flags={post.flags} userFlag={post.userFlag} onFlag={(flag) => onFlag(post.id, flag)} />

        {/* Footer */}
        <View style={styles.footer}>
          <Text style={styles.commentsCount}>💬 {post.commentsCount} comments</Text>
          <Text style={styles.time}>{getTimeAgo(post.createdAt)}</Text>
        </View>
      </View>
    </TouchableOpacity>
  );
}

const styles = StyleSheet.create({
  container: {
    backgroundColor: colors.white,
    borderRadius: 16,
    marginHorizontal: spacing.md,
    marginBottom: spacing.md,
    overflow: 'hidden',
    // Shadow for iOS
    shadowColor: colors.black,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
    // Elevation for Android
    elevation: 3,
  },
  content: {
    padding: spacing.md,
  },
  header: {
    marginBottom: spacing.sm,
  },
  name: {
    fontSize: typography.fontSizes.lg,
    fontWeight: typography.fontWeights.bold,
    color: colors.text,
    marginBottom: spacing.xxs,
  },
  city: {
    fontSize: typography.fontSizes.sm,
    color: colors.textSecondary,
  },
  tagsContainer: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    marginBottom: spacing.sm,
    gap: spacing.xs,
  },
  tag: {
    marginRight: spacing.xs,
    marginBottom: spacing.xs,
  },
  caption: {
    fontSize: typography.fontSizes.md,
    color: colors.text,
    lineHeight: typography.lineHeights.relaxed,
    marginBottom: spacing.md,
  },
  footer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginTop: spacing.sm,
  },
  commentsCount: {
    fontSize: typography.fontSizes.sm,
    color: colors.textSecondary,
  },
  time: {
    fontSize: typography.fontSizes.sm,
    color: colors.textSecondary,
  },
});


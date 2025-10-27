import React, { useState } from 'react';
import { View, Text, StyleSheet, TouchableOpacity } from 'react-native';
import { Avatar } from '../ui/Avatar';
import { VoteButtons } from '../feed/VoteButtons';
import { colors } from '../../theme/colors';
import { spacing } from '../../theme/spacing';
import { typography } from '../../theme/typography';
import { formatTimeAgo } from '../../utils/timeFormat';
import { MenPostComment, FeedPostComment } from '../../types';

interface CommentItemProps {
  comment: MenPostComment | FeedPostComment;
  type: 'men' | 'feed';
  onReply?: (comment: MenPostComment | FeedPostComment) => void;
  onVote?: (commentId: string, vote: 'up' | 'down') => void;
  onDelete?: (commentId: string) => void;
  depth?: number; // For nested comments
  maxDepth?: number; // Maximum nesting level
}

export function CommentItem({
  comment,
  type,
  onReply,
  onVote,
  onDelete,
  depth = 0,
  maxDepth = 3,
}: CommentItemProps) {
  const [isExpanded, setIsExpanded] = useState(depth < 2); // Collapse deep comments by default
  const [showFullText, setShowFullText] = useState(false);

  const isFeedComment = type === 'feed' && 'votes' in comment;
  const hasReplies = comment.replies && comment.replies.length > 0;
  const indentWidth = Math.min(depth * spacing.lg, spacing.lg * maxDepth);

  // Truncate long comments
  const MAX_PREVIEW_LENGTH = 200;
  const shouldTruncate = comment.content.length > MAX_PREVIEW_LENGTH && !showFullText;
  const displayContent = shouldTruncate
    ? comment.content.substring(0, MAX_PREVIEW_LENGTH) + '...'
    : comment.content;

  return (
    <View style={[styles.container, { marginLeft: indentWidth }]}>
      {/* Comment Header */}
      <View style={styles.header}>
        <Avatar name={comment.author.name} size={32} uri={comment.author.avatar} />
        <View style={styles.headerInfo}>
          <Text style={styles.authorName}>{comment.author.name}</Text>
          <Text style={styles.timestamp}>{formatTimeAgo(comment.createdAt)}</Text>
          {comment.isEdited && (
            <Text style={styles.editedLabel}> • edited</Text>
          )}
        </View>
      </View>

      {/* Comment Content */}
      <View style={styles.contentContainer}>
        <Text style={styles.content}>{displayContent}</Text>
        {shouldTruncate && (
          <TouchableOpacity onPress={() => setShowFullText(true)}>
            <Text style={styles.readMore}>Read more</Text>
          </TouchableOpacity>
        )}
      </View>

      {/* Actions */}
      <View style={styles.actions}>
        {/* Vote Buttons (Feed Only) */}
        {isFeedComment && onVote && (
          <View style={styles.voteContainer}>
            <VoteButtons
              votes={(comment as FeedPostComment).votes}
              userVote={(comment as FeedPostComment).userVote}
              onVote={(vote) => onVote(comment.id, vote)}
              compact
            />
          </View>
        )}

        {/* Reply Button */}
        {onReply && depth < maxDepth && (
          <TouchableOpacity
            style={styles.actionButton}
            onPress={() => onReply(comment)}
          >
            <Text style={styles.actionButtonText}>↩️ Reply</Text>
          </TouchableOpacity>
        )}

        {/* Delete Button (placeholder for own comments) */}
        {onDelete && (
          <TouchableOpacity
            style={styles.actionButton}
            onPress={() => onDelete(comment.id)}
          >
            <Text style={[styles.actionButtonText, styles.deleteText]}>🗑️ Delete</Text>
          </TouchableOpacity>
        )}

        {/* Replies Count */}
        {hasReplies && (
          <TouchableOpacity
            style={styles.actionButton}
            onPress={() => setIsExpanded(!isExpanded)}
          >
            <Text style={styles.actionButtonText}>
              {isExpanded ? '▼' : '▶'} {comment.replies!.length} {comment.replies!.length === 1 ? 'reply' : 'replies'}
            </Text>
          </TouchableOpacity>
        )}
      </View>

      {/* Nested Replies */}
      {hasReplies && isExpanded && (
        <View style={styles.repliesContainer}>
          {comment.replies!.map((reply) => (
            <CommentItem
              key={reply.id}
              comment={reply}
              type={type}
              onReply={onReply}
              onVote={onVote}
              onDelete={onDelete}
              depth={depth + 1}
              maxDepth={maxDepth}
            />
          ))}
        </View>
      )}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    marginBottom: spacing.md,
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: spacing.xs,
  },
  headerInfo: {
    marginLeft: spacing.sm,
    flexDirection: 'row',
    alignItems: 'center',
    flex: 1,
  },
  authorName: {
    fontSize: typography.fontSizes.sm,
    fontWeight: typography.fontWeights.semibold,
    color: colors.text,
  },
  timestamp: {
    fontSize: typography.fontSizes.xs,
    color: colors.textSecondary,
    marginLeft: spacing.xs,
  },
  editedLabel: {
    fontSize: typography.fontSizes.xs,
    color: colors.textSecondary,
    fontStyle: 'italic',
  },
  contentContainer: {
    marginLeft: spacing.xl + spacing.sm, // Align with avatar right edge
    marginBottom: spacing.xs,
  },
  content: {
    fontSize: typography.fontSizes.sm,
    lineHeight: typography.fontSizes.sm * 1.5,
    color: colors.text,
  },
  readMore: {
    fontSize: typography.fontSizes.sm,
    color: colors.primary,
    fontWeight: typography.fontWeights.medium,
    marginTop: spacing.xs,
  },
  actions: {
    flexDirection: 'row',
    alignItems: 'center',
    marginLeft: spacing.xl + spacing.sm,
    flexWrap: 'wrap',
  },
  voteContainer: {
    marginRight: spacing.md,
  },
  actionButton: {
    paddingVertical: spacing.xxs,
    paddingHorizontal: spacing.sm,
    marginRight: spacing.sm,
  },
  actionButtonText: {
    fontSize: typography.fontSizes.xs,
    color: colors.textSecondary,
    fontWeight: typography.fontWeights.medium,
  },
  deleteText: {
    color: colors.error,
  },
  repliesContainer: {
    marginTop: spacing.sm,
  },
});


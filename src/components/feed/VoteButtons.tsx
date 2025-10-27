import React from 'react';
import { View, Text, TouchableOpacity, StyleSheet } from 'react-native';
import Animated, { useAnimatedStyle, withSpring } from 'react-native-reanimated';
import { colors } from '../../theme/colors';
import { spacing } from '../../theme/spacing';
import { typography } from '../../theme/typography';

interface VoteButtonsProps {
  votes: number;
  userVote?: 'up' | 'down';
  onVote: (vote: 'up' | 'down') => void;
  disabled?: boolean;
  size?: 'small' | 'medium';
  compact?: boolean; // Horizontal layout for comments
}

export function VoteButtons({ votes, userVote, onVote, disabled = false, size = 'medium', compact = false }: VoteButtonsProps) {
  const isSmall = size === 'small' || compact;

  const getVoteColor = (): string => {
    if (votes > 0) return colors.success;
    if (votes < 0) return colors.error;
    return colors.textSecondary;
  };

  const VoteButton = ({ type, icon }: { type: 'up' | 'down'; icon: string }) => {
    const isSelected = userVote === type;
    const voteColor = type === 'up' ? colors.success : colors.error;

    const animatedStyle = useAnimatedStyle(() => {
      return {
        transform: [
          {
            scale: withSpring(isSelected ? 1.2 : 1, {
              damping: 10,
              stiffness: 100,
            }),
          },
        ],
      };
    });

    return (
      <TouchableOpacity
        onPress={() => !disabled && onVote(type)}
        disabled={disabled}
        activeOpacity={0.7}
        style={[styles.voteButton, isSmall && styles.voteButtonSmall]}
      >
        <Animated.View
          style={[
            styles.voteIconContainer,
            isSmall && styles.voteIconContainerSmall,
            {
              backgroundColor: isSelected ? voteColor + '20' : 'transparent',
            },
            animatedStyle,
          ]}
        >
          <Text
            style={[
              styles.voteIcon,
              isSmall && styles.voteIconSmall,
              { color: isSelected ? voteColor : colors.textSecondary },
            ]}
          >
            {icon}
          </Text>
        </Animated.View>
      </TouchableOpacity>
    );
  };

  return (
    <View style={[styles.container, isSmall && styles.containerSmall, compact && styles.containerCompact]}>
      <VoteButton type="up" icon="⬆️" />
      <Text
        style={[
          styles.voteCount,
          isSmall && styles.voteCountSmall,
          compact && styles.voteCountCompact,
          { color: getVoteColor(), fontWeight: typography.fontWeights.bold },
        ]}
      >
        {votes > 0 ? `+${votes}` : votes}
      </Text>
      <VoteButton type="down" icon="⬇️" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'column',
    alignItems: 'center',
    paddingVertical: spacing.sm,
    paddingHorizontal: spacing.xs,
  },
  containerSmall: {
    paddingVertical: spacing.xs,
    paddingHorizontal: spacing.xxs,
  },
  containerCompact: {
    flexDirection: 'row',
    paddingVertical: 0,
    paddingHorizontal: 0,
  },
  voteButton: {
    padding: spacing.xs,
  },
  voteButtonSmall: {
    padding: spacing.xxs,
  },
  voteIconContainer: {
    width: 36,
    height: 36,
    borderRadius: 18,
    justifyContent: 'center',
    alignItems: 'center',
  },
  voteIconContainerSmall: {
    width: 28,
    height: 28,
    borderRadius: 14,
  },
  voteIcon: {
    fontSize: 18,
  },
  voteIconSmall: {
    fontSize: 14,
  },
  voteCount: {
    fontSize: typography.fontSizes.md,
    marginVertical: spacing.xs,
    minWidth: 36,
    textAlign: 'center',
  },
  voteCountSmall: {
    fontSize: typography.fontSizes.sm,
    marginVertical: spacing.xxs,
    minWidth: 28,
  },
  voteCountCompact: {
    marginVertical: 0,
    marginHorizontal: spacing.xs,
  },
});


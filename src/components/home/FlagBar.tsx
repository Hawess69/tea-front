import React from 'react';
import { View, Text, TouchableOpacity, StyleSheet } from 'react-native';
import Animated, { useAnimatedStyle, withSpring } from 'react-native-reanimated';
import { colors } from '../../theme/colors';
import { spacing } from '../../theme/spacing';
import { typography } from '../../theme/typography';

interface FlagBarProps {
  flags: {
    red: number;
    green: number;
    neutral: number;
  };
  userFlag?: 'red' | 'green' | 'neutral';
  onFlag: (flag: 'red' | 'green' | 'neutral') => void;
  disabled?: boolean;
}

export function FlagBar({ flags, userFlag, onFlag, disabled = false }: FlagBarProps) {
  const getFlagColor = (type: 'red' | 'green' | 'neutral'): string => {
    switch (type) {
      case 'red':
        return '#EF4444'; // Red
      case 'green':
        return '#10B981'; // Green
      case 'neutral':
        return '#6B7280'; // Gray
    }
  };

  const FlagButton = ({ type, count, icon }: { type: 'red' | 'green' | 'neutral'; count: number; icon: string }) => {
    const isSelected = userFlag === type;
    const flagColor = getFlagColor(type);

    const animatedStyle = useAnimatedStyle(() => {
      return {
        transform: [
          {
            scale: withSpring(isSelected ? 1.1 : 1, {
              damping: 10,
              stiffness: 100,
            }),
          },
        ],
      };
    });

    return (
      <TouchableOpacity
        style={styles.flagButton}
        onPress={() => !disabled && onFlag(type)}
        disabled={disabled}
        activeOpacity={0.7}
      >
        <Animated.View
          style={[
            styles.flagIconContainer,
            {
              backgroundColor: isSelected ? flagColor + '20' : 'transparent',
              borderColor: isSelected ? flagColor : colors.border,
            },
            animatedStyle,
          ]}
        >
          <Text style={[styles.flagIcon, { color: flagColor }]}>{icon}</Text>
        </Animated.View>
        <Text style={[styles.flagCount, isSelected && { color: flagColor, fontWeight: typography.fontWeights.bold }]}>
          {count}
        </Text>
      </TouchableOpacity>
    );
  };

  return (
    <View style={styles.container}>
      <FlagButton type="red" count={flags.red} icon="🚩" />
      <FlagButton type="neutral" count={flags.neutral} icon="⚪" />
      <FlagButton type="green" count={flags.green} icon="✅" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-around',
    paddingVertical: spacing.sm,
    paddingHorizontal: spacing.md,
    backgroundColor: colors.background,
    borderRadius: 12,
    borderWidth: 1,
    borderColor: colors.border,
  },
  flagButton: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: spacing.xs,
  },
  flagIconContainer: {
    width: 40,
    height: 40,
    borderRadius: 20,
    justifyContent: 'center',
    alignItems: 'center',
    borderWidth: 2,
    marginBottom: spacing.xs,
  },
  flagIcon: {
    fontSize: 20,
  },
  flagCount: {
    fontSize: typography.fontSizes.sm,
    color: colors.textSecondary,
    fontWeight: typography.fontWeights.medium,
  },
});


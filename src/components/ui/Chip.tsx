import React from 'react';
import { View, Text, StyleSheet, ViewStyle } from 'react-native';
import { colors } from '../../theme/colors';
import { spacing } from '../../theme/spacing';
import { typography } from '../../theme/typography';

interface ChipProps {
  label: string;
  variant?: 'default' | 'primary' | 'secondary';
  style?: ViewStyle;
}

export function Chip({ label, variant = 'default', style }: ChipProps) {
  const getBackgroundColor = () => {
    switch (variant) {
      case 'primary':
        return colors.primary + '20'; // 20% opacity
      case 'secondary':
        return colors.secondary + '20';
      default:
        return colors.gray + '20';
    }
  };

  const getTextColor = () => {
    switch (variant) {
      case 'primary':
        return colors.primary;
      case 'secondary':
        return colors.secondary;
      default:
        return colors.textSecondary;
    }
  };

  return (
    <View style={[styles.chip, { backgroundColor: getBackgroundColor() }, style]}>
      <Text style={[styles.label, { color: getTextColor() }]}>{label}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  chip: {
    paddingHorizontal: spacing.sm,
    paddingVertical: spacing.xs,
    borderRadius: 16,
    alignSelf: 'flex-start',
  },
  label: {
    fontSize: typography.fontSizes.sm,
    fontWeight: typography.fontWeights.medium,
  },
});


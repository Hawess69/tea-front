import React from 'react';
import { View, Text, Image, StyleSheet, ViewStyle } from 'react-native';
import { colors } from '../../theme/colors';
import { spacing } from '../../theme/spacing';
import { typography } from '../../theme/typography';

interface AvatarProps {
  name: string;
  avatar?: string;
  size?: 'small' | 'medium' | 'large';
  style?: ViewStyle;
}

const SIZES = {
  small: 32,
  medium: 40,
  large: 56,
};

const FONT_SIZES = {
  small: typography.fontSizes.sm,
  medium: typography.fontSizes.md,
  large: typography.fontSizes.lg,
};

export function Avatar({ name, avatar, size = 'medium', style }: AvatarProps) {
  const avatarSize = SIZES[size];
  const fontSize = FONT_SIZES[size];

  // Get initials from name
  const getInitials = (fullName: string): string => {
    const names = fullName.trim().split(' ');
    if (names.length === 1) {
      return names[0][0].toUpperCase();
    }
    return (names[0][0] + names[names.length - 1][0]).toUpperCase();
  };

  // Generate consistent color from name
  const getColorFromName = (fullName: string): string => {
    const colors = ['#FF6B6B', '#4ECDC4', '#45B7D1', '#FFA07A', '#98D8C8', '#F7DC6F', '#BB8FCE', '#85C1E2'];
    let hash = 0;
    for (let i = 0; i < fullName.length; i++) {
      hash = fullName.charCodeAt(i) + ((hash << 5) - hash);
    }
    const index = Math.abs(hash) % colors.length;
    return colors[index];
  };

  const backgroundColor = getColorFromName(name);

  return (
    <View style={[styles.container, { width: avatarSize, height: avatarSize }, style]}>
      {avatar ? (
        <Image
          source={{ uri: avatar }}
          style={[styles.image, { width: avatarSize, height: avatarSize }]}
        />
      ) : (
        <View style={[styles.placeholder, { width: avatarSize, height: avatarSize, backgroundColor }]}>
          <Text style={[styles.initials, { fontSize }]}>{getInitials(name)}</Text>
        </View>
      )}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    borderRadius: 999,
    overflow: 'hidden',
  },
  image: {
    borderRadius: 999,
  },
  placeholder: {
    borderRadius: 999,
    justifyContent: 'center',
    alignItems: 'center',
  },
  initials: {
    color: colors.white,
    fontWeight: typography.fontWeights.bold,
  },
});


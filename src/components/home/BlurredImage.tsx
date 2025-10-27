import React, { useState } from 'react';
import { View, Image, StyleSheet, Pressable, Text } from 'react-native';
import { BlurView } from 'expo-blur';
import { colors } from '../../theme/colors';
import { spacing } from '../../theme/spacing';
import { typography } from '../../theme/typography';

interface BlurredImageProps {
  uri: string;
  width?: number | string;
  height?: number;
  borderRadius?: number;
}

export function BlurredImage({ uri, width = '100%', height = 200, borderRadius = 12 }: BlurredImageProps) {
  const [isRevealed, setIsRevealed] = useState(false);

  return (
    <View style={[styles.container, { width, height }]}>
      <Image source={{ uri }} style={[styles.image, { borderRadius }]} resizeMode="cover" />

      {!isRevealed && (
        <>
          <BlurView intensity={80} style={[StyleSheet.absoluteFill, { borderRadius }]} />

          <Pressable
            style={styles.revealOverlay}
            onLongPress={() => setIsRevealed(true)}
            onPressOut={() => setIsRevealed(false)}
            delayLongPress={0}
          >
            <View style={styles.revealHint}>
              <Text style={styles.revealIcon}>👁️</Text>
              <Text style={styles.revealText}>Hold to reveal</Text>
            </View>
          </Pressable>
        </>
      )}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    position: 'relative',
    overflow: 'hidden',
  },
  image: {
    width: '100%',
    height: '100%',
  },
  revealOverlay: {
    ...StyleSheet.absoluteFillObject,
    justifyContent: 'center',
    alignItems: 'center',
  },
  revealHint: {
    backgroundColor: colors.black + 'CC', // 80% opacity
    paddingHorizontal: spacing.lg,
    paddingVertical: spacing.md,
    borderRadius: 24,
    alignItems: 'center',
  },
  revealIcon: {
    fontSize: 32,
    marginBottom: spacing.xs,
  },
  revealText: {
    color: colors.white,
    fontSize: typography.fontSizes.sm,
    fontWeight: typography.fontWeights.medium,
  },
});


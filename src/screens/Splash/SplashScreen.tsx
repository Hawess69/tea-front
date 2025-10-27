import React, { useEffect } from 'react';
import { View, Text, StyleSheet, ActivityIndicator } from 'react-native';
import Animated, { 
  useSharedValue, 
  useAnimatedStyle, 
  withTiming,
  withSequence,
  withDelay 
} from 'react-native-reanimated';
import { colors } from '../../theme/colors';
import { spacing } from '../../theme/spacing';
import { typography } from '../../theme/typography';
import { useAuth } from '../../hooks/useAuth';
import { storageHelpers } from '../../store/storage';

interface SplashScreenProps {
  onFinish: (destination: 'onboarding' | 'auth' | 'main') => void;
}

export function SplashScreen({ onFinish }: SplashScreenProps) {
  const { checkAuth } = useAuth();
  const opacity = useSharedValue(0);
  const scale = useSharedValue(0.3);

  const animatedStyle = useAnimatedStyle(() => ({
    opacity: opacity.value,
    transform: [{ scale: scale.value }],
  }));

  useEffect(() => {
    // Start logo animation
    opacity.value = withTiming(1, { duration: 800 });
    scale.value = withSequence(
      withTiming(1.2, { duration: 600 }),
      withTiming(1, { duration: 200 })
    );

    // Check authentication and navigation after animation
    const initializeApp = async () => {
      await new Promise(resolve => setTimeout(resolve, 2000)); // 2 seconds splash
      
      try {
        const isAuthenticated = await checkAuth();
        const hasCompletedOnboarding = storageHelpers.getOnboardingComplete();
        
        if (isAuthenticated) {
          onFinish('main');
        } else if (hasCompletedOnboarding) {
          onFinish('auth');
        } else {
          onFinish('onboarding');
        }
      } catch (error) {
        console.error('Splash initialization error:', error);
        onFinish('onboarding');
      }
    };

    initializeApp();
  }, []);

  return (
    <View style={styles.container}>
      <Animated.View style={[styles.logoContainer, animatedStyle]}>
        <Text style={styles.logo}>Tea</Text>
        <Text style={styles.tagline}>Safe. Supportive. Together.</Text>
      </Animated.View>
      
      <View style={styles.loaderContainer}>
        <ActivityIndicator size="small" color={colors.white} />
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.primary,
    justifyContent: 'center',
    alignItems: 'center',
  },
  logoContainer: {
    alignItems: 'center',
  },
  logo: {
    fontSize: typography.fontSizes.xxxl * 2,
    fontWeight: typography.fontWeights.bold,
    color: colors.white,
    marginBottom: spacing.md,
  },
  tagline: {
    fontSize: typography.fontSizes.md,
    color: colors.white,
    opacity: 0.9,
    fontWeight: typography.fontWeights.medium,
  },
  loaderContainer: {
    position: 'absolute',
    bottom: spacing.xxxl,
  },
});

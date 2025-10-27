import React, { useRef, useState } from 'react';
import { View, FlatList, StyleSheet, TouchableOpacity, Text, Dimensions } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useTranslation } from 'react-i18next';
import { OnboardingSlide } from '../../components/onboarding/OnboardingSlide';
import { PaginationDots } from '../../components/onboarding/PaginationDots';
import { Button } from '../../components/ui/Button';
import { slides } from './slides';
import { storageHelpers } from '../../store/storage';
import { colors } from '../../theme/colors';
import { spacing } from '../../theme/spacing';
import { typography } from '../../theme/typography';

const { width } = Dimensions.get('window');

interface OnboardingScreenProps {
  onComplete: () => void;
}

export function OnboardingScreen({ onComplete }: OnboardingScreenProps) {
  const { t } = useTranslation();
  const flatListRef = useRef<FlatList>(null);
  const [currentIndex, setCurrentIndex] = useState(0);

  const handleNext = () => {
    if (currentIndex < slides.length - 1) {
      flatListRef.current?.scrollToIndex({
        index: currentIndex + 1,
        animated: true,
      });
    } else {
      handleComplete();
    }
  };

  const handleSkip = () => {
    handleComplete();
  };

  const handleComplete = () => {
    storageHelpers.setOnboardingComplete(true);
    onComplete();
  };

  const handleScroll = (event: any) => {
    const contentOffsetX = event.nativeEvent.contentOffset.x;
    const index = Math.round(contentOffsetX / width);
    setCurrentIndex(index);
  };

  const isLastSlide = currentIndex === slides.length - 1;

  return (
    <SafeAreaView style={styles.container} edges={['top', 'bottom']}>
      <View style={styles.skipContainer}>
        {!isLastSlide && (
          <TouchableOpacity onPress={handleSkip}>
            <Text style={styles.skipText}>{t('onboard.skip')}</Text>
          </TouchableOpacity>
        )}
      </View>

      <FlatList
        ref={flatListRef}
        data={slides}
        renderItem={({ item }) => (
          <OnboardingSlide
            title={t(item.titleKey)}
            subtitle={t(item.subtitleKey)}
            backgroundColor={item.backgroundColor}
            icon={item.icon}
          />
        )}
        keyExtractor={(item) => item.id}
        horizontal
        pagingEnabled
        showsHorizontalScrollIndicator={false}
        onScroll={handleScroll}
        scrollEventThrottle={16}
      />

      <View style={styles.footer}>
        <PaginationDots totalSlides={slides.length} currentSlide={currentIndex} />
        
        <View style={styles.buttonContainer}>
          <Button
            title={isLastSlide ? t('onboard.getStarted') : t('onboard.next')}
            onPress={handleNext}
            variant="primary"
            size="large"
          />
        </View>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.white,
  },
  skipContainer: {
    alignItems: 'flex-end',
    paddingHorizontal: spacing.lg,
    paddingVertical: spacing.md,
    minHeight: 48,
  },
  skipText: {
    fontSize: typography.fontSizes.md,
    color: colors.gray600,
    fontWeight: typography.fontWeights.medium,
  },
  footer: {
    paddingBottom: spacing.lg,
    paddingHorizontal: spacing.lg,
  },
  buttonContainer: {
    marginTop: spacing.lg,
  },
});

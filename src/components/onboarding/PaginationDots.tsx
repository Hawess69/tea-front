import React from 'react';
import { View, StyleSheet } from 'react-native';

interface PaginationDotsProps {
  totalSlides: number;
  currentSlide: number;
}

export function PaginationDots({ totalSlides, currentSlide }: PaginationDotsProps) {
  return (
    <View style={styles.container}>
      {Array.from({ length: totalSlides }).map((_, index) => (
        <View
          key={index}
          style={[
            styles.dot,
            index === currentSlide && styles.activeDot,
          ]}
        />
      ))}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
  },
  dot: {
    width: 8,
    height: 8,
    borderRadius: 4,
    backgroundColor: '#D1D5DB',
    marginHorizontal: 4,
  },
  activeDot: {
    backgroundColor: '#0C3C49',
  },
});

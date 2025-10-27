import React from 'react';
import { View, Text, StyleSheet, ScrollView } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { EmptyState } from '../../components/ui/EmptyState';
import { colors } from '../../theme/colors';
import { spacing } from '../../theme/spacing';
import { typography } from '../../theme/typography';

const upcomingFeatures = [
  '📅 Browse local events and meetups',
  '🎟️ RSVP to events you want to attend',
  '🔔 Get reminders before events start',
  '👥 See who else is attending',
  '🗺️ Find events near you',
  '✨ Create your own events',
];

export function EventsScreen() {
  return (
    <SafeAreaView style={styles.container} edges={['top']}>
      <View style={styles.header}>
        <Text style={styles.title}>Events</Text>
      </View>

      <ScrollView contentContainerStyle={styles.content}>
        <EmptyState
          icon="🎟️"
          title="Discover Local Events"
          subtitle="Connect with the community through events, workshops, and support groups."
        />

        <View style={styles.featuresContainer}>
          <Text style={styles.featuresTitle}>Coming Soon:</Text>
          {upcomingFeatures.map((feature, index) => (
            <View key={index} style={styles.featureItem}>
              <Text style={styles.featureText}>{feature}</Text>
            </View>
          ))}
        </View>
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  header: {
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.md,
    borderBottomWidth: 1,
    borderBottomColor: colors.border,
  },
  title: {
    fontSize: typography.fontSizes.xxl,
    fontWeight: typography.fontWeights.bold,
    color: colors.text,
  },
  content: {
    flex: 1,
    paddingVertical: spacing.xl,
  },
  featuresContainer: {
    paddingHorizontal: spacing.xl,
    marginTop: spacing.xl,
  },
  featuresTitle: {
    fontSize: typography.fontSizes.lg,
    fontWeight: typography.fontWeights.bold,
    color: colors.text,
    marginBottom: spacing.md,
  },
  featureItem: {
    backgroundColor: colors.white,
    padding: spacing.md,
    borderRadius: 8,
    marginBottom: spacing.sm,
    borderWidth: 1,
    borderColor: colors.border,
  },
  featureText: {
    fontSize: typography.fontSizes.md,
    color: colors.text,
  },
});


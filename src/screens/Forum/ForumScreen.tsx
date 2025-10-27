import React from 'react';
import { View, Text, StyleSheet, ScrollView } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { EmptyState } from '../../components/ui/EmptyState';
import { colors } from '../../theme/colors';
import { spacing } from '../../theme/spacing';
import { typography } from '../../theme/typography';

const categories = [
  '💆‍♀️ Self-Care',
  '💼 Work Life',
  '💕 Relationships',
  '🏥 Health & Wellness',
  '🎓 Education',
  '✨ Personal Growth',
];

export function ForumScreen() {
  return (
    <SafeAreaView style={styles.container} edges={['top']}>
      <View style={styles.header}>
        <Text style={styles.title}>Forum</Text>
      </View>

      <ScrollView contentContainerStyle={styles.content}>
        <EmptyState
          icon="💬"
          title="Forum Categories Coming Soon!"
          subtitle="Join discussions in different topics and connect with the community."
        />

        <View style={styles.previewContainer}>
          <Text style={styles.previewTitle}>Upcoming Categories:</Text>
          {categories.map((category, index) => (
            <View key={index} style={styles.categoryItem}>
              <Text style={styles.categoryText}>{category}</Text>
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
  previewContainer: {
    paddingHorizontal: spacing.xl,
    marginTop: spacing.xl,
  },
  previewTitle: {
    fontSize: typography.fontSizes.lg,
    fontWeight: typography.fontWeights.bold,
    color: colors.text,
    marginBottom: spacing.md,
  },
  categoryItem: {
    backgroundColor: colors.white,
    padding: spacing.md,
    borderRadius: 8,
    marginBottom: spacing.sm,
    borderWidth: 1,
    borderColor: colors.border,
  },
  categoryText: {
    fontSize: typography.fontSizes.md,
    color: colors.text,
  },
});


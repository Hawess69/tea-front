import React, { useState } from 'react';
import { View, Text, StyleSheet, ScrollView, TouchableOpacity, ActivityIndicator } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { StackScreenProps } from '@react-navigation/stack';
import { HomeStackParamList } from '../../navigation/types';
import { BlurredImage } from '../../components/home/BlurredImage';
import { FlagBar } from '../../components/home/FlagBar';
import { Chip } from '../../components/ui/Chip';
import { EmptyState } from '../../components/ui/EmptyState';
import { colors } from '../../theme/colors';
import { spacing } from '../../theme/spacing';
import { typography } from '../../theme/typography';
import { formatTimeAgo } from '../../utils/timeFormat';

type Props = StackScreenProps<HomeStackParamList, 'MenPostDetail'>;

export function MenPostDetailScreen({ route, navigation }: Props) {
  const { postId } = route.params;
  const [isRevealed, setIsRevealed] = useState(false);

  // TODO: Replace with real hook in next step
  const isLoading = false;
  const isError = false;
  const post = null;

  if (isLoading) {
    return (
      <View style={styles.centerContainer}>
        <ActivityIndicator size="large" color={colors.primary} />
      </View>
    );
  }

  if (isError || !post) {
    return (
      <SafeAreaView style={styles.container} edges={['bottom']}>
        <EmptyState
          icon="⚠️"
          title="Post Not Found"
          subtitle="This post may have been removed or doesn't exist"
        />
        <TouchableOpacity
          style={styles.backButton}
          onPress={() => navigation.goBack()}
        >
          <Text style={styles.backButtonText}>Go Back</Text>
        </TouchableOpacity>
      </SafeAreaView>
    );
  }

  const handleFlagUpdate = (flag: 'red' | 'green' | 'neutral') => {
    // TODO: Implement flag update in next step
    console.log('Flag updated:', flag);
  };

  return (
    <SafeAreaView style={styles.container} edges={['bottom']}>
      <ScrollView
        style={styles.scrollView}
        contentContainerStyle={styles.scrollContent}
        showsVerticalScrollIndicator={false}
      >
        {/* Image Section */}
        <View style={styles.imageContainer}>
          <BlurredImage
            uri={post?.photo || 'https://via.placeholder.com/400'}
            style={styles.image}
            blurRadius={isRevealed ? 0 : 30}
            onReveal={() => setIsRevealed(true)}
          />
        </View>

        {/* Content Section */}
        <View style={styles.contentContainer}>
          {/* Name and Location */}
          <View style={styles.header}>
            <Text style={styles.name}>{post?.fullName || 'Loading...'}</Text>
            <Text style={styles.location}>📍 {post?.city || 'Unknown'}</Text>
          </View>

          {/* Tags */}
          <View style={styles.tagsContainer}>
            {post?.tags?.map((tag, index) => (
              <Chip key={index} label={tag} variant="outlined" />
            ))}
          </View>

          {/* Caption */}
          <View style={styles.captionContainer}>
            <Text style={styles.captionLabel}>Review:</Text>
            <Text style={styles.caption}>{post?.caption || 'No caption available'}</Text>
          </View>

          {/* Flag Voting */}
          <View style={styles.flagSection}>
            <Text style={styles.sectionTitle}>Community Safety Rating</Text>
            <FlagBar
              flags={post?.flags || { red: 0, green: 0, neutral: 0 }}
              userFlag={post?.userFlag}
              onFlagPress={handleFlagUpdate}
            />
          </View>

          {/* Metadata */}
          <View style={styles.metadata}>
            <Text style={styles.metadataText}>
              Posted {formatTimeAgo(post?.createdAt || new Date().toISOString())}
            </Text>
            <Text style={styles.metadataText}>
              {post?.commentsCount || 0} comments
            </Text>
          </View>

          {/* Comments Section Placeholder */}
          <View style={styles.commentsSection}>
            <Text style={styles.sectionTitle}>Comments</Text>
            <EmptyState
              icon="💬"
              title="Comments Coming Soon"
              subtitle="Comment functionality will be added in the next step"
            />
          </View>
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
  centerContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: colors.background,
  },
  scrollView: {
    flex: 1,
  },
  scrollContent: {
    paddingBottom: spacing.xl,
  },
  imageContainer: {
    width: '100%',
    height: 400,
    backgroundColor: colors.gray200,
  },
  image: {
    width: '100%',
    height: '100%',
  },
  contentContainer: {
    padding: spacing.md,
  },
  header: {
    marginBottom: spacing.md,
  },
  name: {
    fontSize: typography.fontSizes.xxl,
    fontWeight: typography.fontWeights.bold,
    color: colors.text,
    marginBottom: spacing.xs,
  },
  location: {
    fontSize: typography.fontSizes.md,
    color: colors.textSecondary,
  },
  tagsContainer: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    marginBottom: spacing.md,
    gap: spacing.xs,
  },
  captionContainer: {
    marginBottom: spacing.lg,
  },
  captionLabel: {
    fontSize: typography.fontSizes.md,
    fontWeight: typography.fontWeights.semibold,
    color: colors.text,
    marginBottom: spacing.xs,
  },
  caption: {
    fontSize: typography.fontSizes.md,
    lineHeight: typography.fontSizes.md * 1.5,
    color: colors.text,
  },
  flagSection: {
    marginBottom: spacing.lg,
    padding: spacing.md,
    backgroundColor: colors.card,
    borderRadius: spacing.sm,
    borderWidth: 1,
    borderColor: colors.border,
  },
  sectionTitle: {
    fontSize: typography.fontSizes.lg,
    fontWeight: typography.fontWeights.semibold,
    color: colors.text,
    marginBottom: spacing.md,
  },
  metadata: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    paddingVertical: spacing.sm,
    borderTopWidth: 1,
    borderBottomWidth: 1,
    borderColor: colors.border,
    marginBottom: spacing.lg,
  },
  metadataText: {
    fontSize: typography.fontSizes.sm,
    color: colors.textSecondary,
  },
  commentsSection: {
    marginTop: spacing.md,
  },
  backButton: {
    margin: spacing.md,
    padding: spacing.md,
    backgroundColor: colors.primary,
    borderRadius: spacing.sm,
    alignItems: 'center',
  },
  backButtonText: {
    fontSize: typography.fontSizes.md,
    fontWeight: typography.fontWeights.semibold,
    color: colors.white,
  },
});


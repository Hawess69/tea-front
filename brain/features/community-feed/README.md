---
feature: community-feed
status: stable
priority: high
owner: cursor
last_updated: 2025-10-24
tags: [feed, community, discussions, voting, core-feature]
---

# Community Feed Feature

## What
The Feed screen displays Reddit-style community discussions where women can share experiences, ask questions, and discuss various topics. Users can upvote/downvote posts and comments.

## Why
This feature creates a supportive community space for general discussions beyond specific safety reviews. It allows for broader conversations about experiences, advice-seeking, and community building.

## Current Status
🟢 Complete - Phase 3

## Key Files
- Screen: `src/screens/Feed/FeedScreen.tsx`
- Card Component: `src/screens/Feed/FeedPostCard.tsx`
- Vote Component: `src/components/feed/VoteButtons.tsx`
- API Service: `src/services/api/feed.ts`
- Mock Data: `src/services/mock/feedData.ts`

## Features Implemented

### Core Functionality
- ✅ Feed posts with pagination
- ✅ Three filter tabs: Hot, New, Top
- ✅ Upvote/Downvote voting system
- ✅ Optimistic UI updates for votes
- ✅ Pull-to-refresh
- ✅ Infinite scroll
- ✅ Comments count display
- ✅ Time ago display
- ✅ Author avatar and name
- ✅ Optional image preview

### Sorting Algorithms
- **Hot**: `votes / (hoursAgo + 2)^1.5` (Reddit algorithm)
- **New**: Timestamp descending
- **Top**: Vote count descending

### UI/UX Features
- Smooth voting animations
- Vote count color coding (green positive, red negative, gray neutral)
- Truncated body text with "..." for preview
- Image preview with proper aspect ratio
- Safe area handling
- Empty states
- Loading states
- Error handling with toast messages

## Data Structure
```typescript
interface FeedPost {
  id: string;
  author: { name: string; avatar: string };
  title: string;
  body: string;
  image?: string;
  votes: number; // net votes (upvotes - downvotes)
  userVote?: 'up' | 'down';
  commentsCount: number;
  createdAt: string;
}
```

## Dependencies
- External: `@tanstack/react-query`, `react-native-reanimated`
- Internal: Avatar, VoteButtons, EmptyState, LoadingSpinner components

## Next Steps
- [ ] Implement detail view with full comments section (Phase 4)
- [ ] Add post creation composer (Phase 4)
- [ ] Implement comment voting (Phase 4)
- [ ] Add search functionality (Phase 4)
- [ ] Add share functionality (Phase 4)
- [ ] Integrate with real Laravel API (Phase 6)


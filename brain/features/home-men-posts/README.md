---
feature: home-men-posts
status: stable
priority: high
owner: cursor
last_updated: 2025-10-24
tags: [home, men-posts, safety-reviews, flags, core-feature]
---

# Home - Men Posts Feature

## What
The Home screen displays a feed of "men posts" - safety reviews where women can share experiences and rate men using a red/green/neutral flag system. This is one of the two core features of the Tea app.

## Why
This feature provides a safe space for women to warn each other about potentially dangerous individuals and share positive experiences. The flagging system allows for quick visual assessment of safety concerns.

## Current Status
🟢 Complete - Phase 3

## Key Files
- Screen: `src/screens/Home/HomeScreen.tsx`
- Card Component: `src/screens/Home/MenPostCard.tsx`
- Flag Component: `src/components/home/FlagBar.tsx`
- Blurred Image: `src/components/home/BlurredImage.tsx`
- API Service: `src/services/api/menPosts.ts`
- Mock Data: `src/services/mock/menPostsData.ts`

## Features Implemented

### Core Functionality
- ✅ Men posts feed with pagination
- ✅ Three filter tabs: Hot, New, Top (Red)
- ✅ Blurred images with hold-to-reveal gesture
- ✅ Red/Green/Neutral flag voting system
- ✅ Optimistic UI updates for flags
- ✅ Pull-to-refresh
- ✅ Infinite scroll
- ✅ Comments count display
- ✅ Time ago display
- ✅ Tag chips (Gym, Instagram, etc.)
- ✅ City location display

### Sorting Algorithms
- **Hot**: `(red + 0.5*neutral - 0.2*green) / (1+hours)^1.3`
- **New**: Timestamp descending
- **Top**: Red count descending

### UI/UX Features
- Smooth animations with react-native-reanimated
- Safe area handling
- Empty states
- Loading states
- Error handling with toast messages
- Responsive card layout

## Data Structure
```typescript
interface MenPost {
  id: string;
  photo: string; // URL to blurred photo
  fullName: string;
  city: string;
  tags: string[];
  caption: string;
  flags: { red: number; green: number; neutral: number };
  userFlag?: 'red' | 'green' | 'neutral';
  commentsCount: number;
  createdAt: string;
}
```

## Dependencies
- External: `@tanstack/react-query`, `react-native-reanimated`, `expo-blur`
- Internal: Avatar, Chip, EmptyState, LoadingSpinner components

## Next Steps
- [ ] Implement detail view with full comments section (Phase 4)
- [ ] Add post creation composer (Phase 4)
- [ ] Implement search functionality (Phase 4)
- [ ] Add share functionality (Phase 4)
- [ ] Integrate with real Laravel API (Phase 6)


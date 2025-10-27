---
feature: men-posts
status: not-started
priority: critical
owner: cursor
last_updated: 2025-01-27
tags: [core-feature, privacy, rating-system]
---

# Men Posts Feature

## What
Core feature allowing women to safely post about men with photo blur protection, rating system (red/green/neutral), and community moderation.

## Why
Primary value proposition - safe space for women to share experiences and warn others about problematic men while protecting privacy.

## Current Status
- 🟢 **Not Started**: Men posts feed
- ⚪ **Not Started**: Post creation flow
- ⚪ **Not Started**: Rating system
- ⚪ **Not Started**: Comment system

## Key Files
- Source: `/src/screens/Home/`
- Components: `/src/components/men-posts/`
- API: `/src/api/men-posts.ts`

## Dependencies
- External libs: expo-image-picker, expo-blur, react-native-gesture-handler
- Internal features: authentication, navigation, notifications

## Core Functionality
1. **Feed Display**: Blurred photos with hold-to-reveal
2. **Post Creation**: Photo upload with auto-blur and watermark
3. **Rating System**: Red/Green/Neutral flagging
4. **Comments**: Community discussion on posts
5. **Alerts**: Track specific names for notifications

## API Integration
- `GET /api/v1/men/posts` - Fetch posts with sorting
- `POST /api/v1/men/posts` - Create new post
- `POST /api/v1/men/posts/:id/flag` - Rate post
- `GET /api/v1/men/posts/:id/comments` - Get comments
- `POST /api/v1/men/posts/:id/comments` - Add comment

## Privacy & Security
- **Image Protection**: Auto-blur, EXIF stripping, watermarks
- **Content Moderation**: Report system, admin controls
- **Data Privacy**: Secure storage, encrypted transmission
- **User Safety**: Alert system, content warnings

## Sorting Algorithms
- **Hot**: `(red + 0.5*neutral - 0.2*green) / (1+hours)^1.3`
- **New**: Timestamp descending
- **Top**: Red count descending

## Next Steps
- [ ] Create men posts feed screen
- [ ] Implement post creation flow
- [ ] Add rating system
- [ ] Build comment system
- [ ] Add alert functionality
- [ ] Implement sorting algorithms
- [ ] Add privacy protections



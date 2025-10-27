---
feature: feed
status: not-started
priority: high
owner: cursor
last_updated: 2025-01-27
tags: [community, reddit-style, voting]
---

# Community Feed Feature

## What
Reddit-style community discussion platform where women can post general topics, vote on content, and engage in conversations.

## Why
Builds community engagement and provides a space for general discussions, advice sharing, and topic-based conversations.

## Current Status
- 🟢 **Not Started**: Feed display
- ⚪ **Not Started**: Post creation
- ⚪ **Not Started**: Voting system
- ⚪ **Not Started**: Comment system

## Key Files
- Source: `/src/screens/Feed/`
- Components: `/src/components/feed/`
- API: `/src/api/feed.ts`

## Dependencies
- External libs: react-native-gesture-handler, react-native-reanimated
- Internal features: authentication, navigation, notifications

## Core Functionality
1. **Feed Display**: Post cards with voting buttons
2. **Post Creation**: Text and image posts
3. **Voting System**: Upvote/downvote with counts
4. **Comments**: Nested comment threads
5. **Sorting**: Hot, New, Top algorithms

## API Integration
- `GET /api/v1/feed/posts` - Fetch posts with sorting
- `POST /api/v1/feed/posts` - Create new post
- `POST /api/v1/feed/posts/:id/vote` - Vote on post
- `GET /api/v1/feed/posts/:id/comments` - Get comments
- `POST /api/v1/feed/posts/:id/comments` - Add comment

## Sorting Algorithms
- **Hot**: Based on vote ratio and recency
- **New**: Timestamp descending
- **Top**: Vote count descending

## UI Components
- **Post Card**: Author, title, content, voting, comments
- **Voting Buttons**: Upvote/downvote with counts
- **Comment Thread**: Nested replies
- **Post Creation**: Rich text editor with image support

## Next Steps
- [ ] Create feed screen layout
- [ ] Implement post creation
- [ ] Add voting system
- [ ] Build comment system
- [ ] Implement sorting algorithms
- [ ] Add image support
- [ ] Create post detail screen



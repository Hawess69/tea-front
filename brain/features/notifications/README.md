---
feature: notifications
status: not-started
priority: high
owner: cursor
last_updated: 2025-01-27
tags: [notifications, alerts, engagement]
---

# Notifications System

## What
Push notification system for alerts, comments, events, and community engagement with local and remote notification support.

## Why
Critical for user engagement, alert system functionality, and keeping users informed about relevant activity.

## Current Status
- 🟢 **Not Started**: Push notification setup
- ⚪ **Not Started**: Alert system
- ⚪ **Not Started**: Local notifications
- ⚪ **Not Started**: Notification management

## Key Files
- Source: `/src/services/notifications/`
- Components: `/src/components/notifications/`
- API: `/src/api/notifications.ts`

## Dependencies
- External libs: expo-notifications, expo-device
- Internal features: authentication, API client, storage

## Core Functionality
1. **Push Notifications**: Expo push notifications
2. **Alert System**: Name tracking with notifications
3. **Local Notifications**: Event reminders
4. **Notification Center**: In-app notification management
5. **Settings**: Notification preferences

## API Integration
- `POST /api/v1/users/token` - Register push token
- `GET /api/v1/notifications` - Fetch notifications
- `POST /api/v1/notifications/:id/read` - Mark as read
- `POST /api/v1/alerts` - Create alert
- `DELETE /api/v1/alerts/:id` - Remove alert

## Notification Types
- **Alert Matches**: New men posts matching tracked names
- **Comments**: Replies to user posts
- **Events**: Event reminders and updates
- **Admin**: System announcements
- **Community**: Trending posts, new followers

## Local Notifications
- **Event Reminders**: 30 minutes before events
- **Alert Matches**: Immediate notification for tracked names
- **Offline Alerts**: Queue notifications when offline

## Next Steps
- [ ] Setup Expo notifications
- [ ] Implement push token registration
- [ ] Create alert system
- [ ] Add local notification scheduling
- [ ] Build notification center
- [ ] Add notification settings
- [ ] Implement offline queuing



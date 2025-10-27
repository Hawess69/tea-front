---
feature: authentication
status: not-started
priority: high
owner: cursor
last_updated: 2025-01-27
tags: [auth, security, user-flow]
---

# Authentication System

## What
User authentication system with email/password or phone login, session persistence, and secure token management.

## Why
Essential foundation for user identity, data security, and personalized experience. Required for all app features.

## Current Status
- 🟢 **Not Started**: Core authentication flow
- ⚪ **Not Started**: Session management
- ⚪ **Not Started**: Security implementation

## Key Files
- Source: `/src/screens/Auth/`
- API: `/src/api/auth.ts`
- Storage: `/src/utils/secureStorage.ts`

## Dependencies
- External libs: expo-secure-store, axios
- Internal features: navigation, API client

## User Flow
1. **Onboarding** → Welcome screens, feature introduction
2. **Login/Register** → Email/password or phone authentication
3. **Session Persistence** → Automatic login on app restart
4. **Profile Setup** → Basic user information

## API Integration
- `POST /api/v1/auth/login` - User login
- `POST /api/v1/auth/register` - User registration
- `POST /api/v1/auth/logout` - User logout
- `GET /api/v1/auth/me` - Get current user

## Security Features
- Token-based authentication (Laravel Sanctum)
- Secure token storage (Expo SecureStore)
- Automatic token refresh
- Session timeout handling

## Next Steps
- [ ] Create authentication screens
- [ ] Implement API integration
- [ ] Add secure storage
- [ ] Handle session persistence
- [ ] Add error handling
- [ ] Create user profile management



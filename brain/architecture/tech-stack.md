---
tech_stack: tea-app
status: defined
priority: high
owner: cursor
last_updated: 2025-01-27
tags: [react-native, expo, typescript, tech-stack]
---

# Tea App - Technology Stack

## Core Framework
- **React Native**: Cross-platform mobile development
- **Expo SDK 51**: Managed workflow with latest features
- **TypeScript**: Type safety and better developer experience

## Phase 1 Dependencies Added (2025-10-24)
### Navigation
- @react-navigation/native: ^6.1.9
- @react-navigation/stack: ^6.3.20
- @react-navigation/bottom-tabs: ^6.5.11
- react-native-screens: ^3.29.0
- react-native-safe-area-context: ^4.8.2

### State Management & Storage
- zustand: ^4.4.7
- @tanstack/react-query: ^5.17.0
- react-native-mmkv: ^2.12.2

### Forms & Validation
- react-hook-form: ^7.48.2
- zod: ^3.22.4
- @hookform/resolvers: ^3.3.2

### Internationalization
- i18next: ^23.7.6
- react-i18next: ^13.5.0
- expo-localization: ~14.3.0

### UI & Utilities
- react-native-svg: ^14.1.0
- react-native-toast-message: ^2.2.0

## UI & Styling
- **NativeWind**: Tailwind CSS for React Native
- **React Native Paper**: Material Design components
- **React Native Reanimated**: Smooth animations
- **React Native Gesture Handler**: Touch interactions

## Navigation & Routing
- **React Navigation**: Tab and stack navigation
- **Expo Router**: File-based routing (if using)
- **Deep Linking**: Universal links support

## State Management & Data
- **React Query**: Server state management and caching
- **React Context**: Global app state
- **AsyncStorage**: Local persistence
- **Axios**: HTTP client for API calls

## Internationalization
- **react-i18next**: Internationalization framework
- **expo-localization**: Device locale detection
- **RTL Support**: Right-to-left layout for Arabic

## Notifications
- **Expo Notifications**: Push and local notifications
- **Expo Push Notifications**: Backend integration
- **Local Scheduling**: Event reminders

## Media & Images
- **Expo ImagePicker**: Camera and gallery access
- **Expo BlurView**: Image blur effects
- **React Native Fast Image**: Optimized image loading

## Development Tools
- **Expo Go**: Development client
- **EAS Build**: Production builds
- **EAS Update**: Over-the-air updates
- **Jest**: Unit testing
- **React Native Testing Library**: Component testing

## Backend Integration
- **Laravel API v1**: RESTful backend
- **Laravel Sanctum**: Token authentication
- **JSON API**: Standardized response format

## Performance & Optimization
- **React Native Performance**: 60fps target
- **Code Splitting**: Lazy loading components
- **Image Optimization**: WebP format, lazy loading
- **Memory Management**: Proper cleanup and memoization

## Security
- **Expo SecureStore**: Secure data storage
- **HTTPS**: Encrypted API communication
- **Image Protection**: EXIF stripping, watermarks
- **Content Moderation**: Report and flag system

## Deployment
- **EAS Build**: iOS and Android builds
- **App Store Connect**: iOS distribution
- **Google Play Console**: Android distribution
- **Expo Updates**: OTA updates for non-native changes

## Development Environment
- **Node.js**: Runtime environment
- **npm/yarn**: Package management
- **Git**: Version control
- **Cursor/VS Code**: IDE with React Native extensions
- **Expo CLI**: Development commands
- **EAS CLI**: Build and deployment commands



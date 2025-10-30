# Tea App - Flutter Mobile Application

A women-first social platform built with Flutter, featuring community feed, men posts, forums, events, and alerts.

## Project Overview

Tea is a comprehensive social platform that enables:
- Community discussions and voting (Reddit-style feed)
- Men posts with blur protection and flagging system
- Forums and events
- Alert notifications for tracked names
- Full bilingual support (English/Arabic) with RTL

## Tech Stack

- **Framework:** Flutter (Dart SDK 3.6.0+)
- **State Management:** Riverpod 2.6.1
- **Navigation:** GoRouter 14.6.2
- **Networking:** Dio 5.7.0
- **Storage:** Hive + Flutter Secure Storage
- **Localization:** easy_localization 3.0.7
- **Code Generation:** Freezed + JSON Serializable + Riverpod Generator

## Project Structure

```
lib/
├── core/
│   ├── constants/     # API endpoints, colors, strings
│   ├── theme/         # App theme configuration
│   ├── utils/         # Validators and utilities
│   └── router/        # App routing configuration
├── data/
│   ├── models/        # Data models (User, FeedPost, MenPost, Comment)
│   ├── repositories/  # Data access layer
│   └── services/      # API client and storage services
└── presentation/
    ├── screens/       # UI screens (auth, home, feed, etc.)
    ├── widgets/       # Reusable widgets
    └── providers/     # Riverpod providers
```

## Setup Instructions

### Prerequisites
- Flutter SDK 3.6.0 or higher
- Dart 3.6.0 or higher
- Android Studio / VS Code with Flutter extension

### Installation

1. Navigate to project directory:
```bash
cd tea_app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Generate code (models, providers):
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Run the app:
```bash
flutter run
```

## Configuration

### Backend API
The app connects to a Laravel backend API. Update the base URL in:
```
lib/core/constants/api_endpoints.dart
```

Default: `http://localhost:8000/api/v1`

### Environment Setup
For production, update:
- API base URLs
- Firebase configuration (for push notifications)
- App icons and splash screens

## Features Implemented

✅ Project structure and dependencies
✅ Core infrastructure (API client, storage, models)
✅ Authentication (login, register, logout)
✅ Routing with GoRouter
✅ Theme system with light/dark modes

## Features In Progress

🔄 Navigation structure (bottom bar, app bar)
🔄 Men Posts feed
🔄 Community Feed
🔄 Forums and Events
🔄 Alerts and Notifications
🔄 RTL support for Arabic

## Development Workflow

### Adding New Features
1. Create models in `lib/data/models/`
2. Create repositories in `lib/data/repositories/`
3. Create providers in `lib/presentation/providers/`
4. Create screens in `lib/presentation/screens/`
5. Run code generation: `flutter pub run build_runner build`
6. Test and iterate

### Running Tests
```bash
flutter test
```

### Building Release
```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

## API Integration

The app integrates with a Laravel REST API. See `../../apis.md` for complete API documentation.

Key endpoints:
- Authentication: `/api/v1/auth/register`, `/api/v1/auth/login`
- Feed Posts: `/api/v1/feed/posts`
- Men Posts: `/api/v1/men/posts`
- Alerts: `/api/v1/alerts`
- Events: `/api/v1/events`

## State Management

Using Riverpod for:
- Authentication state
- Feed posts
- Men posts
- User profile
- Navigation state

## Localization

Supported languages:
- English (default)
- Arabic (RTL support)

Translation files located in `assets/translations/`

## Contributing

1. Follow Flutter and Dart style guidelines
2. Use Freezed for immutable models
3. Generate code with build_runner
4. Write tests for new features
5. Update documentation

## License

Private project - All rights reserved

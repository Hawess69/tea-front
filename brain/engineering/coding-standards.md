---
section: engineering
last_updated: 2025-01-27
language: dart
---

# Coding Standards

## Dart Style Guide
Follow [Effective Dart](https://dart.dev/guides/language/effective-dart)

## Code Style
- Use `dart format` or configure VS Code
- Follow consistent spacing and indentation
- Use trailing commas

## Naming Conventions
```dart
// Files
user_profile.dart

// Classes
class UserProfile {}

// Variables
final userName = 'John';

// Constants
const MAX_RETRY_COUNT = 3;

// Private members
final _privateField = 0;
```

## Documentation
- Public APIs must be documented
- Use dartdoc comments
- Include examples for complex functions

## Best Practices
- Use `const` when possible
- Prefer final over var
- Use sound null safety
- Avoid dynamic types
- Handle errors properly
- Use async/await over Future.then


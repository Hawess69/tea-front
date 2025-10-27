---
section: architecture
last_updated: 2025-01-27
---

# Architectural Patterns

## Patterns in Use

### Clean Architecture
- **Purpose:** Separation of concerns
- **Layers:** 
  - Presentation (UI)
  - Domain (Business logic)
  - Data (API/DB)

### Repository Pattern
- **Purpose:** Abstract data sources
- **Implementation:** [TBD]

### BLoC Pattern (if using)
- **Purpose:** State management
- **Usage:** [TBD]

## Code Organization
```
lib/
  ├── features/
  │   └── [feature-name]/
  │       ├── data/
  │       ├── domain/
  │       └── presentation/
  ├── core/
  ├── shared/
  └── main.dart
```

## Naming Conventions
- Files: snake_case (user_profile.dart)
- Classes: PascalCase (UserProfile)
- Variables: camelCase (userName)
- Constants: UPPER_SNAKE_CASE (MAX_RETRY_COUNT)

## Design Principles
- SOLID principles
- DRY (Don't Repeat Yourself)
- KISS (Keep It Simple, Stupid)
- YAGNI (You Aren't Gonna Need It)


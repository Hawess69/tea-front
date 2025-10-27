---
section: architecture
last_updated: 2025-01-27
---

# Architecture Decision Records (ADRs)

## ADR-001: Laravel Backend with Sanctum Authentication
**Date:** 2025-01-27  
**Status:** Accepted

**Context:**
Tea app needs a secure backend with authentication, feed posts, men posts, comments, voting, alerts, and notifications.

**Decision:**
Use Laravel REST API with Sanctum for token-based authentication.

**Rationale:**
- Backend already developed and documented (see `apis.md`)
- Sanctum provides lightweight token-based auth
- RESTful API is straightforward for mobile consumption
- All endpoints tested and working

**Alternatives Considered:**
1. **Firebase**
   - Pros: No backend dev needed, real-time features
   - Cons: Less control, vendor lock-in, higher costs at scale
   
2. **Supabase**
   - Pros: PostgreSQL, real-time, easier dev
   - Cons: Changing backend now would mean rebuilding API

**Consequences:**
- Positive: Backend ready, tested, and documented
- Positive: Full control over data and security
- Negative: Must maintain Laravel backend ourselves

---

## ADR-002: Flutter with Clean Architecture
**Date:** 2025-01-27  
**Status:** Accepted

**Context:**
Need cross-platform mobile app (iOS + Android) with maintainable codebase.

**Decision:**
Use Flutter with clean architecture (Data → Domain → Presentation layers).

**Rationale:**
- Single codebase for iOS and Android
- Clean architecture separates concerns, easier to test
- Flutter's hot reload speeds up development
- Good performance for complex UIs

**Alternatives Considered:**
1. **React Native**
   - Pros: Large ecosystem, JavaScript familiarity
   - Cons: Platform-specific code needed, performance concerns
   
2. **Native iOS/Android**
   - Pros: Best performance and platform integration
   - Cons: Two codebases, longer development time

**Consequences:**
- Positive: Faster development with single codebase
- Positive: Clean architecture makes testing easier
- Negative: Flutter learning curve if team not familiar

---

## ADR-003: State Management - Riverpod or BLoC
**Date:** 2025-01-27  
**Status:** Under Evaluation

**Context:**
Need state management for complex app with feeds, comments, voting, alerts.

**Decision:**
Evaluating Riverpod vs BLoC pattern.

**Rationale:**
- Both provide clean separation of UI and business logic
- BLoC pattern is widely documented and proven
- Riverpod is modern, compile-time safe, good for testing
- PRD mentions both as options

**Alternatives:**
1. **Provider**
   - Considered but Riverpod is more modern
2. **GetX**
   - Mentioned in PRD but concerned about dependency issues
3. **setState + InheritedWidget**
   - Too low-level for this project

**Decision Status:** Will evaluate both in first sprint and choose

---

## ADR-004: Material Design with Custom Branding
**Date:** 2025-01-27  
**Status:** Accepted

**Context:**
App needs branded UI that's accessible and performant.

**Decision:**
Use Flutter Material Design with Tea-specific colors and widgets.

**Rationale:**
- Leverages Flutter's built-in Material widgets
- Easier to maintain than fully custom UI
- Still allows brand customization (colors, fonts, shapes)
- Good accessibility support out of the box

**Alternatives:**
1. **Fully Custom UI**
   - Pros: Complete brand control
   - Cons: More work, must rebuild accessibility
2. **Cupertino Design**
   - iOS-first doesn't fit the brand
   - Doesn't work for both platforms well

**Consequences:**
- Positive: Faster development with Material widgets
- Positive: Built-in accessibility
- Negative: Some Material constraints (but customizable)

---

*Add new ADRs here as decisions are made*

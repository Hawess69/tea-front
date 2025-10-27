---
section: project-memory
last_updated: 2025-01-27
---

# Open Questions

## ✅ Resolved Decisions

### Technical
- [x] **State management:** Riverpod/BLoC (as per PRD)
  - Decision: Using Riverpod or BLoC pattern as per PRD
  - Context: Clean architecture with Flutter best practices
  - Impact: Entire app architecture based on this

- [x] **Backend:** Laravel REST API
  - Decision: Laravel backend with Sanctum authentication
  - Context: Backend is already developed and documented
  - API Base: `http://localhost:8000/api/v1` (dev) / `https://api.tea.com/v1` (prod)
  - Impact: Full API integration required

- [x] **Navigation:** GoRouter or standard Navigator
  - Decision: Will use GoRouter or standard Flutter navigation
  - Context: Based on project requirements
  - Impact: Routing and deep linking

### Product
- [x] **MVP features:** Defined in PRD
  - Decision: All MVP features documented in PRD
  - Context: Auth, Men Posts, Feed, Forums, Events, Alerts, Notifications
  - Impact: Clear development roadmap

- [x] **Target users:** Women-first social platform
  - Decision: Women using Tea app for safety, community, and information
  - Context: Safety-focused community app
  - Impact: Drives design and features

### Design
- [x] **UI theme:** Material Design with custom branding
  - Decision: Material Design with Tea-specific colors and widgets
  - Context: Flutter Material + custom widgets
  - Impact: Branded experience while leveraging Flutter's Material

- [x] **Color scheme:** Tea brand colors from PRD
  - Decision: Primary #0C3C49 (Deep teal), Accent #2D8C3C, Cream #F9F6F2
  - Context: Already defined in design docs
  - Impact: Brand identity established

## Pending Investigations
- [ ] Research Flutter best practices
- [ ] Investigate performance optimization techniques
- [ ] Evaluate testing frameworks
- [ ] Review accessibility guidelines for Flutter

## Blocking Issues
None currently

## How to Use
1. Add new questions as they arise
2. Mark as "resolved" when answered
3. Move to decisions-log.md when decided
4. Update status regularly


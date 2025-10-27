---
feature: worklets-fix
active_bugs: 0
resolved_bugs: 1
---

# Bugs for Worklets Fix

## Active Bugs 🔥
[None]

## Resolved Bugs ✅

### Worklets Version Mismatch Error
- **Severity:** Critical
- **Description:** WorkletsError: Mismatch between JavaScript part and native part of Worklets (0.6.1 vs 0.5.1)
- **Reproduce:** Launch app after dependency updates
- **Expected:** App launches successfully
- **Actual:** App crashes with version mismatch error
- **Workaround:** None - required complete fix
- **Reported:** 2025-01-27
- **Resolution:** 
  1. Cleaned npm cache and node_modules
  2. Reinstalled dependencies
  3. Added babel.config.js with react-native-reanimated plugin
  4. Added metro.config.js for proper platform handling
- **Fixed In:** 2025-01-27
- **Resolved:** 2025-01-27

## Bug Patterns
- **Pattern:** Version mismatches between JS and native parts of worklets
- **Root cause:** Cached dependencies and missing configuration files
- **Prevention:** 
  - Always clean cache when updating react-native-reanimated
  - Ensure babel.config.js includes react-native-reanimated/plugin
  - Keep metro.config.js properly configured
  - Regular dependency audits

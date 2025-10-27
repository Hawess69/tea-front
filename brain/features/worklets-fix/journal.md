---
feature: worklets-fix
last_updated: 2025-01-27
---

# Worklets Fix Journal

## 2025-01-27 - Initial Issue Report
🐛 **Issue**: WorkletsError: Mismatch between JavaScript part and native part of Worklets (0.6.1 vs 0.5.1)

**Error Details**:
- JavaScript version: 0.6.1
- Native version: 0.5.1
- Caused by react-native-reanimated dependency on react-native-worklets
- Prevented app from launching completely

**Root Cause Analysis**:
- Version mismatch between JS and native parts of worklets library
- Likely caused by cached dependencies or incomplete updates
- Common issue with react-native-reanimated after dependency changes

## 2025-01-27 - Solution Implementation
✅ **Step 1**: Cleaned npm cache
```bash
npm cache clean --force
```

✅ **Step 2**: Removed node_modules directory
```bash
Remove-Item -Recurse -Force node_modules
```

✅ **Step 3**: Reinstalled all dependencies
```bash
npm install
```

✅ **Step 4**: Created babel.config.js
```javascript
module.exports = function (api) {
  api.cache(true);
  return {
    presets: ['babel-preset-expo'],
    plugins: [
      'react-native-reanimated/plugin',
    ],
  };
};
```

✅ **Step 5**: Created metro.config.js
```javascript
const { getDefaultConfig } = require('expo/metro-config');

const config = getDefaultConfig(__dirname);
config.resolver.platforms = ['ios', 'android', 'native', 'web'];

module.exports = config;
```

## 2025-01-27 - Current Session Issues
🐛 **Issues Identified**:
1. ✅ App entry point named 'main' was not registered - RESOLVED
2. ✅ New Architecture warning: "newArchEnabled": false conflicts with Expo Go - RESOLVED
3. ✅ Potential conflict between App.js and src/app/index.tsx - RESOLVED
4. ✅ Worklets version mismatch (0.6.1 vs 0.5.1) - RESOLVED with cache clear
5. 🔥 **NEW**: NitroModules are not supported in Expo Go! Use EAS (`expo prebuild`) or eject to a bare workflow instead.

✅ **Fixed**: 
- Removed `newArchEnabled: false` from app.json
- Cleared Metro bundler cache
- Killed all processes on ports 8000-8085

🔥 **STILL OCCURRING**: NitroModules Error
- **Root Cause**: Dependencies requiring native modules:
  - `react-native-mmkv` (native storage)
  - `@react-native-community/blur` (native blur effects)
  - `react-native-worklets` (native worklets)
- **Issue**: App still trying to run in Expo Go mode (doesn't support native modules)
- **Solution Applied**: `expo prebuild` completed successfully
  - Created native Android directory
  - Configured project for native modules
- **Next Step**: Need to run in development build mode, not Expo Go

## 2025-01-27 - Testing
🧪 **Status**: Testing in progress
- Started development server with `npm start`
- Monitoring for error resolution
- App should now launch without Worklets version mismatch

## Key Learnings
1. **Dependency Management**: Always clean cache and node_modules when experiencing version conflicts
2. **Configuration Files**: Babel and Metro configs are crucial for react-native-reanimated
3. **Version Synchronization**: JS and native parts must be in sync for worklets to function
4. **Prevention**: Regular dependency updates and proper configuration prevent these issues

## Next Steps
- Monitor app launch success
- Document any additional configuration needed
- Update team on prevention strategies

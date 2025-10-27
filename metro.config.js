const { getDefaultConfig } = require('expo/metro-config');

const config = getDefaultConfig(__dirname);

// Fix React Navigation asset resolution
config.resolver.platforms = ['ios', 'android', 'native', 'web'];

// Add support for all asset types
config.resolver.assetExts.push('png', 'jpg', 'jpeg', 'gif', 'svg', 'ttf', 'otf', 'woff', 'woff2');

// Ensure proper asset resolution
config.resolver.sourceExts.push('js', 'jsx', 'json', 'ts', 'tsx');

// Fix for React Navigation assets
config.resolver.resolverMainFields = ['react-native', 'browser', 'main'];

module.exports = config;

// App constants
export const APP_CONFIG = {
  NAME: 'Tea',
  VERSION: '1.0.0',
  API_URL: process.env.EXPO_PUBLIC_API_URL || 'https://api.tea.app/api/v1',
} as const;

// Storage keys
export const STORAGE_KEYS = {
  TOKEN: 'auth_token',
  USER: 'user_data',
  ONBOARDING_COMPLETE: 'onboarding_complete',
  LANGUAGE: 'app_language',
  THEME: 'app_theme',
} as const;

// API endpoints
export const API_ENDPOINTS = {
  AUTH: {
    LOGIN: '/auth/login',
    SIGNUP: '/auth/register',
    LOGOUT: '/auth/logout',
    FORGOT_PASSWORD: '/auth/forgot-password',
    RESET_PASSWORD: '/auth/reset-password',
    PROFILE: '/auth/profile',
  },
  USER: {
    PROFILE: '/user/profile',
    UPDATE_PROFILE: '/user/profile',
  },
} as const;

// Animation durations
export const ANIMATION_DURATION = {
  FAST: 200,
  NORMAL: 300,
  SLOW: 500,
} as const;

// Screen dimensions
export const SCREEN_BREAKPOINTS = {
  SMALL: 320,
  MEDIUM: 375,
  LARGE: 414,
} as const;

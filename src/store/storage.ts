import { MMKV } from 'react-native-mmkv';

// Create MMKV instance with encryption
const storage = new MMKV({
  id: 'tea-app-storage',
  encryptionKey: 'tea-app-encryption-key', // In production, use a secure key
});

// Storage keys
const STORAGE_KEYS = {
  TOKEN: 'auth_token',
  USER: 'user_data',
  ONBOARDING_COMPLETE: 'onboarding_complete',
} as const;

// Helper functions
export const storageHelpers = {
  // Token management
  getToken: (): string | null => {
    return storage.getString(STORAGE_KEYS.TOKEN) || null;
  },
  
  setToken: (token: string): void => {
    storage.set(STORAGE_KEYS.TOKEN, token);
  },
  
  removeToken: (): void => {
    storage.delete(STORAGE_KEYS.TOKEN);
  },
  
  // User data management
  getUser: (): any => {
    const userData = storage.getString(STORAGE_KEYS.USER);
    return userData ? JSON.parse(userData) : null;
  },
  
  setUser: (user: any): void => {
    storage.set(STORAGE_KEYS.USER, JSON.stringify(user));
  },
  
  removeUser: (): void => {
    storage.delete(STORAGE_KEYS.USER);
  },
  
  // Onboarding status
  getOnboardingComplete: (): boolean => {
    return storage.getBoolean(STORAGE_KEYS.ONBOARDING_COMPLETE) || false;
  },
  
  setOnboardingComplete: (complete: boolean): void => {
    storage.set(STORAGE_KEYS.ONBOARDING_COMPLETE, complete);
  },
  
  // Clear all data
  clearAll: (): void => {
    storage.clearAll();
  },
};

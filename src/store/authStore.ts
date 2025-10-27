import { create } from 'zustand';
import { User, AuthState } from '../types';
import { storageHelpers } from './storage';

interface AuthStore extends AuthState {
  login: (token: string, user: User) => void;
  logout: () => void;
  checkAuth: () => Promise<boolean>;
  setLoading: (loading: boolean) => void;
}

export const useAuthStore = create<AuthStore>((set, get) => ({
  user: null,
  token: null,
  isAuthenticated: false,
  isLoading: false,
  
  login: (token: string, user: User) => {
    storageHelpers.setToken(token);
    storageHelpers.setUser(user);
    set({ user, token, isAuthenticated: true });
  },
  
  logout: () => {
    storageHelpers.removeToken();
    storageHelpers.removeUser();
    set({ user: null, token: null, isAuthenticated: false });
  },
  
  checkAuth: async (): Promise<boolean> => {
    set({ isLoading: true });
    
    try {
      const token = storageHelpers.getToken();
      const user = storageHelpers.getUser();
      
      if (token && user) {
        // TODO: Validate token with API in Phase 2
        set({ user, token, isAuthenticated: true, isLoading: false });
        return true;
      } else {
        set({ user: null, token: null, isAuthenticated: false, isLoading: false });
        return false;
      }
    } catch (error) {
      set({ user: null, token: null, isAuthenticated: false, isLoading: false });
      return false;
    }
  },
  
  setLoading: (loading: boolean) => {
    set({ isLoading: loading });
  },
}));

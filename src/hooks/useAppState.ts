import { useEffect } from 'react';
import { AppState, AppStateStatus } from 'react-native';
import { useAuth } from './useAuth';

export function useAppState() {
  const { checkAuth } = useAuth();

  useEffect(() => {
    const handleAppStateChange = (nextAppState: AppStateStatus) => {
      if (nextAppState === 'active') {
        // Check auth when app becomes active
        checkAuth();
      }
    };

    const subscription = AppState.addEventListener('change', handleAppStateChange);

    // Initial auth check
    checkAuth();

    return () => {
      subscription?.remove();
    };
  }, [checkAuth]);
}

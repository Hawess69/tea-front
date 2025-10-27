import { useAuthStore } from '../store/authStore';
import { LoginCredentials, SignupData } from '../types';
import { mockApi } from '../services/api/mock';

export function useAuth() {
  const { 
    user, 
    token, 
    isAuthenticated, 
    isLoading, 
    login, 
    logout, 
    checkAuth, 
    setLoading 
  } = useAuthStore();

  const handleLogin = async (credentials: LoginCredentials) => {
    setLoading(true);
    try {
      const response = await mockApi.login(credentials.email, credentials.password);
      login(response.token, response.user);
      return { success: true };
    } catch (error) {
      return { 
        success: false, 
        error: error instanceof Error ? error.message : 'Login failed' 
      };
    } finally {
      setLoading(false);
    }
  };

  const handleSignup = async (data: SignupData) => {
    setLoading(true);
    try {
      const response = await mockApi.signup(data);
      return { success: true, message: response.message };
    } catch (error) {
      return { 
        success: false, 
        error: error instanceof Error ? error.message : 'Signup failed' 
      };
    } finally {
      setLoading(false);
    }
  };

  const handleLogout = () => {
    logout();
  };

  return {
    user,
    token,
    isAuthenticated,
    isLoading,
    login: handleLogin,
    signup: handleSignup,
    logout: handleLogout,
    checkAuth,
  };
}

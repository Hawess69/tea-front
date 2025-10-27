import axios from 'axios';
import { storageHelpers } from '../../store/storage';

// Create axios instance
const apiClient = axios.create({
  baseURL: process.env.EXPO_PUBLIC_API_URL || 'https://api.tea.app/api/v1',
  timeout: 15000,
  headers: {
    'Content-Type': 'application/json',
  },
});

// Request interceptor - auto-attach Bearer token
apiClient.interceptors.request.use(
  (config) => {
    const token = storageHelpers.getToken();
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

// Response interceptor - handle 401 and network errors
apiClient.interceptors.response.use(
  (response) => {
    return response;
  },
  (error) => {
    if (error.response?.status === 401) {
      // Auto-logout on 401
      storageHelpers.clearAll();
      // TODO: Navigate to login screen
    }
    return Promise.reject(error);
  }
);

export { apiClient };

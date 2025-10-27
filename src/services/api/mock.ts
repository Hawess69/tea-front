// Mock API responses for development
export const mockApi = {
  login: async (email: string, password: string) => {
    // Simulate network delay
    await new Promise(resolve => setTimeout(resolve, 400));
    
    if (email === 'test@tea.app' && password === 'password123') {
      return {
        token: 'mock-jwt-token-' + Date.now(),
        user: { 
          id: 1, 
          name: 'Test User', 
          email: email,
          avatar: null 
        },
      };
    }
    throw new Error('Invalid credentials');
  },
  
  signup: async (data: any) => {
    await new Promise(resolve => setTimeout(resolve, 500));
    
    return {
      message: 'Account created successfully',
      user: {
        id: Date.now(),
        name: data.name,
        email: data.email,
        avatar: null,
      },
    };
  },
  
  forgotPassword: async (email: string) => {
    await new Promise(resolve => setTimeout(resolve, 300));
    
    return {
      message: 'Password reset link sent to your email',
    };
  },
};

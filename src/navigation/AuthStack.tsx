import React from 'react';
import { createStackNavigator } from '@react-navigation/stack';
import { LoginScreen } from '../screens/Auth/LoginScreen';
import { SignupScreen } from '../screens/Auth/SignupScreen';
import { ForgotPasswordScreen } from '../screens/Auth/ForgotPasswordScreen';
import { AuthStackParamList } from './types';

const Stack = createStackNavigator<AuthStackParamList>();

interface AuthStackProps {
  onLoginSuccess: () => void;
}

export function AuthStack({ onLoginSuccess }: AuthStackProps) {
  return (
    <Stack.Navigator 
      initialRouteName="Login"
      screenOptions={{ headerShown: false }}
    >
      <Stack.Screen name="Login">
        {({ navigation }) => (
          <LoginScreen
            onLoginSuccess={onLoginSuccess}
            onNavigateToSignup={() => navigation.navigate('Signup')}
            onNavigateToForgotPassword={() => navigation.navigate('ForgotPassword')}
          />
        )}
      </Stack.Screen>
      
      <Stack.Screen name="Signup">
        {({ navigation }) => (
          <SignupScreen
            onSignupSuccess={() => navigation.navigate('Login')}
            onNavigateToLogin={() => navigation.navigate('Login')}
          />
        )}
      </Stack.Screen>
      
      <Stack.Screen name="ForgotPassword">
        {({ navigation }) => (
          <ForgotPasswordScreen
            onGoBack={() => navigation.goBack()}
          />
        )}
      </Stack.Screen>
    </Stack.Navigator>
  );
}

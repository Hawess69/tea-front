import React, { useState } from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import { SplashScreen } from '../screens/Splash/SplashScreen';
import { OnboardingScreen } from '../screens/Onboarding/OnboardingScreen';
import { AuthStack } from './AuthStack';
import { MainTabs } from './MainTabs';
import { useAuth } from '../hooks/useAuth';
import { RootStackParamList } from './types';

const Stack = createStackNavigator<RootStackParamList>();

type AppState = 'splash' | 'onboarding' | 'auth' | 'main';

export function RootNavigator() {
  const { isAuthenticated } = useAuth();
  const [appState, setAppState] = useState<AppState>('splash');

  const handleSplashFinish = (destination: 'onboarding' | 'auth' | 'main') => {
    setAppState(destination);
  };

  const handleOnboardingComplete = () => {
    setAppState('auth');
  };

  const handleAuthSuccess = () => {
    setAppState('main');
  };

  return (
    <NavigationContainer>
      <Stack.Navigator screenOptions={{ headerShown: false }}>
        {appState === 'splash' && (
          <Stack.Screen name="Splash">
            {() => <SplashScreen onFinish={handleSplashFinish} />}
          </Stack.Screen>
        )}
        
        {appState === 'onboarding' && (
          <Stack.Screen name="Onboarding">
            {() => <OnboardingScreen onComplete={handleOnboardingComplete} />}
          </Stack.Screen>
        )}
        
        {appState === 'auth' && (
          <Stack.Screen name="AuthStack">
            {() => <AuthStack onLoginSuccess={handleAuthSuccess} />}
          </Stack.Screen>
        )}
        
        {appState === 'main' && (
          <Stack.Screen name="MainTabs" component={MainTabs} />
        )}
      </Stack.Navigator>
    </NavigationContainer>
  );
}

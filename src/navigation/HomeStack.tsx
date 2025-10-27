import React from 'react';
import { createStackNavigator } from '@react-navigation/stack';
import { HomeScreen } from '../screens/Home/HomeScreen';
import { MenPostDetailScreen } from '../screens/Home/MenPostDetailScreen';
import { HomeStackParamList } from './types';
import { colors } from '../theme/colors';

const Stack = createStackNavigator<HomeStackParamList>();

export function HomeStack() {
  return (
    <Stack.Navigator
      screenOptions={{
        headerShown: false,
        cardStyle: { backgroundColor: colors.background },
      }}
    >
      <Stack.Screen 
        name="HomeList" 
        component={HomeScreen}
      />
      <Stack.Screen 
        name="MenPostDetail" 
        component={MenPostDetailScreen}
        options={{
          headerShown: true,
          headerTransparent: true,
          headerTitle: '',
          headerTintColor: colors.white,
          headerStyle: {
            backgroundColor: 'transparent',
          },
        }}
      />
    </Stack.Navigator>
  );
}


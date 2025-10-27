import React from 'react';
import { createStackNavigator } from '@react-navigation/stack';
import { FeedScreen } from '../screens/Feed/FeedScreen';
import { FeedPostDetailScreen } from '../screens/Feed/FeedPostDetailScreen';
import { FeedStackParamList } from './types';
import { colors } from '../theme/colors';

const Stack = createStackNavigator<FeedStackParamList>();

export function FeedStack() {
  return (
    <Stack.Navigator
      screenOptions={{
        headerShown: false,
        cardStyle: { backgroundColor: colors.background },
      }}
    >
      <Stack.Screen 
        name="FeedList" 
        component={FeedScreen}
      />
      <Stack.Screen 
        name="FeedPostDetail" 
        component={FeedPostDetailScreen}
        options={{
          headerShown: true,
          headerTitle: '',
          headerTintColor: colors.primary,
          headerStyle: {
            backgroundColor: colors.background,
            elevation: 0,
            shadowOpacity: 0,
            borderBottomWidth: 0,
          },
        }}
      />
    </Stack.Navigator>
  );
}


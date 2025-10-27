import React from 'react';
import { Text } from 'react-native';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { HomeStack } from './HomeStack';
import { FeedStack } from './FeedStack';
import { ForumScreen } from '../screens/Forum/ForumScreen';
import { EventsScreen } from '../screens/Events/EventsScreen';
import { MainTabParamList } from './types';
import { colors } from '../theme/colors';
import { typography } from '../theme/typography';
import Toast from 'react-native-toast-message';

const Tab = createBottomTabNavigator<MainTabParamList>();

// Placeholder for Add action
function AddPlaceholder() {
  return null;
}

export function MainTabs() {
  const handleAddPress = () => {
    Toast.show({
      type: 'info',
      text1: 'Coming Soon',
      text2: 'Post creation available in Phase 4',
      position: 'bottom',
    });
  };

  return (
    <Tab.Navigator
      initialRouteName="HomeTab"
      screenOptions={{
        headerShown: false,
        tabBarActiveTintColor: colors.primary,
        tabBarInactiveTintColor: colors.textSecondary,
        tabBarStyle: {
          backgroundColor: colors.white,
          borderTopWidth: 1,
          borderTopColor: colors.border,
          paddingBottom: 8,
          paddingTop: 8,
          height: 60,
        },
        tabBarLabelStyle: {
          fontSize: typography.fontSizes.xs,
          fontWeight: typography.fontWeights.medium,
        },
      }}
    >
      <Tab.Screen
        name="HomeTab"
        component={HomeStack}
        options={{
          tabBarIcon: ({ color, size }) => <Text style={{ fontSize: size, color }}>🏠</Text>,
          tabBarLabel: 'Home',
        }}
      />

      <Tab.Screen
        name="FeedTab"
        component={FeedStack}
        options={{
          tabBarIcon: ({ color, size }) => <Text style={{ fontSize: size, color }}>📰</Text>,
          tabBarLabel: 'Feed',
        }}
      />

      <Tab.Screen
        name="AddTab"
        component={AddPlaceholder}
        listeners={{
          tabPress: (e) => {
            e.preventDefault();
            handleAddPress();
          },
        }}
        options={{
          tabBarIcon: ({ color, size }) => (
            <Text
              style={{
                fontSize: size + 8,
                color: colors.white,
                backgroundColor: colors.primary,
                width: 50,
                height: 50,
                borderRadius: 25,
                textAlign: 'center',
                textAlignVertical: 'center',
                lineHeight: 50,
                marginBottom: 20,
                elevation: 8,
                shadowColor: colors.black,
                shadowOffset: { width: 0, height: 4 },
                shadowOpacity: 0.3,
                shadowRadius: 8,
              }}
            >
              ➕
            </Text>
          ),
          tabBarLabel: '',
        }}
      />

      <Tab.Screen
        name="ForumTab"
        component={ForumScreen}
        options={{
          tabBarIcon: ({ color, size }) => <Text style={{ fontSize: size, color }}>💬</Text>,
          tabBarLabel: 'Forum',
        }}
      />

      <Tab.Screen
        name="EventsTab"
        component={EventsScreen}
        options={{
          tabBarIcon: ({ color, size }) => <Text style={{ fontSize: size, color }}>🎟️</Text>,
          tabBarLabel: 'Events',
        }}
      />
    </Tab.Navigator>
  );
}


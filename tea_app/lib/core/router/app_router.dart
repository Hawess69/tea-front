import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/providers/auth_provider.dart';
import '../../presentation/screens/auth/login_screen.dart';
import '../../presentation/screens/auth/register_screen.dart';
import '../../presentation/screens/home/main_screen.dart';
import '../../presentation/screens/profile/profile_screen.dart';
import '../../presentation/screens/profile/edit_profile_screen.dart';
import '../../presentation/screens/feed/create_feed_post_screen.dart';
import '../../presentation/screens/men_posts/create_men_post_screen.dart';
import '../../presentation/screens/notifications/notifications_screen.dart';
import '../../presentation/screens/alerts/alerts_screen.dart';
import '../../presentation/screens/alerts/create_alert_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final isAuthenticated = authState.value != null;
      final fullPath = state.fullPath ?? '';
      final isGoingToAuth = fullPath.startsWith('/login') || fullPath.startsWith('/register');

      // If not authenticated and trying to access protected route
      if (!isAuthenticated && !isGoingToAuth) {
        return '/login';
      }

      // If authenticated and trying to access auth routes
      if (isAuthenticated && (isGoingToAuth)) {
        return '/home';
      }

      return null; // No redirect needed
    },
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/profile/edit',
        name: 'edit-profile',
        builder: (context, state) => const EditProfileScreen(),
      ),
      GoRoute(
        path: '/men-posts/create',
        name: 'create-men-post',
        builder: (context, state) => const CreateMenPostScreen(),
      ),
      GoRoute(
        path: '/feed-posts/create',
        name: 'create-feed-post',
        builder: (context, state) => const CreateFeedPostScreen(),
      ),
      GoRoute(
        path: '/notifications',
        name: 'notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: '/alerts',
        name: 'alerts',
        builder: (context, state) => const AlertsScreen(),
      ),
      GoRoute(
        path: '/alerts/create',
        name: 'create-alert',
        builder: (context, state) => const CreateAlertScreen(),
      ),
    ],
  );
});


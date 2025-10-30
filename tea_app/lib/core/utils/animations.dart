import 'package:flutter/material.dart';

/// Standard animation durations
class AnimationDuration {
  static const Duration instant = Duration(milliseconds: 0);
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 250);
  static const Duration slow = Duration(milliseconds: 350);
  static const Duration verySlow = Duration(milliseconds: 500);
}

/// Standard animation curves
class AnimationCurves {
  static const Curve defaultCurve = Curves.easeInOut;
  static const Curve decelerate = Curves.decelerate;
  static const Curve accelerate = Curves.easeIn;
  static const Curve elastic = Curves.elasticOut;
  static const Curve bounce = Curves.bounceOut;
  static const Curve smooth = Curves.easeInOutCubic;
}

/// Animation utilities
class AppAnimations {
  // Page transition animations
  static PageRouteBuilder<T> slideTransition<T extends Object?>(
    Widget child, {
    Offset beginOffset = const Offset(1.0, 0.0),
    Duration duration = AnimationDuration.normal,
  }) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final slideTransition = Tween<Offset>(
          begin: beginOffset,
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: AnimationCurves.smooth,
        ));
        
        final fadeTransition = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: AnimationCurves.smooth,
        ));
        
        return FadeTransition(
          opacity: fadeTransition,
          child: SlideTransition(
            position: slideTransition,
            child: child,
          ),
        );
      },
      transitionDuration: duration,
    );
  }
  
  // Fade animation
  static Widget fadeIn({
    required Widget child,
    Duration duration = AnimationDuration.normal,
    Curve curve = AnimationCurves.smooth,
  }) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      curve: curve,
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Opacity(opacity: value, child: child);
      },
      child: child,
    );
  }
  
  // Scale animation
  static Widget scaleIn({
    required Widget child,
    Duration duration = AnimationDuration.normal,
    Curve curve = AnimationCurves.smooth,
    double begin = 0.8,
    double end = 1.0,
  }) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      curve: curve,
      tween: Tween(begin: begin, end: end),
      builder: (context, value, child) {
        return Transform.scale(scale: value, child: child);
      },
      child: child,
    );
  }
  
  // Slide from bottom animation
  static Widget slideInFromBottom({
    required Widget child,
    Duration duration = AnimationDuration.normal,
    Curve curve = AnimationCurves.smooth,
    double offset = 50.0,
  }) {
    return TweenAnimationBuilder<Offset>(
      duration: duration,
      curve: curve,
      tween: Tween<Offset>(
        begin: Offset(0, offset),
        end: Offset.zero,
      ),
      builder: (context, value, child) {
        return Transform.translate(
          offset: value,
          child: child,
        );
      },
      child: child,
    );
  }
  
  // Slide from right animation
  static Widget slideInFromRight({
    required Widget child,
    Duration duration = AnimationDuration.normal,
    Curve curve = AnimationCurves.smooth,
    double offset = 50.0,
  }) {
    return TweenAnimationBuilder<Offset>(
      duration: duration,
      curve: curve,
      tween: Tween<Offset>(
        begin: Offset(offset, 0),
        end: Offset.zero,
      ),
      builder: (context, value, child) {
        return Transform.translate(
          offset: value,
          child: child,
        );
      },
      child: child,
    );
  }
}

/// Stagger animation builder for lists
class StaggeredAnimationBuilder extends StatelessWidget {
  final int index;
  final Widget child;
  final Duration baseDuration;
  final Duration staggerDelay;
  final Curve curve;
  
  const StaggeredAnimationBuilder({
    super.key,
    required this.index,
    required this.child,
    this.baseDuration = AnimationDuration.normal,
    this.staggerDelay = const Duration(milliseconds: 100),
    this.curve = AnimationCurves.smooth,
  });
  
  @override
  Widget build(BuildContext context) {
    return AppAnimations.fadeIn(
      duration: baseDuration + (staggerDelay * index),
      curve: curve,
      child: child,
    );
  }
}


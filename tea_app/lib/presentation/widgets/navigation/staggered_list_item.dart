import 'package:flutter/material.dart';
import '../../../core/utils/animations.dart';

class StaggeredListItem extends StatelessWidget {
  final int index;
  final Widget child;
  
  const StaggeredListItem({
    super.key,
    required this.index,
    required this.child,
  });
  
  @override
  Widget build(BuildContext context) {
    return AppAnimations.fadeIn(
      duration: AnimationDuration.normal + (const Duration(milliseconds: 100) * index),
      curve: AnimationCurves.smooth,
      child: child,
    );
  }
}


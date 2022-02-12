import 'package:flutter/material.dart';

import 'package:simple_animations/stateless_animation/custom_animation.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    return CustomAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      tween: ColorTween(begin: Colors.red, end: Colors.blue),
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: 1,
        child: Transform.translate(offset: Offset(0, 6), child: child),
      ),
    );
  }
}

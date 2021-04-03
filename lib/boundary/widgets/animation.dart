import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

/// An animation class that animates widgets with a Fade effect upon loading each screen.
class FadeAnimation extends StatelessWidget {

  /// Parameters for [FadeAnimation]
  ///
  /// Delay before animation starts after each screen is loaded.
  final double delay;

  /// Parameters for [FadeAnimation]
  ///
  /// Widget to be animated.
  final Widget child;

  /// Class constructor for [FadeAnimation].
  FadeAnimation(this.delay, this.child);

  /// Widget Build to implement [FadeAnimation].
  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(
          Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation["translateY"]),
            child: child
        ),
      ),
    );
  }
}

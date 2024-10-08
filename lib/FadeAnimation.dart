import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

class FadeAnimation extends StatelessWidget{

  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
    ..tween('opacity', Tween(begin: 0.0, end: 1.0), duration: const Duration(microseconds: 500))
    .thenTween('y', Tween(begin: 120.0, end: 0.0), duration: const Duration(microseconds: 500), curve: Curves.easeOut);

    return PlayAnimationBuilder(
        delay: Duration(microseconds: (500*delay).round()),
        duration: tween.duration,
        tween: tween,
        child: child,
        builder: (context, animation, child) => Opacity(
            opacity: animation.get('opacity'),
          child: Transform.translate(
            offset: Offset(0, animation.get('y')),
            child: child,
          ),
        )
    );
  }
}
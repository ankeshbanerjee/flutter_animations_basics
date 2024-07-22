import 'package:flutter/material.dart';

// to start an animation when a screen gets into focus -> use tween animations.
class AnimationOnScreenFocused extends StatefulWidget {
  const AnimationOnScreenFocused({super.key});

  @override
  State<AnimationOnScreenFocused> createState() =>
      _AnimationOnScreenFocusedState();
}

class _AnimationOnScreenFocusedState extends State<AnimationOnScreenFocused> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: TweenAnimationBuilder(
      tween: Tween<double>(begin: 100, end: 300),
      duration: const Duration(milliseconds: 2000),
      curve: Curves.ease,
      builder: (context, size, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.blue, spreadRadius: 50, blurRadius: 150),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(size * 0.5))),
            ),
            child ?? const SizedBox()
          ],
        );
      },
      child: const Text(
        "The part which is not dependent on the animation's frame values, can be passed in the child parameter.",
        textAlign: TextAlign.center,
      ),
    ));
  }
}

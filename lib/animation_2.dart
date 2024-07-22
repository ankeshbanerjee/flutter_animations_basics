import 'package:flutter/material.dart';

class CircularContainerOpacityAnimation extends StatefulWidget {
  const CircularContainerOpacityAnimation({super.key});

  @override
  State<CircularContainerOpacityAnimation> createState() =>
      _CircularContainerOpacityAnimationState();
}

class _CircularContainerOpacityAnimationState
    extends State<CircularContainerOpacityAnimation> {
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 500),
          child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(100)))),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              opacity = opacity == 1 ? 0 : 1;
            });
          },
          child: const Text("Press to animate opacity"),
        )
      ],
    ));
  }
}

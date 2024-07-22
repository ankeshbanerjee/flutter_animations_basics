import 'package:flutter/material.dart';

// starting an animation on button press -> implicit animations can be used.
// e.g., AnimatedContainer, AnimatedOpacity etc.
class CircularContainerAnimation extends StatefulWidget {
  const CircularContainerAnimation({super.key});

  @override
  State<CircularContainerAnimation> createState() =>
      _CircularContainerAnimationState();
}

class _CircularContainerAnimationState
    extends State<CircularContainerAnimation> {
  double size = 100;
  Color color = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: size,
            height: size,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(size * 0.5)))),
        ElevatedButton(
          onPressed: () {
            setState(() {
              size = size * 2;
              if (color == Colors.red) {
                color = Colors.blue;
              } else {
                color = Colors.red;
              }
            });
          },
          child: const Text("Press to animate"),
        )
      ],
    ));
  }
}

import 'package:flutter/material.dart';

// explicit animations -> uses Animation and AnimationController
class ExplicitAnimation extends StatefulWidget {
  const ExplicitAnimation({super.key});

  @override
  State<ExplicitAnimation> createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _opacity2;
  late Animation<Offset> _offsetPosition;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    // define the controller
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    // create a curve
    final CurvedAnimation curve =
        CurvedAnimation(parent: _controller, curve: Curves.ease);
    // assinging a tween for each type of animation
    _opacity = Tween<double>(begin: 0, end: 1).animate(curve);
    _opacity2 = Tween<double>(begin: 1, end: 0).animate(curve);
    _offsetPosition =
        Tween<Offset>(begin: const Offset(-1, -1), end: Offset.zero)
            .animate(curve);
    _scale = Tween<double>(begin: 0.5, end: 1).animate(curve);
    // start the animation
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FadeTransition(
            opacity: _opacity,
            child: const Icon(
              Icons.flutter_dash,
              size: 140.0,
              color: Colors.blue,
            ),
          ),
          SlideTransition(
            position: _offsetPosition,
            child: ScaleTransition(
              scale: _scale,
              child: Column(
                children: [
                  const SizedBox(height: 40.0),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Name",
                      hintText: "Enter your name",
                    ),
                    onTapOutside: (event) {
                      // remove focus
                      FocusScope.of(context).unfocus();
                    },
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Password",
                      hintText: "Enter your password",
                    ),
                    onTapOutside: (event) {
                      // remove focus
                      FocusScope.of(context).unfocus();
                    },
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                      onPressed: () {
                        if (_controller.isCompleted) {
                          _controller.reverse();
                        }
                      },
                      child: const Text("Login"))
                ],
              ),
            ),
          ),
          FadeTransition(
            opacity: _opacity2,
            child: ElevatedButton(
                onPressed: () {
                  _controller.forward();
                },
                child: const Text("Bring back")),
          )
        ]),
      ),
    );
  }
}

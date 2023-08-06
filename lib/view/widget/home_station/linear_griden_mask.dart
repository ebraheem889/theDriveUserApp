import 'package:flutter/material.dart';

class LinearGradientMask extends StatelessWidget {
  final List<Color> colors;
  final Widget child;

  const LinearGradientMask(
      {super.key, required this.child, required this.colors});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return RadialGradient(
          center: Alignment.topCenter,
          stops: const [0.5, 1],
          radius: 1,
          colors: colors,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}

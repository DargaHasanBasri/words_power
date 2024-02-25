import 'package:flutter/material.dart';

class FadedWidget extends StatelessWidget {
  final Widget child;
  final List<double> stops;
  final List<Color> colorsForStops;

  FadedWidget({
    super.key,
    required this.child,
    this.stops = const [0.5, 0.8, 1],
    List<double> opacities = const [0.9, 0.3, 0],
  }) : colorsForStops = opacities
            .map((double opacity) => Colors.black.withOpacity(opacity))
            .toList();

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: stops,
          colors: colorsForStops,
        ).createShader(
          Rect.fromLTRB(0, 0, rect.width, rect.height),
        );
      },
      blendMode: BlendMode.dstIn,
      child: child,
    );
  }
}

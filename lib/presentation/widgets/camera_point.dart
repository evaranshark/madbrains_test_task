import 'package:flutter/material.dart';

import '../../utils/services.dart';
import '../../utils/theme_values.dart';

class CameraPoint extends StatelessWidget {
  const CameraPoint({
    super.key,
    required this.isCompleted,
    this.scaleFactor = 1.0,
  });
  final bool isCompleted;
  final double scaleFactor;

  @override
  Widget build(BuildContext context) {
    final colorsService = services.get<ThemeValues>();
    final color = isCompleted
        ? colorsService.colors.success
        : colorsService.colors.primary;
    final shadow = isCompleted
        ? colorsService.colors.successLight
        : colorsService.colors.primary50;
    final icon = isCompleted ? Icons.check : Icons.camera_alt_outlined;
    return SizedBox(
      width: 40.0 / scaleFactor,
      height: 40.0 / scaleFactor,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: shadow,
        ),
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

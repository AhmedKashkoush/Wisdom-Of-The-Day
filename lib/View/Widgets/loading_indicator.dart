import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wisdom_of_the_day/Core/Locales/app_translation_keys.dart';

class LoadingIndicator extends StatefulWidget {
  final double? size;
  const LoadingIndicator({Key? key, this.size}) : super(key: key);

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator>
    with SingleTickerProviderStateMixin {
  final double _size = 120;
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat();
  late final Animation<double> _animation =
      Tween<double>(begin: 0, end: 4).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size ?? _size,
      height: widget.size ?? _size,
      child: FittedBox(
        child: Stack(
          alignment: Alignment.center,
          children: [
            RotationTransition(
              turns: _animation,
              child: const SizedBox(
                width: 180,
                height: 180,
                child: CircularProgressIndicator(
                  strokeWidth: 8,
                  value: 0.25,
                ),
              ),
            ),
            Text(
              AppTranslationKeys.wisdom.tr,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 24,
              ),
            ),
            RotationTransition(
              turns: _animation,
              child: const SizedBox(
                width: 180,
                height: 180,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: CircularProgressIndicator(
                    strokeWidth: 8,
                    value: 0.25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

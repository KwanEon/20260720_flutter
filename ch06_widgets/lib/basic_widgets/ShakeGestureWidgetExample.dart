import 'package:flutter/material.dart';
import 'package:shake_gesture/shake_gesture.dart';

class ShakeDetectorWidgetExample extends StatelessWidget {
  const ShakeDetectorWidgetExample({super.key});

  // 흔들었을 때 실행할 함수
  void _onShakeHandler(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Shake!')));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShakeGesture(
        onShake: () => _onShakeHandler(context),
        child: Center(
          child: OutlinedButton(
            // 테스트 버튼을 눌렀을 때도 동일한 동작 실행
            onPressed: () => _onShakeHandler(context),
            child: const Text('Simulate Shake'),
          ),
        ),
      ),
    );
  }
}
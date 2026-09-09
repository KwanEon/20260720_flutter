import 'dart:math';

import 'package:ch11_random_dice/screen/home_screen.dart';
import 'package:ch11_random_dice/screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:shake_gesture/shake_gesture.dart';
import 'package:vibration/vibration.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

// Flutter에서 애니메이션을 처리할 때 필수적인 Mixin
// Ticker 시계처럼 매 프레임마다 콜백함수를 호출해주는 역할
class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  TabController? controller;
  double threshold = 2.7; //민감도의 기본값 설정
  int number = 1;

  @override
  void initState() {
    super.initState();
    // vsync:: 화면에 보일때만 Ticker호출, 애니메이션 성능과 효율 최적화
    controller = TabController(length: 2, vsync: this);
    controller!.addListener(tabListener);
  }

  void onPhoneShake() async {
    final rand = Random();
    setState(() {
      number = rand.nextInt(6) + 1; // 1~6 주사위
    });

    Vibration.vibrate(duration: 50);
  }

  // listener로  사용할 함수 선언
  tabListener() {
    setState(() {});
  }

  @override
  void dispose() {
    // 이 클래스가 소멸될 때 tabListener를 소멸시켜 메모리 누수 방지
    controller!.removeListener(tabListener);
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShakeGesture(
      child: Scaffold(
        body: TabBarView(controller: controller, children: renderChildren()),
        bottomNavigationBar: renderBottomNavigation(),
      ),
      onShake: onPhoneShake,
    );
  }

  List<Widget> renderChildren() {
    return [
      // Container(
      //   child: Center(
      //     child: Text('Tab 1', style: TextStyle(color: Colors.white)),
      //   ),
      // ),
      HomeScreen(number: number),
      // Container(
      //   child: Center(
      //     child: Text('Tab 2', style: TextStyle(color: Colors.white)),
      //   ),
      // ),
      SettingsScreen(
        threshold: threshold,
        onThresholdChange: onThresholdChange,
      ),
    ];
  }

  void onThresholdChange(double val) {
    setState(() {
      threshold = val;
    });
  }

  BottomNavigationBar renderBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: controller!.index,
      onTap: (int index) {
        setState(() {
          controller!.animateTo(index);
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.edgesensor_high_outlined),
          label: "주사위",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "설정"),
      ],
    );
  }
}
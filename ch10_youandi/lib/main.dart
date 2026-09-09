import 'package:ch10_youandi/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'sunflower',
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 80.0,
            fontWeight: FontWeight.w700,
            fontFamily: 'parisienne',
          ),
          displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 50.0,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: TextStyle(color: Colors.white, fontSize: 30.0),
          bodyMedium: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
      home: HomeScreen(), // 시각적으로 보여지는 위젯트리의 최상위 노드
    ),
  );
}
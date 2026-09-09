import 'package:ch06_widgets/basic_widgets/ElevatedButtonWidgetExample.dart';
import 'package:ch06_widgets/basic_widgets/FloatingActionButtonWidgetExample.dart';
import 'package:ch06_widgets/basic_widgets/GestureDetectorWidgetExample.dart';
import 'package:ch06_widgets/basic_widgets/IconButtonWidgetExample.dart';
import 'package:ch06_widgets/basic_widgets/OutlinedButtonWidgetExample.dart';
import 'package:ch06_widgets/basic_widgets/ShakeGestureWidgetExample.dart';
import 'package:ch06_widgets/basic_widgets/TextButtonWidgetExample.dart';
import 'package:ch06_widgets/basic_widgets/TextWidgetExample.dart';
import 'package:ch06_widgets/design_widgets/ContainerWidgetExample.dart';
import 'package:ch06_widgets/design_widgets/PaddingWidgetExample.dart';
import 'package:ch06_widgets/design_widgets/SafeAreaWidgetExample.dart';
import 'package:ch06_widgets/design_widgets/SizedBoxWidgetExample.dart';
import 'package:ch06_widgets/layout_widgets/absolute_layout_widget.dart';
import 'package:ch06_widgets/layout_widgets/column_widget.dart';
import 'package:ch06_widgets/layout_widgets/expanded_widget.dart';
import 'package:ch06_widgets/layout_widgets/flexible_expanded_mixed_widget.dart';
import 'package:ch06_widgets/layout_widgets/flexible_widget.dart';
import 'package:ch06_widgets/layout_widgets/row_widget.dart';
import 'package:ch06_widgets/layout_widgets/stack_widget.dart';
import 'package:ch06_widgets/login/login_screen_absolute.dart';
import 'package:ch06_widgets/login/login_screen_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'CookieRun'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('쿠키런 폰트 적용'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          // 상단 상태바의 아이콘/글자색을 흰색으로 설정
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        floatingActionButton: FloatingActionButtonWidgetExample(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

        // SafeArea 영역
        /*body: const SafeArea(
          child: Center(
            child: Text('Hello World~!', style: TextStyle(fontSize: 40)),
          ),
        ),*/
        // 기본 위젯, 디자인 위젯 실습
        /*body: const SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity, //부모위젯이 허용하는 최대넓이
              child: Column(
                children: [
                  //기본 위젯
                  TextWidgetExample(),
                  TextButtonWidgetExample(),
                  ElevatedButtonWidgetExample(), // 배경색 있고 입체감있는 버튼
                  IconButtonWidgetExample(), // 글꼴의 아이콘을 이용한 버튼
                  OutlinedButtonWidgetExample(), // 테두리가 있는 버튼
                  GestureDetectorWidgetExample(),
                  ShakeGestureWidgetExample(),
                  // 디자인 관련 위젯 : 배경 추가, 간격 추가, 패딩 추가등
                  ContainerWidgetExample(),
                  SizedBoxWidgetExample(),
                  PaddingWidgetExample(),
                  //SafeArea 상위 구조에서 주로 사용, 중복 적용하면 문제 발생
                  //SafeAreaWidgetExample(),
                ],
              ),
            ),
          ),
        ),*/
        // 배치 관련 위젯 :
        body: SizedBox(width: double.infinity,
          // child: RowWidgetExample(),
          // child: ColumnWidgetExample(),
          // child: FlexibleWidgetExample(),
          // child: ExpandedWidgetExample(),
          // child: FlexibleExpandedMixedWidgetExample(),
          // child: StackWidgetExample(),
          // child: AbsoluteLayoutWidgetExample(),
          // child: LoginAbsolute(),
          child: LoginResponsive(),
        ),
      ),
    ),
  );
}

//  home에서 SafeArea를 적용하였을 때
/*
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'CookieRun'),
      // Scaffold 전체를 SafeArea로 감쌉니다.
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('쿠키런 폰트 적용'),
            centerTitle: true,
            backgroundColor: Colors.blueAccent,
          ),
          body: const Center(
            child: Text('Hello World~!', style: TextStyle(fontSize: 40)),
          ),
        ),
      ),
    ),
  );
}*/
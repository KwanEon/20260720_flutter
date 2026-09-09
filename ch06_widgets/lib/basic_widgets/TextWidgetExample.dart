import 'package:flutter/cupertino.dart';

class TextWidgetExample extends StatelessWidget {
  const TextWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '쿠키런 폰트 Regular',
          style: TextStyle(
            fontFamily: 'CookieRun',
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 12),
        Text(
          '쿠키런 폰트 Bold',
          style: TextStyle(
            fontFamily: 'CookieRun',
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 12),
        Text(
          '쿠키런 폰트 Black',
          style: TextStyle(
            fontFamily: 'CookieRun',
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
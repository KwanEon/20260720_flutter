import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      //mainAxisAlignment: MainAxisAlignment.center,
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo.gif', width: 200),
          const SizedBox(height: 30.0),
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        ],
      ),

    );
  }
}
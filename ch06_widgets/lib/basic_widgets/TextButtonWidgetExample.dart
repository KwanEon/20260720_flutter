import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TextButtonWidgetExample extends StatelessWidget {
  const TextButtonWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(onPressed: (){
        // print("버튼 클릭");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("윤 어게인"),
          duration: Duration(seconds: 2),
        ));
        // https://pub.dev/packages/fluttertoast
        Fluttertoast.showToast(msg: "윤 어게인",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.pinkAccent,
          textColor: Colors.white,
          fontSize: 23
        );
      }, child: Text("텍스트 버튼")),
    );
  }
}
import 'dart:io';
import 'dart:math';

// 다트언어에서 함수는 일급 객체, 함수를 값처럼 사용 가능
// 재사용을 위하여 명령을 묶어 놓은 것이 함수.
// 1) 리턴 X 매개변수 X
void done() {
  print("done");
}

// 2) 리턴 X 매개변수 O
void done2(String str) {
  print("${str} done");
}

// 3) 리턴 O 매개변수 X
String done3() {
  return "done";
}

// 4) 리턴 O 매개변수 O
String done4(String str) {
  return ("${str} done");
}

// 1) 매개변수의 형태에 따라서 포지셔널 파라미터를 이용한 함수
int position1(int a, int b) {
  return a + b;
}

int position2(int a, [int b = 2]) {
  return a + b;
}

// 2) 매개변수의 형태에 따라서 네임드 파라미터를 이용한 함수
int required1({required int a, required int b}) {
  return a + b;
}

int required2({required int a, int b = 3}) {
  return a + b;
}

// 3) 포지셔널 + 네임드 파라미터 혼용(포지셔널이 네임드보다 반드시 앞에 있어야 함)
int argCombine(int a, {required int b, int c = 4}) {
  return a + b + c;
}

void main() {
  print(position1(1, 1));
  print(position2(1));
  print(required1(a: 2, b: 1));  print(required1(b: 1, a: 2));
  print(required2(a: 2));  print(required2(a: 2, b: 2));
  print(argCombine(1, b: 2, c:3)); print(argCombine(1, b: 2));

  stdout.write("Rock(0), Scissors(1), Paper(2) Which one?: ");
  String? input = stdin.readLineSync();
  print(rsp(input ?? ''));
}
String rsp(String input) {
  int you = Random().nextInt(3);
  int? me;
  try {
    me = int.parse(input ?? 0.toString());
  } catch (e) {
    return "숫자가 아닙니다.";
  }
  String result;
  var answer = switch (me - you) {
    -2 || 1 => 'Win',
    0 => 'Draw',
    _ => 'Lose',
  };
  return '나:${pea(me)} 너:${pea(you)} => ${answer.toString()}';
}
String pea(int num) {
  return num == 0
      ? "Rock"
      : num == 1
      ? "Paper"
      : "Scissors";
}
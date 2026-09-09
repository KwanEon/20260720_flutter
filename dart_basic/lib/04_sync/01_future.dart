void main() async {
  // Future는 지금 당장은 없지만, 나중에 나올 결과값을 약속하는 객체
  // 비동기 처리: 나중에 작업이 끝나면 값을 받을 변수 선언
  // Future 객체 자체는 '약속'일 뿐이라서 바로 출력하거나 계산에 쓸 수 없음
  Future<String> name;
  Future<int> number;
  Future<bool> isOpened;
  Future<void> doNothing;
  addNumbers(1, 1);

  addNumbers2(1, 1);
  addNumbers2(2, 2);

  // 안의 값을 꺼내려면 await 키워드를 사용
  await addNumbers3(1, 1);
  await addNumbers3(2, 2);

  // await를 붙이면 Future가 완료될 때까지 기다렸다가 진짜 값(String)을 꺼냄
  // addNumbers3와 동일하나 함수실행 앞 await로 인해 addNumbers4는 서로 중첩되지 않음
  final result1 = await addNumbers4(1, 1);
  print('Result1: $result1');
  final result2 = await addNumbers4(2, 2);
  print('Result2: $result2');
}

void addNumbers(int num1, int num2) {
  print('addNumbers1: $num1 + $num2 계산 시작');
  // 단순하게 2초 딜레이만 되고 나머지는 기다림 없이 진행
  Future.delayed(Duration(seconds: 3), () {
    print('$num1 + $num2 = ${num1 + num2}');
  });
  print('$num1 + $num2 계산 끝');
}

void addNumbers2(int num1, int num2) async {
  print('addNumbers2: $num1 + $num2 계산 시작');
  // 2초 기다리는 부분만 서로 중첩되지 않음
  await Future.delayed(Duration(seconds: 3), () {
    print('$num1 + $num2 = ${num1 + num2}');
  });
  print('$num1 + $num2 계산 끝');
}

// addNumbers3 끼리는 서로 중첩되지 않음
Future<void> addNumbers3(int num1, int num2) async {
  print('addNumbers3: $num1 + $num2 계산 시작');
  await Future.delayed(Duration(seconds: 3), () {
    print('$num1 + $num2 = ${num1 + num2}');
  });
  print('$num1 + $num2 계산 끝');
}

Future<int> addNumbers4(int num1, int num2) async {
  print('addNumbers4: $num1 + $num2 계산 시작');
  await Future.delayed(Duration(seconds: 3), () {
    print('$num1 + $num2 = ${num1 + num2}');
  });
  print('$num1 + $num2 계산 끝');
  return num1 + num2;
}

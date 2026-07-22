main() {
  // final 변수에 값이 들어가면 고정
  // update(X), 재선언(X), 타입 고정(O)
  // 실행할 때 초기화 1회 가능
  final double PI = 3.141592;
  // PI = "애플파이"  타입 고정, update 불가
  final int num;  // 선언과 초기화 분리되며 컴파일 시점에 값이 결정됨
  num = 100;  // 선언과 초기화를 분리 가능, 단 1번만 할당 가능
  print(num);

  // const 변수에 값이 들어가면 고정
  // update(X), 재선언(X), 타입 변경(X)
  // 실행할 때 초기화 되는 상수에 사용 불가
  const String greet = "Good Morning";
  
  // 실행할 때 초기화 되는 상수는 선언 불가능
  // const DateTime date = DateTime.now();
  
}
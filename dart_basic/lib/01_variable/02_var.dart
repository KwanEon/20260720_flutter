main() {
  // var 변수의 값이 초기화 될 때 동적 할당: 자동으로 타입을 추론할 수 있는 일반 변수
  // update(O), 재선언(X), 타입 고정(O)

  // 변수 선언시
  // tot; 변수 선언시 반드시 앞에 type, var, const, final 을 두고 선언해야 함
  var name = "Dart";
  print(name.runtimeType);

  // name = 100;  타입이 고정되어 있기 때문에 불가
  // var name = 100;  재선언 불가능
  name = "Hello Flutter";
  print(name.runtimeType);
}
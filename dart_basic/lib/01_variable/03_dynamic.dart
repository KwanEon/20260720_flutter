main() {
  // dynamic 변수에 값이 들어가면 동적 할당: 타입 검사 없는 완전한 동적 변수
  // 실행중 타입 변경 가능: 타입 안정성이 떨어지므로 가급적 제한적으로 사용
  // update(O), 재선언(X), 타입 고정(X)

  dynamic name = "Hello";
  print(name.runtimeType);
  // print(name + 2);  숫자와 문자 더하기 연산 불가: 타입 불명확

  name = true;  // 타입이 변동 가능
  print(name.runtimeType);

  // 재선언 불가
  // var name = 100;
  // dynamic name = 100;
  name = 10.123;  // update 가능
  print(name.runtimeType);

  // ⚠ 주의사항
  var tot;  // 초기값을 주지 않을 시 타입을 추론할 근거가 없어서 dynamic으로 간주
  tot = "hello";
  print(tot.runtimeType);
  tot = true;
  print(tot.runtimeType);
  
  // var tot = 1.12;  재선언 불가

  // static 변수에 값이 들어가면 동적 할당: 타입 검사 없는 완전한 동적 변수
  // 실행중 타입 변경 가능: 타입 안전성이 떨어지므로 가급적 제한적으로 사용
  // update(O), 재선언(X), 타입 고정(X)

  // static int sum = 0 static은 홀로 선택될 수 없다
  // 클래스의 인스턴스 없이, 클래스 자체에 속하는 변수를 만들 때 사용
  print(MathUtils.maxUsers);

  // 선언 시점에는 값이 없지만, 사용 전에 반드시 초기화 됨을 보장.
  late final String nickname;
  void setup() {
    // Non-nullable 변수를 나중에 초기화해야 할 때 유용
    nickname = "Late Variable";
  }
  setup();  // 함수가 호출될 때 변수 생성
  print(nickname);
}

class MathUtils {
  static const int maxUsers = 100;
}

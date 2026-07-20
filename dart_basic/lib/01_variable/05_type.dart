main() {
  // 변수의 타입으로 선언시: update(O), 타입 변경(X)
  // 변수의 종류: bool, int, double, String
  // 그외: null, Collection(List, Set, Map)

  bool isBool = false;
  print(isBool);
  print(isBool.runtimeType);

  int isInt = 100;
  print(isInt);
  print(isInt.runtimeType);

  double isDouble = 1.234;
  print(isDouble);
  print(isDouble.runtimeType);

  // type num만 int와 double 사이로 타입 변환 가능
  num isNum = 1.123;
  print(isNum);
  print(isNum.runtimeType);
  // isNum = "hello"  int 또는 double 중에 초기화 가능

  // Dart 언어에는 Null Safety(널 안정성)를 기본으로 지원 (Dart 2.12버전부터)
  // isNum = null  기본적으로 모든 타입은 null을 허용하지 않음 (Non-nullable)
  // null을 할당할 수도 있게 하려면 ?를 붙임
  num? isNum1 = 5.678;
  print(isNum1);
  isNum1 = null;
  print("============ null =============");
  print(isNum1);
  print(isNum1.runtimeType);  // Null

  num isNum2 = 100;
  print(isNum2);
  print(isNum2.runtimeType);
  isNum2 = 1.123;
  print(isNum2.runtimeType);

  String name;
  name = 'hello';
  name = "world";
  print(name);
  print(name.runtimeType);

  print('=== 변수의 명명규칙 ===');
  // 변수의 명명규칙
  // 변수는 반드시 문자 또는 '_'로 시작해야 한다
  // 변수는 글자, 숫자, '_', '$'의 조합으로 선언
  // CamelCase, SnakeCase, 케밥표기법 등 다 되지만 일관성 있게 작성해야 한다
  print('\n');

  print('=== 변수의 형변환 ===');
  // 기본형 타입에서 자동 형변환은 없다. 대부분 명시적 형변환
  int a = 10;
  double b = a.toDouble();  // int -> double
  print(b.runtimeType);

  double d = 1.678;
  int c = d.toInt();  // double -> int (절삭)
  print(c);

  String str = "123";
  int i1 = int.parse(str);  // String -> int
  print(i1);
  print(i1.runtimeType);

  String s1 = "1.123";
  double d1 = double.parse(s1);
  print(d1);
  print(d1.runtimeType);

  // 숫자와 문자의 연산시 반드시 타입을 동일하게 해줘야 함
  print("숫자: " + 10.toString());
  print("숫자: " + i1.toString());
  print("숫자: " + d1.toString());
}
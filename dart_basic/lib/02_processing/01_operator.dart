void main() {
  int d = 3;

  print("===사칙연산(이항연산)===");
  print(d + 2);
  print(d - 2);
  print(d * 2);
  print((d / 2).runtimeType); // 나누기(int/int=double)
  print(d % 2); // 나머지
  print(d ~/ 2); // 몫

  int n = 10;
  print("===단항연산===");
  print(n++);
  print(++n);
  print(n--);
  print(--n);
  print(-n);
  print(~n); // 2의 보수 출력:: ~10 = -(10+1), ~(-1) = -(-1+1)=0
  print(!true);
  print("hello" is String);
  print("hello" is int);
  print("hello" is bool);
  print(int.parse("12"));
  print(bool.parse("true"));

  print("===할당 연산자===");
  dynamic a = 10;
  print(a += 5);
  print(a -= 5);
  print(a *= 5);
  print(a /= 5);
  print(a %= 5);
  a = 10;
  print(a ~/= 5);
  //print(a = (a ~/ 5) as int);  // 할당 연산자 as
  print(a.runtimeType);

  print("===비교 연산자(Comparison Operators)===");
  a = 10;
  int b = 2;
  print(a == b);
  print(a > b);
  print(a != b);

  print("===논리 연산자(Logical Operators)===");
  bool x = true, y = false;
  print(x && y);
  print(x || y);
  print(!x);

  print("===비트 연산자(Bitwise Operators)===");
  print("비트 연산자 : $a, $b");
  print(a & b);
  print(a | b);
  print(a ^ b);
  print(~b);
  print(b << 2); //왼쪽 시프트
  print(a >> 2); //오른쪽 시프트

  print("===삼항 연산자(Conditional Operators)===");
  print(a > b ? "big" : a == b ? "same" : "small");

  print("< Null Assertion Operator (널 확신 연산자) ?, !, ??= >");
  String? name; //널도 허용
  // print(name.length); // null허용해서 컴파일 에러 발생
  // print(name!.length); // null 허용하나 !는 널 허용하지 않는 일반 String으로 인식.
  // 컴파일 에러가 사라져도 강제 진행 but 예외 발생
  name = "hello";
  print(name.length);

  String? str; // 변수에 null값 포함 가능
  str ??= "Hello"; //??= 변수에 값이 null 이라면 강제적으로 Hello를 할당
  print(str?.length ?? 0); // ??를 사용해서 null 이면 0을 할당

  List<int>? numbers;
  List<int> numbers2 = [1,2,3, ...?numbers];
  print(numbers);  //null 출력

  print("===문자열 연산과 비교===");
  String str1 = "Hello";
  print("str1.hashCode() : ${str1.hashCode}");
  String str2 = "hello";
  print("str2.hashCode() : ${str2.hashCode}");
  print(str2 == str1);
  print(identical(str1, str2));

  // 연산에 의한 문자열도 상수풀에 값이 중복될 경우 하나의 주소로만 사용
  String str3 = "Dart";
  String str4 = str3.substring(0,4);
  print(str4);
  print("str3.hashCode() : ${str3.hashCode}");
  print("str4.hashCode() : ${str4.hashCode}");
  print(str3 == str4);
  print(identical(str3, str4));

  print("===특수문자와 다중 줄 문자열===");
  print("C:\Program Files\Dart"); //C:Program FilesDart \는 특수문자
  print("C:\\Program Files\\Dart");
  print(r"C:\Program Files\Dart");

  String multiLine = '''
    다중 줄 문자열을 
    사용할 때 \''' 또는 """를 사용한다.
  ''';
  print(multiLine);

  print("=== String ===");
  str = "Hello";
  print(str.length);
  print("Dart".toUpperCase());
  print("Dart".toLowerCase());
  print("    Dart   ".trim());
  print("    Dart   ".trimLeft());
  print("    Dart   ".trimRight());
  print("Hello World".replaceAll("World", "Dart"));
  print("Hello World".substring(0, 4));
  print("Hello World".contains("Wo"));
  print("Hello World".indexOf("l"));
  print("Hello World".lastIndexOf("l"));
  print("Boys be ambitious".split(" "));
  print("Boys be ambitious".split(" ").runtimeType);
  print("7".padLeft(3, "0"));
  print("Star".padRight(8, "⭐"));
  print("ABC".codeUnits); //문자열을 UTF-16 코드 List 반환
  print("".isEmpty);
  print("Hello".isNotEmpty);


  print("=== StringBuffer ===");
  var sb = StringBuffer();

  // 1. write() : 전달받은 객체를 문자열로 변환하여 버퍼에 추가
  sb.write('Hello');
  sb.write(' ');
  sb.write(2026); // 숫자, 객체 등 어떤 타입이든 수용 가능
  print(sb); // Hello 2026

  // 2. writeln() : 문자열 뒤에 자동으로 줄바꿈('\n')을 붙여서 추가
  var logBuffer = StringBuffer();
  logBuffer.writeln('첫 번째 줄');
  logBuffer.writeln('두 번째 줄');
  print(logBuffer);

  // 3. writeAll() : Iterable(List, Set 등)의 모든 요소를 구분자와 함께 한 번에 추가
  var fruits = ['사과', '바나나', '체리'];
  var fruitBuffer = StringBuffer();

  // writeAll(Iterable, [구분자])
  fruitBuffer.writeAll(fruits, ', ');
  print(fruitBuffer); // 사과, 바나나, 체리
  print(fruitBuffer.runtimeType);

  // 4. writeCharCode() : 유니코드(ASCII) 정수값을 해당 문자로 변환하여 추가
  var charBuffer = StringBuffer();
  charBuffer.writeCharCode(65); // ASCII 65 = 'A'
  charBuffer.writeCharCode(66); // ASCII 66 = 'B'
  print(charBuffer); // AB

  print(sb.toString()); // StringBuffer의 결과물을 최종 String변환
  print(sb.length);
  print(sb.isEmpty);
  sb.clear();
  print(sb.length);
  print(sb.isEmpty);

  print("=== String 비교 StringBuffer ===");
  String result = "";
  StringBuffer buffer = StringBuffer();
  print("result.hashCode() : ${result.hashCode}");
  print("buffer.hashCode() : ${buffer.hashCode}");
  for (int i = 0; i < 100; i++) {
    result += i.toString(); // +로 문자열 객체를 생성. 매반복마다 새로운 String 생성.비추
    buffer.write(i); // 단일 버퍼 사용하여 성능 향상.
  }
  print(result);
  print(buffer);
  print("result.hashCode() : ${result.hashCode}");
  print("buffer.hashCode() : ${buffer.hashCode}");
  print("identical(result, buffer) = ${identical(result, buffer)} ");

}
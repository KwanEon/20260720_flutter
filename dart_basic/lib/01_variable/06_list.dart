import 'dart:io';
import 'dart:math';

main() {
  // List: 순서(O), 반복(O), [] 사용
  // generic을 사용하여 같은 타입으로 선언 가능
  // Iterable(반복 가능한 컬렉션)을 상속함으로 함수형 메서드 사용 가능
  List<String> blackpink = ['지수', '리사', '로제', '제니'];
  List mixed1 = [1, 'hello', true, 3.14];
  print(mixed1.runtimeType);
  List<dynamic> mixed2 = [1, 'hello', true, 3.14];
  List<Object> mixed3 = [1, 'hello', true, 3.14];
  print(mixed3.runtimeType);
  var l1 = [1, 2, 3]; // 타입 추론을 통해서 int 인식
  print(l1.runtimeType);
  var l2 = [1, "hello", true, 3.14];
  print(l2.runtimeType);
  var l3 = <dynamic>[1, "hello", true, 3.14];
  print(l3.runtimeType);
  dynamic l4 = [1, "hello", true, 3.14];
  print(l4.runtimeType);

  print(blackpink);
  print("블랙핑크: $blackpink");

  // 얕은 복사
  var whitepink = blackpink;
  blackpink.add("HOT");
  print(whitepink);
  print(blackpink);
  print(identical(blackpink, whitepink));
  print('blackpink ID: ${identityHashCode(blackpink)}');
  print('whitepink ID: ${identityHashCode(whitepink)}');

  // 깊은 복사
  List<int> original = [1, 2, 3, 4, 5];
  List<int> deepCopy = List.from(original);
  deepCopy[0] = 7;
  print(original);
  print(deepCopy);
  print(identical(original, deepCopy));
  print('original ID: ${identityHashCode(original)}');
  print('deepCopy ID: ${identityHashCode(deepCopy)}');

  // 1) List 접근
  print(blackpink);
  print(blackpink[0]);
  print(blackpink.first);
  print(blackpink.last);
  print(blackpink.elementAt(blackpink.length - 1)); // 인덱스로 접근, []와 동일
  print(blackpink.indexOf('로제'));
  print(blackpink.indexOf('지술')); // 없으면 -1 반환
  print(blackpink.contains("리사")); // 있으면 true, 없으면 false
  print(blackpink.length);
  print(blackpink.isEmpty);
  print(blackpink.isNotEmpty);

  // 2) List 추가
  blackpink.add("이날치");
  blackpink.addAll(["삼날치", "일날치"]);
  print(blackpink);
  blackpink.insert(0, '영날치');
  blackpink.insertAll(0, []);
  print(blackpink);

  // 3) List 수정
  List<int> numbers = [1, 2, 3, 4, 5];
  numbers[0] = 10;
  numbers.fillRange(1, 3, 8);
  print(numbers);
  numbers.replaceRange(0, 3, [1, 2, 3]);
  print(numbers);

  // 4) List 삭제
  List<String> alphabets = ["A", "B", "C", "D", "E", "B"];
  alphabets.remove('B'); // 해당값과 일치하는 첫번째 요소 삭제(성공하면 true 반환)
  print(alphabets);
  var tmp = alphabets.removeAt(alphabets.length - 1);
  print(tmp + "/" + alphabets.toString());
  alphabets.removeLast();
  print(alphabets);
  alphabets.removeWhere((item) => item == 'C' || item == "D");
  print(alphabets);
  alphabets.clear();
  print(alphabets);

  // 1) 함수형 메서드 forEach(): break, continue 사용불가
  List<int> nums = [1, 2, 3, 4, 5];
  for (var i in nums)
    print(i);
  nums.forEach((item) => stdout.write(item));
  print("");
  nums.asMap().forEach((index, item) {
    if (index != 0) stdout.write(",");
    stdout.write(item); // 콘솔에서만 사용, 웹에서는 에러 발생
  });

  // break, continue 사용하려면 for in문 사용
  for (var i in nums) {
    if (i == 3) break;
    print(i);
  }

  // 2) 함수형 메서드 map()
  var result = nums.forEach((n) => n * 2);
  // print(result);  아무 값도 없어서 출력 불가

  // toList() 없으면 MappedListIterable<int, int>
  var result2 = nums.map((n) => n * 2);
  print(result2.toString() + "/" + result2.runtimeType.toString());
  print(result2.toString() + "/" + result2
      .toList()
      .runtimeType
      .toString());

  // 3) 함수형 메서드 where()
  final newArtist = blackpink.where((name) => name.contains('날치')).toList();
  print(newArtist);
  final oldArtist = blackpink
      .where((name) => !name.contains('날치'))
      .toList()
      .map((name) => '블핑 $name');
  print(oldArtist);

  // 4) 함수형 메서드 fold()
  List<int> l5 = [10, 20, 30, 40];
  int sum = l5.fold(0, (prev, curr) => prev += curr);
  print(sum);
  List<String> items = ["사과", "바나나", "체리"];
  String output = items.fold("목록: ", (prev, curr) => '$prev $curr');
  print(output);

  // 5) 함수형 메서드 reduce()
  List<String> words = ["Dart", "는", "꿀잼이다"];
  String sentence = words.reduce((prev, curr) => '$prev $curr');
  print(sentence);
  List<int> l6 = [10, 20, 30, 40];
  int sum1 = l6.reduce((prev, curr) => prev > curr ? prev : curr);
  print(sum1);

  // 6) 함수형 메서드 filled :: growable은 리스트 생성후 크기변경가능여부 결정하는 매개변수
  List<int> list = List<int>.filled(10, 0, growable: true); // 0으로 10개 채우기
  print(list);
  list.add(0);
  print(list);
  for (int i = 0; i < list.length; i++) {
    list[i] = i + 1;
  }
  print(list);
  List<int> newList = list.map((item) => item * 0).toList();
  print(newList);

  // 7) 함수형 메서드 generate ::개별원소에 순차적인 값을 할당
  List<int> list1 = List<int>.generate(10, (i) {
    return i + 1;
  });
  print(list1);
  var listEven = list1.where((num) => num % 2 == 0).toList();
  print(listEven); //(2, 4, 6, 8, 10)
  print(listEven.runtimeType); // WhereIterable<int>

  // 8) 함수형 메서드 any :: 조건을 만족하는 요소가 하나 라도 있는지확인
  var score = List<int>.generate(10, (i) => Random().nextInt(50) + 51);
  print("score: $score");
  var anyScore = score.any((n) => n == 100); // 100 있으면 true
  print("anyScore: " + anyScore.toString());

  // 9) 함수형 메서드  응용
  var list3 = List<int>.generate(10, (i) => i + 1);
  print(list3);
  int tmp2 = 0;
  list3 = List<int>.filled(
    10,
    0,
    growable: true,
  ).map((i) => tmp2 += 1).toList();
  print(list3);

  print('list3: ${list3}');
  print(list3.reduce((tot, item) => tot += item));
  int tot2 = 0;
  for (int i = 0; i < list3.length; i++) {
    tot2 += list3[i];
  }
  print(tot2);

  // 10) 그외
  print('score: ${score}');
  score.sort();
  print('score sorted: ${score}');
  print(score.reversed.toList());
  score.shuffle();
  print('score shuffled: ${score}');
}
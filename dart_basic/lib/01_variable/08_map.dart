import 'dart:math';

void main() {
  // Map 키와 밸류로 이루어진 집합 {} 사용
  Map<String, String> hogwarts = {
    'Harry Potter': '해리 포터',
    'Draco Malfoy': '드레이크 말포이',
    'Hermione Granger': '헤르미온느 그레인저',
    'Vold Morte': '볼트 모트',
  };
  print(hogwarts);

  // 1) 접근, 키를 사용해서 밸류에 접근, 전체 키목록을 가져옴.
  print(hogwarts['Harry Potter']);
  print(hogwarts.containsKey("Vold Morte"));
  print(hogwarts.containsValue("론 위즐리"));
  print(hogwarts.keys);
  print(hogwarts.values);
  print(hogwarts.length);

  // 2) 추가
  Map<String, int> scores = {'국어': 90, '영어': 85};
  scores['수학'] = 100;
  print(scores);
  scores.addAll({'과학': 88, '사회': 92});
  print(scores);
  scores.putIfAbsent('국어', () => 95); // 있으면 무시
  scores['영어'] = 98; // 있어도 덮어씀
  scores.putIfAbsent('역사', () => 85);
  print(scores);

  // 3) 수정
  Map<String, String> colors = {'red': '빨강', 'blue': '파랑', 'green': '초록'};
  colors['red'] = "붉은색";
  colors.update('blue', (val) => '푸른색');
  colors.update('yellow', (val) => '푸른색', ifAbsent: () => '노랑');
  print(colors);

  // 4) 삭제
  Map<String, int> inventory = {
    'apple': 10,
    'banana': 0,
    'orange': 5,
    'grape': 0,
  };
  int? value = inventory.remove('apple'); //특정 키를 지우고 밸류 반환
  print(value);
  print(inventory);
  inventory.removeWhere((k, v) => v == 0);
  print(inventory);

  inventory.clear();
  print(inventory);

  // 1) forEach
  print(hogwarts);
  hogwarts.forEach((k, v) => print("$k : $v"));

  // 2) entries
  for (var e in hogwarts.entries) {
    print("${e.key} : ${e.value}");
  }

  // 3) iterable
  print("map${"=" * 20}");
  List<String> result = hogwarts.entries
      .map((e) => '${e.key}:${e.value}')
      .toList();
  print(result);
  var tmp = hogwarts.map((k, v) => MapEntry(k, "$v 🍓"));
  print(tmp);
  print(tmp.runtimeType);

  // 4) where
  Map<String, int> magicScore = {
    'Harry Potter': 90,
    'Volde Morte': 91,
    'Draco Malfoy': 77,
  };
  print("magic score : ${magicScore.values}");
  var highScore = magicScore.entries.where((e) => e.value >= 90);
  print(highScore);
  var maxScore = magicScore.entries.reduce(
        (curr, next) => curr.value > next.value ? curr : next,
  );
  maxScore = magicScore.values.reduce((a, b) => a > b ? a : b) as MapEntry<String, int>;
  var minScore = magicScore.entries.reduce(
        (curr, next) => curr.value < next.value ? curr : next,
  );
  print('최고점: $maxScore / 최저점: $minScore');

  // values(점수들의 Iterable)에서 최고/최소값 계산
  int highest = magicScore.values.reduce(max);
  int lowest = magicScore.values.reduce(min);

  print('최고 점수: $highest'); // 91
  print('최소 점수: $lowest');  // 77

  // 5) 그외 기타🎸
  print(hogwarts.containsKey('Harry Potter'));
  print(hogwarts.containsValue('해리 포터'));
  print(hogwarts.keys);
  print(hogwarts.values);
  print(hogwarts.length);
  print(hogwarts.isEmpty);
  print(hogwarts.isNotEmpty);
  hogwarts.putIfAbsent('Dumble Dore', () => '덤블 도어');
  print(hogwarts);
  hogwarts.remove('Dumble Dore');

  Map<String, int> magicScore2 = Map.from(magicScore); //deep copy
  magicScore2.putIfAbsent('Hegrid', () => 75);
  print(magicScore2);
  print(magicScore2.runtimeType);
  print(magicScore);
}
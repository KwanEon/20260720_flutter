import 'dart:math';

void main(){
  // Set 중복 불가, 순서 無
  List<int> list = List<int>.generate(10, (_) => Random().nextInt(5) + 1);
  print(list);

  Set<int> onlySet = list.toSet();
  print(onlySet.toString() + " " + onlySet.runtimeType.toString());
  // Set -> List 형변환
  List<int> tmp = onlySet.toList();
  tmp.sort();
  print(tmp);
  // 위의 3줄이 아래 한줄과 동일
  print(onlySet.toList()..sort()); //..sort() 캐스케이드 연산자

  Set<int> numbers = {1, 2, 3, 4, 5};
  print(numbers);

  // 1) 추가
  numbers.add(6);
  numbers.add(3); // 중복 허용 불가
  numbers.addAll([7, 8, 9]);

  // 2) 접근 :: []를 접근 불가, 존재와 부존에 대한 확인만 가능
  print(numbers);
  print(numbers.contains(3));
  print(numbers.first);
  print(numbers.last);
  print(numbers.elementAt(2)); // index로 접근
  numbers.forEach((n) => print('value: $n'));

  // 3) 수정 :: 직접 수정 불가(삭제후 새로 추가하는 방법)
  numbers.remove(9);
  numbers.add(10);
  print(numbers);

  // 4) 삭제
  Set<int> scores = {50,60,70,80,90};
  scores.remove(70); // 특정 값 삭제

  scores.removeAll({50,60});
  print(scores);
  scores.removeWhere((score) => score <85);
  print(scores);
  scores.clear();
  print(scores);

  // map,where은 결과가 iterable 타입(set 전환하려면 toSet()),나머지는 Set
  numbers = {1, 2, 3, 4, 5}; // 직접 입력도 가능함.
  var doubled = numbers.map((n) => n * 2);
  print('doubled : ${doubled}');

  numbers = {1, 2, 3, 4, 5}; // 직접 입력도 가능함.
  var evens = numbers.where((n) => n.isEven);
  print('evens: ${evens}');

  numbers = {1, 2, 3, 4, 5}; // 직접 입력도 가능함.
  var sum = numbers.reduce((a, b) => a * b);
  print('reduce 한 sum: ${sum}');

  numbers = {1, 2, 3}; // 직접 입력도 가능함.
  var product = numbers.fold(10, (a, b) => a * b);
  print('fold 한 sum: ${product}'); // 60 = 10*1*2*3

  Set<int> setA = {1, 2, 3, 4, 5};
  Set<int> setB = {4, 5, 6, 7, 8};

  // 1. 합집합 (Union) : 두 집합의 모든 요소를 합침 (중복 자동 제거)
  Set<int> unionSet = setA.union(setB);
  print('합집합: $unionSet');
  // 출력: {1, 2, 3, 4, 5, 6, 7, 8}

  // 2. 교집합 (Intersection) : 두 집합에 공통으로 존재하는 요소만 추출
  Set<int> intersectionSet = setA.intersection(setB);
  print('교집합: $intersectionSet');
  // 출력: {4, 5}

  // 3. 차집합 (Difference) : 기준 집합에서 상대 집합에 있는 요소를 제거
  // setA - setB (setA 기준으로 setB와 겹치는 4, 5 제거)
  Set<int> differenceSetA = setA.difference(setB);
  print('차집합 (A - B): $differenceSetA');
  // 출력: {1, 2, 3}

  // setB - setA (setB 기준으로 setA와 겹치는 4, 5 제거)
  Set<int> differenceSetB = setB.difference(setA);
  print('차집합 (B - A): $differenceSetB');
  // 출력: {6, 7, 8}


}
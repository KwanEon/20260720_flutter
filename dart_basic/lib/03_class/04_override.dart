void main() {

  Car c = Car();
  print(c.power);  // null 출력
  print(c._model);  // null 출력
  print(c ?? 'null');  // null 때문에 에러 발생

  // c를 출력할 때 toString()의 _model이 null이기 때문에 에러 발생
  c._model = "Bus";
  print(c);
}

class Car {
  var power;
  var cc;
  var _model;

  @override
  String toString() {
    return _model ?? '이름없음';  // null 처리를 해줌
  }

  @override
  int get hashCode {
    return 123;
  }
}
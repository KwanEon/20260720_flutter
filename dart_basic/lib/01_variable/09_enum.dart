class Colors {
  static const String red = "빨강";
  static const String green = "초록";
  static const String blue = "파랑";
}

class Animal {
  String name;
  int legs;

  Animal(this.name, this.legs);
}

// enum은 컴파일 시점에 고정되는 상수 집합이기 때문에 런타임중에 추가, 삭제, 수정 불가
// 대신에 접근, 요소에 필드/메서드를 추가하여 확장은 가능
enum Status { approved, pending, rejected }

enum Weekdays { Monday, Tuesday, Wendesday, Thursday, Friday, Saturday, Sunday }

enum UserRole {
  // 각 enum 요소에 고유 속성 부여
  admin('관리자', 1),
  user('일반 사용자', 2),
  guest('게스트', 3);

  // 생성자 및 필드 정의
  const UserRole(this.label, this.level);
  final String label;
  final int level;

  // enum 내부 메서드 작성도 가능!
  bool get isAdmin => this == UserRole.admin;
}

void main() {
  print(Colors.red);
  Animal dog = Animal("댕댕이", 4);
  print(dog);
  print(dog.name);

  // 1) 접근
  Status currStatus = Status.approved;
  print(currStatus);
  print("${Status.approved}");
  print(Status.approved.name); // enum의 이름만 문자열로 접근
  print(Status.approved.index);// enum의 index만 순서로 접근
  print(Status.values); // 모든 enum요소를 List형태로 접근
  print("byName: ${Status.values.byName("approved")}");

  // 2) 추가, 삭제, 수정이 불가 :: 코드 작성 시점에 미리 정해두어야함

  UserRole role = UserRole.admin;

  // 속성 및 메서드 접근
  print(role.label);   // 관리자
  print(role.level);   // 1
  print(role.isAdmin); // true

  print(UserRole.user.isAdmin);

}
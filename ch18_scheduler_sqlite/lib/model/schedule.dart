import 'package:drift/drift.dart';

class Schedules extends Table {
  // ()() 메서드 호출과 함수 실행이 연속적으로 일어나는 Dart의 문법.
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text()();
  DateTimeColumn get date => dateTime()();
  IntColumn get startTime => integer()();
  IntColumn get endTime => integer()();
}
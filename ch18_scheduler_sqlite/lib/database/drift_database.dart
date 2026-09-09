import 'package:ch18_scheduler_sqlite/model/schedule.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'drift_database.g.dart';
// 콘솔에서 dart run build_runner build 실행후 자동으로 위의 파일 생성

@DriftDatabase(
  tables: [Schedules], //앱에서 사용할 테이블 등록
)

class LocalDatabase extends _$LocalDatabase {
  // 생성자를 통해서 데이터베이스에 접속됨.
  LocalDatabase() : super(_openConnection());

  // watchSchedules: 데이터를 실시간으로 조회하고 변화를 감지해서 화면 업데이트가 목적
  Stream<List<Schedule>> watchSchedules(DateTime date) =>
      (select(schedules)..where((tbl) => tbl.date.equals(date))).watch();

  // 새로운 스케줄을 추가하는 함수
  Future<int> createSchedule(SchedulesCompanion data) =>
      into(schedules).insert(data);

  // 특정 id를 가진 스케줄을 삭제
  Future<int> removeSchedule(int id) =>
      (delete(schedules)..where((tbl) => tbl.id.equals(id))).go();

  @override // 기존 테이블 구조를 변경할 때 버전 다르게 줄수 있음
  int get schemaVersion => 1;
}

// SQLite에 접속하기 위한 함수
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
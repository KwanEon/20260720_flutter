import 'package:ch18_scheduler_test/database/drift_database.dart';
import 'package:ch18_scheduler_test/screen/login_screen.dart';
import 'package:ch18_scheduler_test/service/account_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ko_KR');

  final database = LocalDatabase();
  GetIt.I.registerSingleton<LocalDatabase>(database);
  final accountStore = await AccountStore.create();

  runApp(SchedulerApp(accountStore: accountStore));
}

class SchedulerApp extends StatelessWidget {
  const SchedulerApp({required this.accountStore, super.key});

  final AccountStore accountStore;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '일정 관리',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: LoginScreen(accountStore: accountStore),
    );
  }
}

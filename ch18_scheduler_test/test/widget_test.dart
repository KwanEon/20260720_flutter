import 'package:ch18_scheduler_test/screen/login_screen.dart';
import 'package:ch18_scheduler_test/service/account_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('기본 admin 계정과 새 계정이 저장된다', () async {
    final accountStore = await AccountStore.create();

    expect(accountStore.authenticate('admin', '1'), isTrue);
    expect(accountStore.authenticate('admin', 'wrong'), isFalse);

    expect(await accountStore.register('new-user', '1234'), isTrue);
    expect(accountStore.authenticate('new-user', '1234'), isTrue);
    expect(await accountStore.register('new-user', '5678'), isFalse);

    final reloadedAccountStore = await AccountStore.create();
    expect(reloadedAccountStore.authenticate('new-user', '1234'), isTrue);
  });

  testWidgets('회원가입 후 새 계정으로 로그인할 수 있다', (tester) async {
    final accountStore = await AccountStore.create();

    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(
          accountStore: accountStore,
          homeBuilder: (_) => const Scaffold(body: Text('메인 화면')),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('openSignUpButton')));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byKey(const Key('signUpUserIdField')),
      'tester',
    );
    await tester.enterText(
      find.byKey(const Key('signUpPasswordField')),
      '1234',
    );
    await tester.tap(find.byKey(const Key('signUpButton')));
    await tester.pumpAndSettle();

    expect(find.text('회원가입이 완료되었습니다. 로그인해 주세요.'), findsOneWidget);

    await tester.tap(find.byKey(const Key('backToLoginButton')));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('loginUserIdField')), 'tester');
    await tester.enterText(find.byKey(const Key('loginPasswordField')), '1234');
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pumpAndSettle();

    expect(find.text('메인 화면'), findsOneWidget);
  });
}

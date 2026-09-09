import 'package:ch18_scheduler_test/screen/home_screen.dart';
import 'package:ch18_scheduler_test/screen/sign_up_screen.dart';
import 'package:ch18_scheduler_test/service/account_store.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({required this.accountStore, this.homeBuilder, super.key});

  final AccountStore accountStore;
  final WidgetBuilder? homeBuilder;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userIdController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _userIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final isAuthenticated = widget.accountStore.authenticate(
      _userIdController.text,
      _passwordController.text,
    );

    if (!isAuthenticated) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('아이디 또는 비밀번호가 올바르지 않습니다.')));
      return;
    }

    final homeScreen = widget.homeBuilder?.call(context) ?? const HomeScreen();
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute<void>(builder: (_) => homeScreen));
  }

  void _openSignUp() {
    FocusScope.of(context).unfocus();
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => SignUpScreen(accountStore: widget.accountStore),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('로그인')),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Icon(
                      Icons.calendar_month_rounded,
                      size: 72,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '일정 관리',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 32),
                    TextFormField(
                      key: const Key('loginUserIdField'),
                      controller: _userIdController,
                      decoration: const InputDecoration(
                        labelText: '아이디',
                        prefixIcon: Icon(Icons.person_outline),
                        border: OutlineInputBorder(),
                      ),
                      autofillHints: const [AutofillHints.username],
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return '아이디를 입력해 주세요.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      key: const Key('loginPasswordField'),
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: '비밀번호',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          tooltip: _obscurePassword ? '비밀번호 표시' : '비밀번호 숨기기',
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                        border: const OutlineInputBorder(),
                      ),
                      obscureText: _obscurePassword,
                      autofillHints: const [AutofillHints.password],
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _login(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '비밀번호를 입력해 주세요.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: FilledButton(
                            key: const Key('loginButton'),
                            onPressed: _login,
                            child: const Text('로그인'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton(
                            key: const Key('openSignUpButton'),
                            onPressed: _openSignUp,
                            child: const Text('회원가입'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

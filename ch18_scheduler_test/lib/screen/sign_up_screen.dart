import 'package:ch18_scheduler_test/service/account_store.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({required this.accountStore, super.key});

  final AccountStore accountStore;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userIdController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _isSaving = false;

  @override
  void dispose() {
    _userIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSaving = true;
    });

    final isRegistered = await widget.accountStore.register(
      _userIdController.text,
      _passwordController.text,
    );

    if (!mounted) {
      return;
    }

    setState(() {
      _isSaving = false;
    });

    if (!isRegistered) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('이미 사용 중인 아이디입니다.')));
      return;
    }

    _passwordController.clear();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('회원가입이 완료되었습니다. 로그인해 주세요.')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('회원가입')),
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
                    Text(
                      '새 계정 만들기',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 32),
                    TextFormField(
                      key: const Key('signUpUserIdField'),
                      controller: _userIdController,
                      decoration: const InputDecoration(
                        labelText: '아이디',
                        prefixIcon: Icon(Icons.person_outline),
                        border: OutlineInputBorder(),
                      ),
                      autofillHints: const [AutofillHints.newUsername],
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
                      key: const Key('signUpPasswordField'),
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
                      autofillHints: const [AutofillHints.newPassword],
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _signUp(),
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
                            key: const Key('signUpButton'),
                            onPressed: _isSaving ? null : _signUp,
                            child: _isSaving
                                ? const SizedBox.square(
                                    dimension: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text('회원가입'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton(
                            key: const Key('backToLoginButton'),
                            onPressed: _isSaving
                                ? null
                                : () => Navigator.of(context).pop(),
                            child: const Text('로그인'),
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

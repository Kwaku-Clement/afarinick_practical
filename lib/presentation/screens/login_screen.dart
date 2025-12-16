import 'package:afarinick_test/presentation/screens/dashboard_screen.dart';
import 'package:afarinick_test/presentation/widgets/label_field.dart';
import 'package:afarinick_test/presentation/widgets/password_textfield.dart';
import 'package:afarinick_test/presentation/widgets/phone_input_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _stayLoggedIn = false;
  bool _obscurePassword = true;
  String _countryCode = 'GH';

  @override
  Widget build(BuildContext context) {
    final primary = const Color(0xFF224C21);

    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SizedBox(height: 87),
            const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 3),
            const Text(
              'Sign into your account',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 26),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomLeft: Radius.circular(120),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 60),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: LabeledField(
                          label: 'Phone Number',
                          requiredMark: true,
                          child: PhoneInputCard(
                            controller: _phoneController,
                            countryCode: _countryCode,
                            onCountryChanged: (code) => setState(() {
                              _countryCode = code;
                            }),
                            primary: primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: LabeledField(
                          label: 'Password',
                          requiredMark: true,
                          child: PasswordInputCard(
                            controller: _passwordController,
                            obscure: _obscurePassword,
                            onToggleObscure: () => setState(() {
                              _obscurePassword = !_obscurePassword;
                            }),
                            primary: primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 19),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: RememberForgotRow(
                          stayLoggedIn: _stayLoggedIn,
                          onStayLoggedInChanged: (v) => setState(() {
                            _stayLoggedIn = v ?? false;
                          }),
                          primary: primary,
                        ),
                      ),
                      const SizedBox(height: 41),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 26.0),
                        child: LoginButtonCard(
                          primary: primary,
                          onPressed: _onLogin,
                        ),
                      ),
                      const SizedBox(height: 162),
                      CreateAccountFooter(
                        onTapCreate: _onCreateAccount,
                        primary: primary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onLogin() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const DashboardScreen()));
  }

  void _onCreateAccount() {}
}

class RememberForgotRow extends StatelessWidget {
  final bool stayLoggedIn;
  final ValueChanged<bool?> onStayLoggedInChanged;
  final Color primary;
  const RememberForgotRow({
    super.key,
    required this.stayLoggedIn,
    required this.onStayLoggedInChanged,
    required this.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: stayLoggedIn,
          onChanged: onStayLoggedInChanged,
          side: BorderSide(color: primary),
          checkColor: Colors.white,
          activeColor: primary,
        ),
        Text(
          'Stay logged In',
          style: TextStyle(color: primary, fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            'Forgot Password?',
            style: TextStyle(color: primary, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

class LoginButtonCard extends StatelessWidget {
  final VoidCallback onPressed;
  final Color primary;
  const LoginButtonCard({
    super.key,
    required this.onPressed,
    required this.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: primary,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onPressed,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 18),
          child: Center(
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CreateAccountFooter extends StatelessWidget {
  final VoidCallback onTapCreate;
  final Color primary;
  const CreateAccountFooter({
    super.key,
    required this.onTapCreate,
    required this.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t  have an account?",
          style: TextStyle(
            color: Colors.black.withValues(alpha: 0.8),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 6),
        TextButton(
          onPressed: onTapCreate,
          child: Text(
            'Create Account',
            style: TextStyle(color: primary, fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }
}

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:konekseed_test/common/custom_text_input.dart';
import 'package:konekseed_test/presentation/view/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<StatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  void navigateToRegister() {
    _formKey.currentState!.reset();
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const RegisterView()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomTextInput(
                      title: "Email",
                      controller: _emailController,
                      enabled: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Fill The Field";
                        } else if (!EmailValidator.validate(value)) {
                          return "Email is not valid";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    PasswordTextInput(
                      title: "Password",
                      controller: _passwordController,
                      enabled: true,
                      validator: (value) =>
                          value!.isEmpty ? "Please Fill The Field" : null,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
                GestureDetector(
                  onTap: () => navigateToRegister(),
                  child: const Text(
                    "Dont have an account? Register here",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // login();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

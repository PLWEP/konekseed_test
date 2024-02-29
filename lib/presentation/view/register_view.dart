import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:konekseed_test/common/custom_text_input.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  void backToLogin(BuildContext context) => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    Column(
                      textDirection: TextDirection.ltr,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Register',
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
                        const SizedBox(height: 10),
                        PasswordTextInput(
                          title: "Password",
                          controller: _passwordController,
                          enabled: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Fill The Field";
                            } else if (value.length < 6) {
                              return "Password is too short";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        PasswordTextInput(
                          title: "Confirm Password",
                          controller: _confirmPasswordController,
                          enabled: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Fill The Field";
                            } else if (_passwordController.text !=
                                _confirmPasswordController.text) {
                              return "Password does not match";
                            } else if (value.length < 6) {
                              return "Password is too short";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => backToLogin(context),
                      child: const Text(
                        "Already have an account? Login here",
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
                            // register();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: const Text(
                          'Register',
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
            ],
          ),
        ),
      ),
    );
  }
}

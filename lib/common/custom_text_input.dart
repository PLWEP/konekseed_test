import 'package:flutter/material.dart';
import 'package:konekseed_test/common/utils.dart';

class CustomTextInput extends StatelessWidget {
  final String title;
  final bool obsecure;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool enabled;
  const CustomTextInput({
    super.key,
    required this.title,
    this.obsecure = false,
    required this.controller,
    required this.validator,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        TextFormField(
          validator: validator,
          controller: controller,
          obscureText: obsecure,
          enabled: enabled,
          textAlign: TextAlign.start,
          decoration: decoration,
          cursorColor: Colors.black,
        ),
      ],
    );
  }
}

class PasswordTextInput extends CustomTextInput {
  const PasswordTextInput({
    super.key,
    required super.title,
    required super.controller,
    required super.validator,
    required super.enabled,
    super.obsecure = true,
  });
}

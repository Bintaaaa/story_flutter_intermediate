import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const TextFieldComponent({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: false,
      decoration: InputDecoration(
        label: Text(
          label,
        ),
      ),
    );
  }
}

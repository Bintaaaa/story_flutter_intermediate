import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int maxLines;

  const TextFieldComponent({
    super.key,
    required this.controller,
    required this.label,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: false,
      maxLines: maxLines,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12.0,
          ),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.greenAccent,
          ),
        ),
        label: Text(
          label,
        ),
      ),
    );
  }
}

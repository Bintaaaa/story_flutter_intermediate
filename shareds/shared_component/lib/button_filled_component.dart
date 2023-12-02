import 'package:flutter/material.dart';

class ButtonFilledComponent extends StatelessWidget {
  final double _width;
  final Widget _child;
  final bool isLoading;
  final Function() onPressed;
  ButtonFilledComponent({
    super.key,
    required this.onPressed,
    this.isLoading = false,
    double? width,
    String? title,
    Widget? titleWithWidget,
  })  : _width = width ?? double.infinity,
        _child = titleWithWidget ?? Text(title ?? "");

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      height: 55.0,
      child: ElevatedButton(
        onPressed: isLoading ? () {} : onPressed,
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : _child,
      ),
    );
  }
}

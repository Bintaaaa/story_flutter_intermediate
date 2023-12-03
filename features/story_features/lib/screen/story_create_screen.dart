import 'package:flutter/material.dart';
import 'package:shared_common/constans/constans_values.dart';
import 'package:shared_libraries/go_router/go_router.dart';

class StoryCreateScreen extends StatelessWidget {
  const StoryCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            context.pushReplacementNamed(
              ConstansValue.routes.optionalAuthName,
            );
          },
          child: Text(
            "Make A Story",
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_common/constans/constans_values.dart';
import 'package:shared_libraries/go_router/go_router.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({super.key});

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
            "story",
          ),
        ),
      ),
    );
  }
}

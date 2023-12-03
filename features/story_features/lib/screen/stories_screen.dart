import 'package:flutter/material.dart';
import 'package:shared_common/constans/constans_values.dart';
import 'package:shared_component/card/card_component.dart';
import 'package:shared_libraries/go_router/go_router.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Selamat Datang!",
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(ConstansValue.routes.profileName);
            },
            icon: Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return CardComponent(
            image: "s",
            title: "Bijan",
            description: "Title",
            onTap: () {
              context.goNamed(
                ConstansValue.routes.storyName,
                pathParameters: {
                  "id": "12",
                },
              );
            },
          );
        },
      ),
    );
  }
}

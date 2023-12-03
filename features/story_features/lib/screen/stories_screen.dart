import 'package:flutter/material.dart';
import 'package:shared_common/constans/constans_values.dart';
import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_component/card/card_component.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/go_router/go_router.dart';
import 'package:story_features/bloc/story_cubit.dart';
import 'package:story_features/bloc/story_state.dart';

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
      body: SafeArea(
        child: BlocBuilder<StoryCubit, StoryState>(
          builder: (context, state) {
            final status = state.stateStories.status;
            if (status.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (status.isNoData) {
              return Center(
                child: Text(
                  state.stateStories.message,
                ),
              );
            } else if (status.isHasData) {
              final data = state.stateStories.data!.listStory;
              return ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CardComponent(
                    image: data[index].photoUrl,
                    title: data[index].name,
                    description: data[index].description,
                    onTap: () {
                      context.pushNamed(
                        ConstansValue.routes.storyName,
                        pathParameters: {
                          "id": data[index].id,
                        },
                      );
                    },
                  );
                },
              );
            } else {
              return Center(
                child: Text(
                  state.stateStories.failure!.errorMessage ?? '',
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

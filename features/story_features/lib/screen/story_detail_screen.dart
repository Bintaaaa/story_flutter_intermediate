import 'package:flutter/material.dart';
import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_component/images/image_network_component.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:story_features/bloc/story_cubit.dart';
import 'package:story_features/bloc/story_state.dart';

class StoryDetailScreen extends StatelessWidget {
  const StoryDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Story Detail",
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<StoryCubit, StoryState>(
          builder: (context, state) {
            final status = state.stateStory.status;
            if (status.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (status.isNoData) {
              return Center(
                child: Text(
                  state.stateStory.message,
                ),
              );
            } else if (status.isHasData) {
              final data = state.stateStory.data!.story;
              return Container(
                margin: const EdgeInsets.all(
                  16.0,
                ),
                child: ListView(
                  children: [
                    ClipRRect(
                      child: ImageNetworkComponent(
                        image: data.photoUrl!,
                        height: 500.0,
                      ),
                    ),
                    const SizedBox.square(
                      dimension: 16.0,
                    ),
                    Text(
                      data.name!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox.square(
                      dimension: 16.0,
                    ),
                    Text(
                      data.description!,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text(
                  state.stateStory.failure!.errorMessage ?? '',
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

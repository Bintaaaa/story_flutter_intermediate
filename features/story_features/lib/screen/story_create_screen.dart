import 'package:flutter/material.dart';
import 'package:shared_common/constans/constans_values.dart';
import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_component/button/button_filled_component.dart';
import 'package:shared_component/text_field/text_field_component.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/go_router/go_router.dart';
import 'package:story_features/bloc/story_cubit.dart';
import 'package:story_features/bloc/story_state.dart';

class StoryCreateScreen extends StatefulWidget {
  final StoryCubit bloc;
  const StoryCreateScreen({
    super.key,
    required this.bloc,
  });

  @override
  State<StoryCreateScreen> createState() => _StoryCreateScreenState();
}

class _StoryCreateScreenState extends State<StoryCreateScreen> {
  TextEditingController descriptionController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Make A Story",
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(
            16.0,
          ),
          child: ListView(
            children: [
              InkWell(
                onTap: () {
                  context.read<StoryCubit>().getImage();
                },
                child: BlocBuilder<StoryCubit, StoryState>(
                  builder: (context, state) {
                    final data = state.stateImage.data;
                    return Container(
                      width: 250.0,
                      height: 250.0,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(
                          18.0,
                        ),
                      ),
                      child: data != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(
                                18.0,
                              ),
                              child: Image.file(
                                data,
                                fit: BoxFit.cover,
                              ),
                            )
                          : const Center(
                              child: Text(
                                "Take a Picture",
                              ),
                            ),
                    );
                  },
                ),
              ),
              const SizedBox.square(
                dimension: 18.0,
              ),
              TextFieldComponent(
                controller: descriptionController,
                label: "Description",
                maxLines: 3,
              ),
              const SizedBox.square(
                dimension: 54.0,
              ),
              BlocConsumer<StoryCubit, StoryState>(
                listener: (context, state) async {
                  final status = state.stateCreateStory.status;

                  if (status.isError) {
                    final errorMessage = state.stateCreateStory.message;
                    final snackBar = SnackBar(
                      content: Text(errorMessage),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else if (status.isHasData) {
                    context.go(
                      ConstansValue.routes.storiesPath,
                    );
                    await widget.bloc.getStories();
                  }
                },
                builder: (context, state) {
                  final status = state.stateCreateStory.status;
                  return ButtonFilledComponent(
                    onPressed: () {
                      context.read<StoryCubit>().postStory(
                            descriptionController.text,
                          );
                    },
                    isLoading: status.isLoading,
                    title: "Posting Now!",
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

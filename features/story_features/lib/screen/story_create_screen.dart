import 'package:flutter/material.dart';
import 'package:shared_common/constans/constans_values.dart';
import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_component/button/button_filled_component.dart';
import 'package:shared_component/text_field/text_field_component.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/go_router/go_router.dart';
import 'package:shared_libraries/intl/app_localizations.dart';
import 'package:story_features/bloc/maps/maps_cubit.dart';
import 'package:story_features/bloc/maps/maps_state.dart';
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
  final MapsCubit mapsCubit = MapsCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.createAppBar,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(
            ConstansValue.routes.storyMapsName,
            extra: mapsCubit,
          );
        },
        child: const Icon(
          Icons.pin_drop_rounded,
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
                          : Center(
                              child: Text(
                                  AppLocalizations.of(context)!.takeApicture),
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
                label: AppLocalizations.of(context)!.description,
                maxLines: 3,
              ),
              const SizedBox.square(
                dimension: 16.0,
              ),
              BlocBuilder<MapsCubit, MapsState>(
                bloc: mapsCubit,
                builder: (context, state) {
                  final dataAddress = state.picMyCoordinateState.data;
                  if (state.latLngState.data != null) {
                    return Container(
                      padding: const EdgeInsets.all(
                        8.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                        border: Border.all(
                          color: Colors.amber,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Wrap(
                            spacing: 8.0,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: Colors.amber,
                              ),
                              Text(
                                "Data lokasi Anda sudah diambil",
                                style: TextStyle(
                                  color: Colors.amber,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox.square(dimension: 8.0),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 32.0,
                            ),
                            child: Text(
                              "${dataAddress![0].street}, ${dataAddress[0].administrativeArea}, ${dataAddress[0].country}, ${dataAddress[0].postalCode}",
                              style: const TextStyle(
                                fontSize: 14.0,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              const SizedBox.square(
                dimension: 16.0,
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
                            description: descriptionController.text,
                            latLng: mapsCubit.state.latLngState.data,
                          );
                    },
                    isLoading: status.isLoading,
                    title: AppLocalizations.of(context)!.buttonPost,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

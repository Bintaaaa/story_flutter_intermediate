import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_common/constans/constans_values.dart';
import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_component/card/card_component.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/go_router/go_router.dart';
import 'package:shared_libraries/intl/app_localizations.dart';
import 'package:story_features/bloc/story_cubit.dart';
import 'package:story_features/bloc/story_state.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({super.key});

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        context.read<StoryCubit>().getLazyStories();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.homeAppBar,
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(ConstansValue.routes.profileName);
            },
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final bloc = context.read<StoryCubit>();
          context.pushNamed(
            ConstansValue.routes.createStoriesName,
            extra: bloc,
          );
        },
        child: const Icon(
          Icons.camera,
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await context.read<StoryCubit>().getStories();
          },
          child: BlocConsumer<StoryCubit, StoryState>(
            listener: (context, state) {
              final String? message = state.stateStories.data?.message;
              final status = state.stateStories.status;
              if (status.isHasData) {
                if (message!.isNotEmpty) {
                  final snackBar = SnackBar(
                    content: Text(message),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              }
            },
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
                final data = state.stateStories.data?.listStories;
                return ListView.builder(
                  controller: scrollController,
                  itemCount: data!.length + 1,
                  itemBuilder: (context, index) {
                    if (index < data.length) {
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
                    } else {
                      return const CupertinoActivityIndicator();
                    }
                  },
                );
              } else {
                return Center(
                  child: Text(
                    state.stateStories.message ?? '',
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

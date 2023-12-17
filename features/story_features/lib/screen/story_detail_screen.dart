import 'package:flutter/material.dart';
import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_component/images/image_network_component.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_libraries/intl/app_localizations.dart';
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
        title: Text(
          AppLocalizations.of(context)!.detailAppBar,
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
                    const SizedBox.square(
                      dimension: 16.0,
                    ),
                    MapsWidget(
                      lat: data.lat,
                      lng: data.lon,
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text(
                  state.stateStory.message,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class MapsWidget extends StatefulWidget {
  final double? lat;
  final double? lng;
  const MapsWidget({super.key, this.lat, this.lng});

  @override
  State<MapsWidget> createState() => _MapsWidgetState();
}

class _MapsWidgetState extends State<MapsWidget> {
  Set<Marker> markers = {};
  @override
  void initState() {
    super.initState();
    if (widget.lat != 0) {
      final marker = Marker(
        markerId: const MarkerId("loc"),
        position: LatLng(
          widget.lat!,
          widget.lng!,
        ),
      );
      markers.add(marker);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.lat == 0) {
      return const SizedBox();
    } else {
      return SizedBox(
        height: 200,
        child: GoogleMap(
          markers: markers,
          initialCameraPosition: CameraPosition(
            zoom: 18,
            target: LatLng(
              widget.lat!,
              widget.lng!,
            ),
          ),
        ),
      );
    }
  }
}

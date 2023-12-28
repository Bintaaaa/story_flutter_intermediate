import 'package:flutter/material.dart';
import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_common/utilities/utilitites_checking_value.dart';
import 'package:shared_component/images/image_network_component.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_libraries/intl/app_localizations.dart';
import 'package:story_features/bloc/maps/maps_cubit.dart';
import 'package:story_features/bloc/maps/maps_state.dart';
import 'package:story_features/bloc/story_cubit.dart';
import 'package:story_features/bloc/story_state.dart';

class StoryDetailScreen extends StatefulWidget {
  const StoryDetailScreen({
    super.key,
  });

  @override
  State<StoryDetailScreen> createState() => _StoryDetailScreenState();
}

class _StoryDetailScreenState extends State<StoryDetailScreen> {
  double height = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.detailAppBar,
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<StoryCubit, StoryState>(
          listener: (context, state) {
            final status = state.stateStory.status;
            if (status.isHasData) {
              setState(() {
                height =
                    600.0; // Set the target height for the bounce animation
              });
              Future.delayed(const Duration(milliseconds: 200), () {
                setState(
                  () {
                    height = 500; // Reset the height after the bounce animation
                  },
                );
              });
            }
          },
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
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.bounceOut,
                      height: height,
                      child: ClipRRect(
                        child: ImageNetworkComponent(
                          image: data.photoUrl!,
                          height: height,
                        ),
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
                    BlocListener<MapsCubit, MapsState>(
                      listener: (context, state) {
                        if (status.isHasData) {
                          final data = state.picMyCoordinateState.data;
                          if (data.isNotNull()) {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 200,
                                  padding: const EdgeInsets.all(
                                    16.0,
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const Text(
                                          'Detail Alamat',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox.square(
                                          dimension: 16.0,
                                        ),
                                        Text(
                                          "${data?[0].street}, ${data?[0].administrativeArea}, ${data?[0].country}, ${data?[0].postalCode}",
                                        ),
                                        const SizedBox.square(
                                          dimension: 16.0,
                                        ),
                                        ElevatedButton(
                                          child: const Text(
                                            'Kembali',
                                          ),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        }
                      },
                      child: MapsWidget(
                        lat: data.lat,
                        lng: data.lon,
                        contextMapsCubit: context,
                      ),
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
  final BuildContext contextMapsCubit;

  const MapsWidget({
    super.key,
    this.lat,
    this.lng,
    required this.contextMapsCubit,
  });

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
        onTap: () {
          widget.contextMapsCubit.read<MapsCubit>().getAddressByCoordinate(
                latLng: LatLng(widget.lat!, widget.lng!),
              );
        },
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

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_component/button/button_filled_component.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/go_router/go_router.dart';
import 'package:shared_libraries/google_maps_flutter/google_maps_flutter.dart';
import 'package:story_features/bloc/maps/maps_cubit.dart';
import 'package:story_features/bloc/maps/maps_state.dart';

class StoryMapsScreen extends StatefulWidget {
  const StoryMapsScreen({
    super.key,
    required this.mapsCubit,
  });

  final MapsCubit mapsCubit;

  @override
  State<StoryMapsScreen> createState() => _StoryMapsScreenState();
}

class _StoryMapsScreenState extends State<StoryMapsScreen> {
  late GoogleMapController mapController;

  @override
  void dispose() {
    super.dispose();
    mapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<MapsCubit, MapsState>(
          builder: (context, state) {
            final status = state.locationState.status;
            if (status.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (status.isHasData) {
              final data = state.locationState.data;
              final dataMarkers = state.setMarkerState.data;
              return GoogleMap(
                onMapCreated: (controller) {
                  setState(() {
                    mapController = controller;
                  });
                },
                markers: dataMarkers!,
                onTap: (position) {
                  context.read<MapsCubit>().getCoordinateByMark(
                        position,
                        mapController,
                      );
                  log(
                    "position you tap on lat ${position.latitude} on long ${position.longitude}",
                  );
                },
                myLocationButtonEnabled: true,
                zoomControlsEnabled: false,
                mapToolbarEnabled: false,
                myLocationEnabled: true,
                initialCameraPosition: CameraPosition(
                  zoom: 18,
                  target: LatLng(
                    data!.latitude!,
                    data.longitude!,
                  ),
                ),
              );
            } else {
              return Text(
                state.locationState.message,
              );
            }
          },
        ),
      ),
      floatingActionButton: Container(
        height: 200,
        margin: const EdgeInsets.only(
          left: 32.0,
        ),
        padding: const EdgeInsets.all(
          16.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            18.0,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 10,
              offset: Offset(2, 4),
            )
          ],
        ),
        child: BlocBuilder<MapsCubit, MapsState>(
          builder: (context, state) {
            final status = state.picMyCoordinateState.status;
            if (status.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (status.isHasData) {
              final data = state.picMyCoordinateState.data;
              final dataLatLong = state.latLngState.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    runSpacing: 16.0,
                    children: [
                      const Text(
                        "Anda sedang berada di",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${data![0].street}, ${data[0].administrativeArea}, ${data[0].country}, ${data[0].postalCode}",
                        style: const TextStyle(
                          fontSize: 16.0,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 3,
                      ),
                    ],
                  ),
                  ButtonFilledComponent(
                    title: "Pilih",
                    onPressed: () {
                      widget.mapsCubit.getCoordinateByMark(
                        dataLatLong!,
                        mapController,
                      );
                      context.pop(context);
                    },
                  )
                ],
              );
            } else if (status.isError) {
              final message = state.picMyCoordinateState.message;
              return Column(
                children: [
                  Text(
                    message,
                  ),
                  ButtonFilledComponent(
                    title: "Coba Ulang",
                    onPressed: () {
                      context.read<MapsCubit>().getAddressByCoordinate();
                    },
                  )
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

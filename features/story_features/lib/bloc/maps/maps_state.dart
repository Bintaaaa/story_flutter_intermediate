import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_libraries/equatable/equatable.dart';
import 'package:shared_libraries/get_it/geocoding.dart';
import 'package:shared_libraries/google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_libraries/location/location.dart';

class MapsState extends Equatable {
  final ViewData<LocationData> locationState;
  final ViewData<bool> permissionState;
  final ViewData<List<Placemark>> picMyCoordinateState;
  final ViewData<Set<Marker>> setMarkerState;
  final ViewData<LatLng> latLngState;

  const MapsState({
    required this.locationState,
    required this.permissionState,
    required this.picMyCoordinateState,
    required this.setMarkerState,
    required this.latLngState,
  });

  MapsState copyWith(
          {ViewData<LocationData>? locationState,
          ViewData<bool>? permissionState,
          ViewData<List<Placemark>>? picMyCoordinateState,
          ViewData<Set<Marker>>? setMarkerState,
          ViewData<LatLng>? latLngState}) =>
      MapsState(
        locationState: locationState ?? this.locationState,
        permissionState: permissionState ?? this.permissionState,
        picMyCoordinateState: picMyCoordinateState ?? this.picMyCoordinateState,
        setMarkerState: setMarkerState ?? this.setMarkerState,
        latLngState: latLngState ?? this.latLngState,
      );

  @override
  List<Object?> get props => [
        locationState,
        permissionState,
        picMyCoordinateState,
        setMarkerState,
        latLngState,
      ];
}

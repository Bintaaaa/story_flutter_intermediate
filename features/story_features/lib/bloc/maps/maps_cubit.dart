import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_common/utilities/utilitites_checking_value.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/geocoding/geocoding.dart' as geo;
import 'package:shared_libraries/google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_libraries/location/location.dart';
import 'package:story_features/bloc/maps/maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  MapsCubit()
      : super(
          MapsState(
            locationState: ViewData.initial(),
            permissionState: ViewData.initial(),
            picMyCoordinateState: ViewData.initial(),
            setMarkerState: ViewData.loaded(data: {}),
            latLngState: ViewData.initial(),
          ),
        );

  Future<void> getMyCurrentLocation() async {
    emit(
      state.copyWith(
        locationState: ViewData.loading(),
      ),
    );
    final Location location = Location();

    try {
      final result = await location.getLocation();
      emit(
        state.copyWith(
          locationState: ViewData.loaded(
            data: result,
          ),
        ),
      );
      getAddressByCoordinate();
    } catch (e) {
      emit(
        state.copyWith(
          locationState: ViewData.error(
            message: "Gagal mengambil data lokasi dari pacakge",
          ),
        ),
      );
    }
  }

  Future<void> getMapsPermission() async {
    late PermissionStatus permissionGranted;
    final Location location = Location();

    try {
      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied ||
          permissionGranted == PermissionStatus.deniedForever) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted == PermissionStatus.denied ||
            permissionGranted == PermissionStatus.deniedForever) {
          emit(
            state.copyWith(
              permissionState: ViewData.loaded(
                data: false,
              ),
            ),
          );
        } else {
          emit(
            state.copyWith(
              permissionState: ViewData.loaded(
                data: true,
              ),
            ),
          );
        }
      } else {
        emit(
          state.copyWith(
            permissionState: ViewData.loaded(
              data: true,
            ),
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          permissionState: ViewData.error(
            message: "Gagal meminta permission",
          ),
        ),
      );
    }
  }

  Future<void> getAddressByCoordinate({LatLng? latLng}) async {
    emit(
      state.copyWith(
        picMyCoordinateState: ViewData.loading(),
      ),
    );
    try {
      if (latLng.isNotNull()) {
        emit(
          state.copyWith(
            picMyCoordinateState: ViewData.loaded(
              data: await geo.placemarkFromCoordinates(
                latLng!.latitude,
                latLng.longitude,
              ),
            ),
          ),
        );
      } else if (state.locationState.data.isNotNull()) {
        emit(
          state.copyWith(
            picMyCoordinateState: ViewData.loaded(
              data: await geo.placemarkFromCoordinates(
                state.locationState.data!.latitude!,
                state.locationState.data!.longitude!,
              ),
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            picMyCoordinateState: ViewData.error(
              message: "Gagal parsing titik koordinat langsung",
            ),
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          picMyCoordinateState: ViewData.error(
            message: "Gagal parsing titik koordinat",
          ),
        ),
      );
    }
  }

  void getCoordinateByMark(
    LatLng latLng,
    GoogleMapController mapController,
  ) {
    final Set<Marker> markers = {};
    final Marker marker = Marker(
        markerId: const MarkerId(
          "source",
        ),
        position: latLng,
        onTap: () {
          mapController.animateCamera(
            CameraUpdate.newLatLngZoom(latLng, 18),
          );
        });
    if (markers.isNotNull()) {
      markers.clear();
      markers.add(marker);
    } else {
      markers.add(marker);
    }
    emit(
      state.copyWith(
        setMarkerState: ViewData.loaded(
          data: markers,
        ),
      ),
    );
    getLatLng(latLng);
    getAddressByCoordinate(
      latLng: latLng,
    );
  }

  getLatLng(LatLng latLng) {
    emit(
      state.copyWith(
        latLngState: ViewData.loaded(
          data: latLng,
        ),
      ),
    );
  }
}

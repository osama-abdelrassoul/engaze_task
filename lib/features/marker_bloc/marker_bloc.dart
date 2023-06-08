import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/models/marker.dart';

part 'marker_event.dart';
part 'marker_state.dart';

class MarkerBloc extends Bloc<MarkerEvent, MarkerState> {
  MarkerBloc() : super(const MarkerState()) {
    on<GetMarkerDataEvent>(_handleGetMarkerDataEvent);
  }
  Future<void> _handleGetMarkerDataEvent(
    GetMarkerDataEvent event,
    Emitter<MarkerState> emit,
  ) async {
    try {
      Dio dio = Dio();

      Response response = await dio.post(
          "https://engaztechnology.net/Himam/User/getMarkers.php",
          options: Options(
            followRedirects: false,
            headers: {
              'usertoken': event.userToken,
            },
          ));

      if (response.statusCode == 200) {
        List<MarkerModel> markerList = List.from(
          (json.decode(response.data)["data"])
              .map((element) => MarkerModel.fromMap(element)),
        );
        emit(state.copyWith(
            message: 'logged in successfully',
            status: MarkerStatus.success,
            markerList: markerList));
      }
    } catch (e) {
      emit(state.copyWith(message: e.toString(), status: MarkerStatus.failure));
    }
  }
}

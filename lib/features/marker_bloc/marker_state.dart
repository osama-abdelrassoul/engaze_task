part of 'marker_bloc.dart';

enum MarkerStatus {
  success,
  failure,
  loading,
}

class MarkerState extends Equatable {
  const MarkerState(
      {this.message = 'Facebook',
      this.status = MarkerStatus.loading,
      this.markerList = const <MarkerModel>[]});

  final String message;
  final List<MarkerModel> markerList;
  final MarkerStatus status;

  MarkerState copyWith({
    List<MarkerModel>? markerList,
    String? message,
    MarkerStatus? status,
  }) {
    return MarkerState(
        message: message ?? this.message,
        status: status ?? this.status,
        markerList: markerList ?? this.markerList);
  }

  @override
  List<Object?> get props => [message, status, markerList];
}

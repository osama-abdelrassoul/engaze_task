part of 'marker_bloc.dart';

abstract class MarkerEvent extends Equatable {
  const MarkerEvent();

  @override
  List<Object> get props => [];
}

class GetMarkerDataEvent extends MarkerEvent {
  final String userToken;

  const GetMarkerDataEvent({required this.userToken});
  @override
  List<Object> get props => [userToken];
}

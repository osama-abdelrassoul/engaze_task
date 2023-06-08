import 'package:equatable/equatable.dart';

class MarkerModel extends Equatable {
  final String id;
  final String lat;
  final String long;
  final String name;

  const MarkerModel({
    this.id = '',
    this.lat = '',
    this.long = '',
    this.name = '',
  });

  factory MarkerModel.fromMap(Map<String, dynamic> map) {
    return MarkerModel(
      id: map['TaskID'] ?? "",
      lat: map['Lat'] ?? "",
      long: map['Longt'] ?? "",
      name: map["Name"] ?? "",
    );
  }

  @override
  List<Object?> get props => [id, lat, name, long];
}

import '../utils/try_parse.dart';

class Coordinates {
  /// Latitude coordinate value.
  double? latitude;

  /// Longitude coordinate value.
  double? longitude;

  Coordinates({this.latitude, this.longitude});

  factory Coordinates.fromJson(Map<String, dynamic> coordinates) => Coordinates(
      latitude: double.tryParse(tryParse(coordinates['latt']) ?? ''),
      longitude: double.tryParse(tryParse(coordinates['longt']) ?? ''));

  @override
  String toString() => "GEOCODE: longitude=$longitude, latitude=$latitude";
}

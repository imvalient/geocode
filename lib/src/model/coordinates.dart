class Coordinates {
  /// Latitude coordinate value.
  double latitude;

  /// Longitude coordinate value.
  double longitude;

  Coordinates({this.latitude, this.longitude});

  factory Coordinates.fromJson(Map<String, dynamic> coordinates) => Coordinates(
      latitude: double.parse(coordinates['latt']),
      longitude: double.parse(coordinates['longt']));

  @override
  String toString() => "GEOCODE: longitude=$longitude, latitude=$latitude";
}

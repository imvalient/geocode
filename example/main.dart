import 'package:geocode/geocode.dart';

void main() async {
  GeoCode geoCode = GeoCode();

  try {
    Coordinates coordinates = await geoCode.forwardGeocoding(
        address: "532 S Olive St, Los Angeles, CA 90013");

    print("Latitude: ${coordinates.latitude}");
    print("Longitude: ${coordinates.longitude}");
  } catch (e) {
    print(e);
  }
}

import 'model/address.dart';
import 'model/coordinates.dart';
import 'service/geocode_client.dart';

class GeoCode {
  final String apiKey;
  final GeocodeClient _client = GeocodeclientImpl();

  GeoCode({this.apiKey = ''});

  /// Resolves to an [Address] given a pair [latitude] and [longitude].
  ///
  /// Throws a [GeocodeException].
  Future<Address> reverseGeocoding({double latitude, double longitude}) {
    return _client
        .reverseGeocoding(latitude, longitude, apiKey)
        .then((address) => address)
        .catchError((error) => throw error);
  }

  /// Returns [Coordinates] from a given [address].
  ///
  /// Throws a [GeocodeException].
  Future<Coordinates> forwardGeocoding({String address}) {
    return _client
        .forwardGeocoding(address, apiKey)
        .then((coordinates) => coordinates)
        .catchError((error) => throw error);
  }
}

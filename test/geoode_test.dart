import 'dart:io';

import 'package:test/test.dart';

import '../lib/geocode.dart';

void main() {
  GeoCode geoCode = GeoCode(apiKey: Platform.environment["apiKey"]);

  group('test geocode', () {
    test('it should return a valid city when requested valid lat & lng',
        () async {
      try {
        Address address = await geoCode.reverseGeocoding(
            latitude: 40.20999, longitude: -6.79485);

        expect(address.city, isNotNull);
      } catch (e) {
        expect(e, isNull);
      }
    });

    test(
        'it should return an auth token exception if an invalid token is supplied',
        () async {
      GeoCode invalidGeoCode = GeoCode(apiKey: "-1");
      try {
        await invalidGeoCode.reverseGeocoding(
            latitude: 40.20999, longitude: -6.79485);
      } catch (e) {
        expect(e.code,
            anyOf(equals(ResponseError.e003), equals(ResponseError.e006)));
      }
    });

    test(
        'it should return an invalid query exception if wrong coordinates are supplied',
        () async {
      try {
        await geoCode.reverseGeocoding(latitude: 1, longitude: 1);
      } catch (e) {
        expect(e.code, equals(ResponseError.e008));
      }
    });

    test(
        'it should return valid coordinates when requested an existing location',
        () async {
      try {
        Coordinates coordinates = await geoCode.forwardGeocoding(
            address: "chinese theatre, los angeles");

        expect(coordinates.latitude, isNotNull);
        expect(coordinates.longitude, isNotNull);
      } catch (e) {
        expect(e, isNull);
      }
    });

    test(
        'it should parse properly nullable values when requested a query returning an empty postal code',
        () async {
      try {
        Address address = await geoCode.reverseGeocoding(
            latitude: 40.20329, longitude: -6.79485);

        expect(address.postal, isNull);
      } catch (e) {
        expect(e, isNull);
      }
    });
  });
}

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/address.dart';
import '../model/coordinates.dart';
import '../model/response_error.dart';
import '../exception/geocode_exception.dart';

abstract class GeocodeClient {
  /// Returns an [Address] given a [latitude], [longitude]
  /// and an [apiKey].
  Future<Address> reverseGeocoding(
      double latitude, double longitude, String apiKey);

  /// Returns [Coordinates] given an [address] and an [apiKey].
  Future<Coordinates> forwardGeocoding(String address, String apiKey);
}

class GeocodeclientImpl implements GeocodeClient {
  /// API endpoint url.
  final String url = 'geocode.xyz';

  @override
  Future<Address> reverseGeocoding(
      double latitude, double longitude, String apiKey) {
    String urlParams =
        "/$latitude,$longitude" + (apiKey != '' ? '&auth=' + apiKey : '');

    final Uri uri = Uri.https(url, urlParams, {"geoit": "json"});

    return http.get(uri).then((response) {
      ResponseError err = ResponseError.fromJson(json.decode(response.body));

      if (err.code != null) {
        throw _handleErrorException(err);
      }

      return Address.fromJson(json.decode(response.body));
    }).catchError((error) => throw error);
  }

  @override
  Future<Coordinates> forwardGeocoding(String address, String apiKey) {
    String urlParams = "/${address.replaceAll(' ', '+')}" +
        (apiKey != '' ? '&auth=' + apiKey : '');

    final Uri uri = Uri.https(url, urlParams, {"geoit": "json"});

    return http.get(uri).then((response) {
      ResponseError err = ResponseError.fromJson(json.decode(response.body));

      if (err.code != null) {
        throw _handleErrorException(err);
      }

      return Coordinates.fromJson(json.decode(response.body));
    }).catchError((error) => throw error);
  }

  /// Given a [ResponseError] it finds out what kind of [GeocodeException] return.
  GeocodeException _handleErrorException(ResponseError responseError) {
    switch (responseError.code) {
      case ResponseError.e002:
        return AccountOutOfCreditsException(
            responseError.message, responseError.code);
      case ResponseError.e003:
        return AuthTokenNotFoundException(
            responseError.message, responseError.code);
      case ResponseError.e005:
        return PostalCodeFormatException(
            responseError.message, responseError.code);
      case ResponseError.e006:
        return RequestThrottledException(
            responseError.message, responseError.code);
      case ResponseError.e007:
        return InvalidQueryException(responseError.message, responseError.code);
      case ResponseError.e008:
        return EmptyResultException(responseError.message, responseError.code);
      default:
        return UnknownErrorException("Unknown error. Try again.", "-1");
    }
  }
}

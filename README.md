# Geocode library

![workflow name](https://github.com/imvalient/geocode/workflows/Dart%20CI/badge.svg)

## Introduction

Package to make Geocode requests. It exposes two methods to translate coordinates into locations and addresses into coordinates.

It's a basic implementation of the most useful methods in the Dart language of the following API [geocode.xyz](https://geocode.xyz/api).

It's free for one request per second quota. Register in the above site to get an API Key and increase the number of requests to 10 per second. These are paid plans that allow more requests per second. For more information, review the site.

## Installation

```yaml
dependecies:
  geocode: ^0.1.0
```

## Example

See `example/main.dart`

```dart
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
```

## Methods

### Constructor

Library `GeoCode` class constructor, includes an optional parameter to set the `apiKey`.

```dart
GeoCode({this.apiKey});
```

### Reverse Geocode

Method to translate a pair of `latitude` and `longitude` coordinates into a real address.

```dart
Future<Address> reverseGeocoding({double latitude, double longitude})
```

### Forward Geocode

Method to translate an address into a pair of `latitude` and `longitude`coordinates.

```dart
Future<Coordinates> forwardGeocoding({String address})
```

## Responses

### Reverse Geocode

| Attribute     | Type   | Description |
|---------------|--------|-------------|
| elevation     | double | The elevation in meters. |
| timezone      | String | The timezone. |
| geoNumber     | int    | geocode is an alphanumeric string representing both latitude and longitude as one value. Nearby points will have similar geocodes. |
| streetNumber  | int    | The properly formated street address number to be returned. |
| streetAddress | String | The properly formated street address to be returned. |
| city          | String | The properly formated city name to be returned. |
| countyCode    | String | The properly formated country code to be returned. |
| countryName   | String | The properly formated country name to be returned. |
| region        | String | The properly formated region to be returned. |
| postal        | String | The properly formated postal code to be returned. |
| distance      | double | The distance of the result location from the input location. |

### Forward Geocode

| Attribute | Type   | Description                 |
|-----------|--------|-----------------------------|
| latitude  | double | Latitude coordinate value.  |
| longitude | double | Longitude coordinate value. |

## Exceptions

- `AccountOutOfCreditsException`: auth has ran out of credits.
- `AuthTokenNotFoundException`: authentication token: auth not found.
- `PostalCodeFormatException`: postal Code is not in the proper Format.
- `RequestThrottledException`: request Throttled.
- `InvalidQueryException`: supply a valid query.
- `EmptyResultException`: your request did not produce any results. Check your spelling and try again.
- `UnknownErrorException`: unkown error.

## Dependencies

```yaml
http: ^0.12.2
```

## License
[BSD 3-Clause License](LICENSE)
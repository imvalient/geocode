class Address {
  /// The elevation in meters.
  double elevation;

  /// The timezone.
  String timezone;

  /// geocode is an alphanumeric string representing both latitude and longitude
  /// as one value. Nearby points will have similar geocodes.
  int geoNumber;

  /// The properly formated street address number to be returned.
  int streetNumber;

  /// The properly formated street address to be returned.
  String streetAddress;

  /// The properly formated city name to be returned.
  String city;

  /// The properly formated country code to be returned.
  String countryCode;

  /// The properly formated country name to be returned.
  String countryName;

  /// The properly formated region to be returned.
  String region;

  /// The properly formated postal code to be returned.
  String postal;

  /// The distance of the result location from the input location.
  double distance;

  Address(
      {this.elevation,
      this.timezone,
      this.geoNumber,
      this.streetNumber,
      this.streetAddress,
      this.city,
      this.countryCode,
      this.countryName,
      this.region,
      this.postal,
      this.distance});

  factory Address.fromJson(Map<String, dynamic> address) => Address(
      elevation: double.parse(address['elevation']),
      timezone: address['timezone'],
      geoNumber: int.parse(address['geonumber']),
      streetNumber: int.parse(address['stnumber']),
      streetAddress: address['staddress'],
      city: address['city'],
      countryCode: address['prov'],
      countryName: address['country'],
      region: address['region'],
      postal: address['postal'],
      distance: double.parse(address['distance']));

  @override
  String toString() =>
      "GEOCODE: elevation=$elevation, timezone=$timezone, geoNumber=$geoNumber," +
      "streetNumber=$streetNumber, streetAddress=$streetAddress, city=$city, " +
      "countryCode=$countryCode, countryName=$countryName, region=$region, " +
      "postal=$postal, distance=$distance";
}

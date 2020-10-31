/// Package to make Geocode requests. It exposes two methods to translate coordinates into locations and addresses into coordinates.
///
/// It's a basic implementation of the most useful methods in the Dart language of the following API geocode.xyz.
///
/// It's free for one request per second quota. Register in the above site to get an API Key and increase the number of requests to 10 per second. These are paid plans that allow more requests per second. For more information, review the site.
library geocode;

export 'src/geocode.dart';
export 'src/model/address.dart';
export 'src/model/coordinates.dart';
export 'src/model/response_error.dart';
export 'src/exception/geocode_exception.dart';

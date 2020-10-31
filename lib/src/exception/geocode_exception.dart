/// Exception class parent of all geocode exceptions.
class GeocodeException implements Exception {
  final String message;
  final String code;

  const GeocodeException(this.message, this.code);

  String toString() => "[Error]: ($code) $message";
}

/// Exception thrown when auth has ran out of credits
class AccountOutOfCreditsException extends GeocodeException {
  const AccountOutOfCreditsException(String message, String code)
      : super(message, code);
}

/// Exception thrown when authentication token: auth not found.
class AuthTokenNotFoundException extends GeocodeException {
  const AuthTokenNotFoundException(String message, String code)
      : super(message, code);
}

/// Exception thrown when an invalid postal code is sent.
class PostalCodeFormatException extends GeocodeException {
  const PostalCodeFormatException(String message, String code)
      : super(message, code);
}

/// Exception thrown when requests got throttled.
class RequestThrottledException extends GeocodeException {
  const RequestThrottledException(String message, String code)
      : super(message, code);
}

/// Exception thrown when supplied an invalid query.
class InvalidQueryException extends GeocodeException {
  const InvalidQueryException(String message, String code)
      : super(message, code);
}

/// Exception thrown when your request did not produce any results. Check your spelling and try again.
class EmptyResultException extends GeocodeException {
  const EmptyResultException(String message, String code)
      : super(message, code);
}

/// Exception thrown when an unknown error happens.
class UnknownErrorException extends GeocodeException {
  const UnknownErrorException(String message, String code)
      : super(message, code);
}

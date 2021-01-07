class ResponseError {
  final String? code;
  final String? message;

  static const e002 = "002";
  static const e003 = "003";
  static const e005 = "005";
  static const e006 = "006";
  static const e007 = "007";
  static const e008 = "008";

  const ResponseError({this.code, this.message});

  factory ResponseError.fromJson(Map<String, dynamic> error) => ResponseError(
      code: error.containsKey('error') ? error['error']['code'] : null,
      message: error.containsKey('error')
          // e006 error coode's key it's "message" instead of "description".
          ? ([e006].contains(error['error']['code']))
              ? error['error']['message']
              : error['error']['description']
          : null);

  @override
  String toString() => "[Error]: ($code) ${message}";
}

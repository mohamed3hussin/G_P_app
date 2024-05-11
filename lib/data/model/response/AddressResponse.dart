/// firstName : "Mahmood"
/// lName : "Mido"
/// street : "NasrCity"
/// city : "Cairo"
/// country : "Egypt"
/// postalCode : "05001-0000"

class AddressResponse {
  AddressResponse({
      this.firstName, 
      this.lName, 
      this.street, 
      this.city, 
      this.country, 
      this.postalCode,});

  AddressResponse.fromJson(dynamic json) {
    firstName = json['firstName'];
    lName = json['lName'];
    street = json['street'];
    city = json['city'];
    country = json['country'];
    postalCode = json['postalCode'];
  }
  String? firstName;
  String? lName;
  String? street;
  String? city;
  String? country;
  String? postalCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lName'] = lName;
    map['street'] = street;
    map['city'] = city;
    map['country'] = country;
    map['postalCode'] = postalCode;
    return map;
  }

}
class ErrorResponse {
  final List<String> errors;
  final int statusCode;
  final String message;

  ErrorResponse({
    required this.errors,
    required this.statusCode,
    required this.message,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    List<String> errorList = json['errors'] != null ? List<String>.from(json['errors']) : [];
    return ErrorResponse(
      errors: errorList,
      statusCode: json['satusCode'],
      message: json['message'],
    );
  }
}
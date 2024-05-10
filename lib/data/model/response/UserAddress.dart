/// firstName : "Mahmood"
/// lName : "Mido"
/// street : "NasrCityUpdated"
/// city : "Giza"
/// country : "Egypt"
/// postalCode : "05001-000"

class UserAddressResponse {
  UserAddressResponse({
      this.firstName, 
      this.lName, 
      this.street, 
      this.city, 
      this.country, 
      this.postalCode,});

  UserAddressResponse.fromJson(dynamic json) {
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
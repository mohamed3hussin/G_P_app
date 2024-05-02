/// id : 3
/// name : "calvin-klein"
/// dateofCreation : "2023-03-10T08:00:00+00:00"
/// pictureUrl : "https://e3e5-102-44-145-198.ngrok-free.app/images/Logo/calvin-klein.png"
/// quantity : 70
/// cost : 79.99

class LogoResponse {
  LogoResponse({
      this.id, 
      this.name, 
      this.dateofCreation, 
      this.pictureUrl, 
      this.quantity, 
      this.cost,});

  LogoResponse.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    dateofCreation = json['dateofCreation'];
    pictureUrl = json['pictureUrl'];
    quantity = json['quantity'];
    cost = json['cost'];
  }
  int? id;
  String? name;
  String? dateofCreation;
  String? pictureUrl;
  int? quantity;
  double? cost;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['dateofCreation'] = dateofCreation;
    map['pictureUrl'] = pictureUrl;
    map['quantity'] = quantity;
    map['cost'] = cost;
    return map;
  }

}
/// shortName : "UPS1"
/// description : "Fastest delivery time"
/// deliveryTime : "1-2 Days"
/// cost : 10.00
/// id : 1

class DeliveryMethodsResponse {
  DeliveryMethodsResponse({
      this.shortName, 
      this.description, 
      this.deliveryTime, 
      this.cost, 
      this.id,});

  DeliveryMethodsResponse.fromJson(dynamic json) {
    shortName = json['shortName'];
    description = json['description'];
    deliveryTime = json['deliveryTime'];
    cost = json['cost'];
    id = json['id'];
  }
  String? shortName;
  String? description;
  String? deliveryTime;
  double? cost;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['shortName'] = shortName;
    map['description'] = description;
    map['deliveryTime'] = deliveryTime;
    map['cost'] = cost;
    map['id'] = id;
    return map;
  }

}
import 'dart:convert';

class Logo {
  int id;
  String name;
  String dateofCreation;
  String pictureUrl;
  int quantity;
  double cost;

  Logo({
    required this.id,
    required this.name,
    required this.dateofCreation,
    required this.pictureUrl,
    required this.quantity,
    required this.cost,
  });

  factory Logo.fromJson(Map<String, dynamic> json) {
    return Logo(
      id: json['id'],
      name: json['name'],
      dateofCreation: json['dateofCreation'],
      pictureUrl: json['pictureUrl'],
      quantity: json['quantity'],
      cost: json['cost'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['dateofCreation'] = dateofCreation;
    data['pictureUrl'] = pictureUrl;
    data['quantity'] = quantity;
    data['cost'] = cost;
    return data;
  }
}

List<Logo> logosFromJson(String str) {
  final List<dynamic> jsonData = json.decode(str);
  return List<Logo>.from(jsonData.map((x) => Logo.fromJson(x)));
}

String logosToJson(List<Logo> data) {
  final List<dynamic> jsonData = List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(jsonData);
}

class WishListModel {
  String? id;
  List<Items>? items;

  WishListModel({this.id, this.items});

  WishListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  String? productName;
  String? pictureUrl;
  String? size;
  String? type;
  int? quantity;
  double? price;
  bool? isFavourite;

  Items(
      {this.id,
        this.productName,
        this.pictureUrl,
        this.size,
        this.type,
        this.quantity,
        this.price,
        this.isFavourite});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    pictureUrl = json['pictureUrl'];
    size = json['size'];
    type = json['type'];
    quantity = json['quantity'];
    price = json['price'];
    isFavourite = json['isFavourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productName'] = this.productName;
    data['pictureUrl'] = this.pictureUrl;
    data['size'] = this.size;
    data['type'] = this.type;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['isFavourite'] = this.isFavourite;
    return data;
  }
}
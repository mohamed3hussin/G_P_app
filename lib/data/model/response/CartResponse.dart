/// id : "basket1"
/// items : [{"id":8,"productName":"Sport","pictureUrl":"https://localhost:7084/images/products/Sportman.jpg","size":"M","color":"Red","price":39.99,"quantity":2}]
/// paymentIntentId : null
/// clilentSecret : null
/// deliveryMethodId : null
/// shippingCost : 0

class CartResponse {
  CartResponse({
      this.id, 
      this.items, 
      this.paymentIntentId, 
      this.clilentSecret, 
      this.deliveryMethodId, 
      this.shippingCost,});

  CartResponse.fromJson(dynamic json) {
    id = json['id'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(CartItems.fromJson(v));
      });
    }
    paymentIntentId = json['paymentIntentId'];
    clilentSecret = json['clilentSecret'];
    deliveryMethodId = json['deliveryMethodId'];
    shippingCost = json['shippingCost'];
  }
  String? id;
  List<CartItems>? items;
  dynamic paymentIntentId;
  dynamic clilentSecret;
  dynamic deliveryMethodId;
  int? shippingCost;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    map['paymentIntentId'] = paymentIntentId;
    map['clilentSecret'] = clilentSecret;
    map['deliveryMethodId'] = deliveryMethodId;
    map['shippingCost'] = shippingCost;
    return map;
  }

}

/// id : 8
/// productName : "Sport"
/// pictureUrl : "https://localhost:7084/images/products/Sportman.jpg"
/// size : "M"
/// color : "Red"
/// price : 39.99
/// quantity : 2

class CartItems {
  CartItems({
      this.id, 
      this.productName, 
      this.pictureUrl, 
      this.size, 
      this.color, 
      this.price, 
      this.quantity,});

  CartItems.fromJson(dynamic json) {
    id = json['id'];
    productName = json['productName'];
    pictureUrl = json['pictureUrl'];
    size = json['size'];
    color = json['color'];
    price = json['price'];
    quantity = json['quantity'];
  }
  int? id;
  String? productName;
  String? pictureUrl;
  String? size;
  String? color;
  double? price;
  int? quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['productName'] = productName;
    map['pictureUrl'] = pictureUrl;
    map['size'] = size;
    map['color'] = color;
    map['price'] = price;
    map['quantity'] = quantity;
    return map;
  }

}
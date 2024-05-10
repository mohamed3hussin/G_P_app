/// id : 1016
/// buyerEmail : "mahmoodmido1@gmail.com"
/// orderDate : "2024-05-10T11:05:01.374142+00:00"
/// status : "Pending"
/// shippingAddress : {"firstName":"Mahmood","lName":"Mido","street":"NasrCity","city":"Cairo","country":"Egypt","postalCode":"05001-000"}
/// deliveryMethod : "UPS1"
/// deliveryMethodCost : 10.00
/// items : [{"id":1009,"pictureUrl":[{"pictureId":14,"pictureUrl":"https://cf90-196-132-102-190.ngrok-free.app/images/products/Blousejfif.jfif"}],"quantity":1,"price":29.99,"productId":2,"productName":"Blouse","productSize":"S","productColor":"Red"},{"id":1010,"pictureUrl":[{"pictureId":20,"pictureUrl":"https://cf90-196-132-102-190.ngrok-free.app/images/products/Sportman.jpg"}],"quantity":3,"price":39.99,"productId":8,"productName":"Sport","productSize":"M","productColor":"Black"},{"id":1011,"pictureUrl":[{"pictureId":12,"pictureUrl":"https://cf90-196-132-102-190.ngrok-free.app/images/products/Dress.jpg"},{"pictureId":13,"pictureUrl":"https://cf90-196-132-102-190.ngrok-free.app/images/products/Dress01.jfif"}],"quantity":2,"price":49.99,"productId":1,"productName":"Dress","productSize":"XS","productColor":"Red"},{"id":1012,"pictureUrl":[{"pictureId":15,"pictureUrl":"https://cf90-196-132-102-190.ngrok-free.app/images/products/Jeans.jpg"}],"quantity":1,"price":39.99,"productId":3,"productName":"Jeans","productSize":"XS","productColor":"Blue"},{"id":1013,"pictureUrl":[{"pictureId":18,"pictureUrl":"https://cf90-196-132-102-190.ngrok-free.app/images/products/sleveejfif.jfif"}],"quantity":1,"price":39.99,"productId":6,"productName":"Slevee","productSize":"M","productColor":"White"}]
/// subtotal : 329.92
/// total : 339.92
/// paymentIntentId : "pi_3PErFdH95KbNOXeN0eP73uDx"

class AllOrdersResponse {
  AllOrdersResponse({
      this.id, 
      this.buyerEmail, 
      this.orderDate, 
      this.status, 
      this.shippingAddress, 
      this.deliveryMethod, 
      this.deliveryMethodCost, 
      this.items, 
      this.subtotal, 
      this.total, 
      this.paymentIntentId,});

  AllOrdersResponse.fromJson(dynamic json) {
    id = json['id'];
    buyerEmail = json['buyerEmail'];
    orderDate = json['orderDate'];
    status = json['status'];
    shippingAddress = json['shippingAddress'] != null ? ShippingAddress.fromJson(json['shippingAddress']) : null;
    deliveryMethod = json['deliveryMethod'];
    deliveryMethodCost = json['deliveryMethodCost'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
    subtotal = json['subtotal'];
    total = json['total'];
    paymentIntentId = json['paymentIntentId'];
  }
  int? id;
  String? buyerEmail;
  String? orderDate;
  String? status;
  ShippingAddress? shippingAddress;
  String? deliveryMethod;
  double? deliveryMethodCost;
  List<Items>? items;
  double? subtotal;
  double? total;
  String? paymentIntentId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['buyerEmail'] = buyerEmail;
    map['orderDate'] = orderDate;
    map['status'] = status;
    if (shippingAddress != null) {
      map['shippingAddress'] = shippingAddress?.toJson();
    }
    map['deliveryMethod'] = deliveryMethod;
    map['deliveryMethodCost'] = deliveryMethodCost;
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    map['subtotal'] = subtotal;
    map['total'] = total;
    map['paymentIntentId'] = paymentIntentId;
    return map;
  }

}

/// id : 1009
/// pictureUrl : [{"pictureId":14,"pictureUrl":"https://cf90-196-132-102-190.ngrok-free.app/images/products/Blousejfif.jfif"}]
/// quantity : 1
/// price : 29.99
/// productId : 2
/// productName : "Blouse"
/// productSize : "S"
/// productColor : "Red"

class Items {
  Items({
      this.id, 
      this.pictureUrl, 
      this.quantity, 
      this.price, 
      this.productId, 
      this.productName, 
      this.productSize, 
      this.productColor,});

  Items.fromJson(dynamic json) {
    id = json['id'];
    if (json['pictureUrl'] != null) {
      pictureUrl = [];
      json['pictureUrl'].forEach((v) {
        pictureUrl?.add(PictureUrl.fromJson(v));
      });
    }
    quantity = json['quantity'];
    price = json['price'];
    productId = json['productId'];
    productName = json['productName'];
    productSize = json['productSize'];
    productColor = json['productColor'];
  }
  int? id;
  List<PictureUrl>? pictureUrl;
  int? quantity;
  double? price;
  int? productId;
  String? productName;
  String? productSize;
  String? productColor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (pictureUrl != null) {
      map['pictureUrl'] = pictureUrl?.map((v) => v.toJson()).toList();
    }
    map['quantity'] = quantity;
    map['price'] = price;
    map['productId'] = productId;
    map['productName'] = productName;
    map['productSize'] = productSize;
    map['productColor'] = productColor;
    return map;
  }

}

/// pictureId : 14
/// pictureUrl : "https://cf90-196-132-102-190.ngrok-free.app/images/products/Blousejfif.jfif"

class PictureUrl {
  PictureUrl({
      this.pictureId, 
      this.pictureUrl,});

  PictureUrl.fromJson(dynamic json) {
    pictureId = json['pictureId'];
    pictureUrl = json['pictureUrl'];
  }
  int? pictureId;
  String? pictureUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pictureId'] = pictureId;
    map['pictureUrl'] = pictureUrl;
    return map;
  }

}

/// firstName : "Mahmood"
/// lName : "Mido"
/// street : "NasrCity"
/// city : "Cairo"
/// country : "Egypt"
/// postalCode : "05001-000"

class ShippingAddress {
  ShippingAddress({
      this.firstName, 
      this.lName, 
      this.street, 
      this.city, 
      this.country, 
      this.postalCode,});

  ShippingAddress.fromJson(dynamic json) {
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
/// id : 1
/// name : "Dress"
/// description : "Description of Product 1"
/// price : 49.99
/// typeId : 1
/// type : "Dress"
/// genderType : "Female"
/// productStatus : "In Stock"
/// productPictures : ["https://744d-102-41-111-145.ngrok-free.app/images/products/Dress.jpg","https://744d-102-41-111-145.ngrok-free.app/images/products/Dress01.jfif"]
/// productSize : [{"sizename":"XS","sizeId":1},{"sizename":"S","sizeId":2},{"sizename":"M","sizeId":3}]
/// productColor : [{"colorname":"Red","colorId":2},{"colorname":"Black","colorId":3}]
/// reviews : [{"id":1,"userId":1,"userEmail":"john@example.com","rate":4,"comments":["Great product!"]},{"id":4,"userId":4,"userEmail":"bob@example.com","rate":5,"comments":["Awesome!"]},{"id":7,"userId":2,"userEmail":"jane@example.com","rate":4,"comments":["Good review."]},{"id":10,"userId":5,"userEmail":"emily@example.com","rate":4,"comments":["Very helpful."]},{"id":1002,"userId":1002,"userEmail":"Mahmoodmido@gmail.com","rate":4,"comments":["This product is great!"]},{"id":1003,"userId":1003,"userEmail":"Mahmoodmido@gmail.com","rate":4,"comments":["This product is great!"]},{"id":1004,"userId":1002,"userEmail":"Mahmoodmido@gmail.com","rate":4,"comments":["This product is great!"]},{"id":1005,"userId":1002,"userEmail":"Mahmoodmido@gmail.com","rate":4,"comments":["This product is great!"]},{"id":1006,"userId":1002,"userEmail":"Mahmoodmido@gmail.com","rate":4,"comments":["This product is great!"]}]
/// averageRate : 4.1111111111111111111111111111

class BestSellingProductResponse {
  int? id;
  String? name;
  String? description;
  double? price;
  int? typeId;
  String? type;
  String? genderType;
  String? productStatus;
  List<String>? productPictures;
  List<ProductSize>? productSize;
  List<ProductColor>? productColor;
  List<Reviews>? reviews;
  double? averageRate;

  BestSellingProductResponse(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.typeId,
        this.type,
        this.genderType,
        this.productStatus,
        this.productPictures,
        this.productSize,
        this.productColor,
        this.reviews,
        this.averageRate});

  BestSellingProductResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = (json['price'] as num?)?.toDouble();
    averageRate = (json['averageRate'] as num?)?.toDouble();    typeId = json['typeId'];
    type = json['type'];
    genderType = json['genderType'];
    productStatus = json['productStatus'];
    productPictures = json['productPictures'].cast<String>();
    if (json['productSize'] != null) {
      productSize = <ProductSize>[];
      json['productSize'].forEach((v) {
        productSize!.add(ProductSize.fromJson(v));
      });
    }
    if (json['productColor'] != null) {
      productColor = <ProductColor>[];
      json['productColor'].forEach((v) {
        productColor!.add(new ProductColor.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    //averageRate = json['averageRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['typeId'] = typeId;
    data['type'] = type;
    data['genderType'] = genderType;
    data['productStatus'] = productStatus;
    data['productPictures'] = productPictures;
    if (productSize != null) {
      data['productSize'] = productSize!.map((v) => v.toJson()).toList();
    }
    if (productColor != null) {
      data['productColor'] = productColor!.map((v) => v.toJson()).toList();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    data['averageRate'] = averageRate;
    return data;
  }
}

/// id : 1
/// userId : 1
/// userEmail : "john@example.com"
/// rate : 4
/// comments : ["Great product!"]

class Reviews {
  Reviews({
      this.id, 
      this.userId, 
      this.userEmail, 
      this.rate, 
      this.comments,});

  Reviews.fromJson(dynamic json) {
    id = json['id'];
    userId = json['userId'];
    userEmail = json['userEmail'];
    rate = json['rate'];
    comments = json['comments'] != null ? json['comments'].cast<String>() : [];
  }
  int? id;
  int? userId;
  String? userEmail;
  int? rate;
  List<String>? comments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    map['userEmail'] = userEmail;
    map['rate'] = rate;
    map['comments'] = comments;
    return map;
  }

}

/// colorname : "Red"
/// colorId : 2

class ProductColor {
  ProductColor({
      this.colorname, 
      this.colorId,});

  ProductColor.fromJson(dynamic json) {
    colorname = json['colorname'];
    colorId = json['colorId'];
  }
  String? colorname;
  int? colorId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['colorname'] = colorname;
    map['colorId'] = colorId;
    return map;
  }

}

/// sizename : "XS"
/// sizeId : 1

class ProductSize {
  ProductSize({
      this.sizename, 
      this.sizeId,});

  ProductSize.fromJson(dynamic json) {
    sizename = json['sizename'];
    sizeId = json['sizeId'];
  }
  String? sizename;
  int? sizeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sizename'] = sizename;
    map['sizeId'] = sizeId;
    return map;
  }

}
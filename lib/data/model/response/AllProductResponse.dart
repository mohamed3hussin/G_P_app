class AllProducts {
  int? pageIndex;
  int? pageSize;
  int? count;
  List<Data>? data;

  AllProducts({this.pageIndex, this.pageSize, this.count, this.data});

  AllProducts.fromJson(Map<String, dynamic> json) {
    pageIndex = json['pageIndex'];
    pageSize = json['pageSize'];
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageIndex'] = pageIndex;
    data['pageSize'] = pageSize;
    data['count'] = count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
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

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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

class ProductSize {
  String? sizename;
  int? sizeId;

  ProductSize({this.sizename, this.sizeId});

  ProductSize.fromJson(Map<String, dynamic> json) {
    sizename = json['sizename'];
    sizeId = json['sizeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sizename'] = sizename;
    data['sizeId'] = sizeId;
    return data;
  }
}

class ProductColor {
  String? colorname;
  int? colorId;

  ProductColor({this.colorname, this.colorId});

  ProductColor.fromJson(Map<String, dynamic> json) {
    colorname = json['colorname'];
    colorId = json['colorId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['colorname'] = colorname;
    data['colorId'] = colorId;
    return data;
  }
}

class Reviews {
  int? id;
  int? userId;
  String? userEmail;
  int? rate;
  List<String>? comments;

  Reviews({this.id, this.userId, this.userEmail, this.rate, this.comments});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    userEmail = json['userEmail'];
    rate = json['rate'];
    comments = json['comments'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['userId'] = userId;
    data['userEmail'] = userEmail;
    data['rate'] = rate;
    data['comments'] = comments;
    return data;
  }
}

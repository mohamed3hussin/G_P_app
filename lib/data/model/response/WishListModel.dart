class WishListModel {
  final String id;
  final List<WishListItem> items;

  WishListModel({
    required this.id,
    required this.items,
  });

  factory WishListModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> itemList = json['items'];
    List<WishListItem> parsedItems =
    itemList.map((itemJson) => WishListItem.fromJson(itemJson)).toList();

    return WishListModel(
      id: json['id'],
      items: parsedItems,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> itemsJson =
    items.map((item) => item.toJson()).toList();

    return {
      'id': id,
      'items': itemsJson,
    };
  }
}

class WishListItem {
  final int id;
  final String productName;
  final String pictureUrl;
  final String size;
  final String type;
  final int quantity;
  final double price;
  final bool isFavourite;

  WishListItem({
    required this.id,
    required this.productName,
    required this.pictureUrl,
    required this.size,
    required this.type,
    required this.quantity,
    required this.price,
    required this.isFavourite,
  });

  factory WishListItem.fromJson(Map<String, dynamic> json) {
    return WishListItem(
      id: json['id'],
      productName: json['productName'],
      pictureUrl: json['pictureUrl'],
      size: json['size'],
      type: json['type'],
      quantity: json['quantity'],
      price: json['price'].toDouble(),
      isFavourite: json['isFavourite'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productName': productName,
      'pictureUrl': pictureUrl,
      'size': size,
      'type': type,
      'quantity': quantity,
      'price': price,
      'isFavourite': isFavourite,
    };
  }
}

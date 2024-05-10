/// Rate : 4
/// ProductId : 1
/// Comments : "This product is great!"

class CreateReviewResponse {
  CreateReviewResponse({
      this.rate, 
      this.productId, 
      this.comments,});

  CreateReviewResponse.fromJson(dynamic json) {
    rate = json['Rate'];
    productId = json['ProductId'];
    comments = json['Comments'];
  }
  int? rate;
  int? productId;
  String? comments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Rate'] = rate;
    map['ProductId'] = productId;
    map['Comments'] = comments;
    return map;
  }

}
class CartListModel {
  int? status;
  String? message;
  int? totalCount;
  int? totalPrice;
  List<Data>? data;

  CartListModel(
      {this.status, this.message, this.totalCount, this.totalPrice, this.data});

  CartListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    totalCount = json['total_count'];
    totalPrice = json['total_price'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['total_count'] = this.totalCount;
    data['total_price'] = this.totalPrice;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? cartId;
  String? productId;
  String? productName;
  String? productImage;
  String? quantity;
  String? unitPrice;
  String? variationTypeId;
  String? variationType;
  String? variationValueId;
  String? variationValueName;
  String? totalPrice;

  Data(
      {this.cartId,
      this.productId,
      this.productName,
      this.productImage,
      this.quantity,
      this.unitPrice,
      this.variationTypeId,
      this.variationType,
      this.variationValueId,
      this.variationValueName,
      this.totalPrice});

  Data.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productImage = json['product_image'];
    quantity = json['quantity'];
    unitPrice = json['unit_price'];
    variationTypeId = json['variation_type_id'];
    variationType = json['variation_type'];
    variationValueId = json['variation_value_id'];
    variationValueName = json['variation_value_name'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_id'] = this.cartId;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_image'] = this.productImage;
    data['quantity'] = this.quantity;
    data['unit_price'] = this.unitPrice;
    data['variation_type_id'] = this.variationTypeId;
    data['variation_type'] = this.variationType;
    data['variation_value_id'] = this.variationValueId;
    data['variation_value_name'] = this.variationValueName;
    data['total_price'] = this.totalPrice;
    return data;
  }
}

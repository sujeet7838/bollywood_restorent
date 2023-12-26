class LocationComboMenu {
  int status;
  String message;
  Data data;

  LocationComboMenu({
    required this.status,
    required this.message,
    required this.data,
  });
}

class Data {
  LunchCombo lunchCombo;
  DinnerCombo dinnerCombo;

  Data({
    required this.lunchCombo,
    required this.dinnerCombo,
  });
}

class DinnerCombo {
  String id;
  String name;
  String price;
  String details;

  DinnerCombo({
    required this.id,
    required this.name,
    required this.price,
    required this.details,
  });
}

class LunchCombo {
  String id;
  String name;
  String price;
  List<Detail> details;

  LunchCombo({
    required this.id,
    required this.name,
    required this.price,
    required this.details,
  });
}

class Detail {
  String productId;
  String productName;
  String productDescription;
  String productImage;
  List<ProductVariation> productVariation;

  Detail({
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productImage,
    required this.productVariation,
  });
}

class ProductVariation {
  String variationType;
  String variationValueId;
  String variationValueName;

  ProductVariation({
    required this.variationType,
    required this.variationValueId,
    required this.variationValueName,
  });
}

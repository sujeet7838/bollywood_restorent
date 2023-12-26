class CategoryWiseMenu {
  int status;
  String message;
  Data data;

  CategoryWiseMenu({
    required this.status,
    required this.message,
    required this.data,
  });
}

class Data {
  List<MainCourse> mainCourse;
  List<MainCourse> starter;

  Data({
    required this.mainCourse,
    required this.starter,
  });
}

class MainCourse {
  String productId;
  String productName;
  String categoryId;
  String categoryName;
  String productDescription;
  String productImage;
  String productPrice;
  List<ProductVariation> productVariation;

  MainCourse({
    required this.productId,
    required this.productName,
    required this.categoryId,
    required this.categoryName,
    required this.productDescription,
    required this.productImage,
    required this.productPrice,
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

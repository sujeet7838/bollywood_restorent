class ApiProvider {
  static const String APP_NAME = "Bollybood";
  static const String Image_URL =
      "https://click4technologies.com/design/t20/bollywood-restarant/";
  static const String BASE_URL =
      "https://click4technologies.com/design/t20/bollywood-restarant";

  static const String SIGN_IN = "$BASE_URL/api/login";
  static const String SIGN_UP = "$BASE_URL/api/registration";
  static const String DuplicateEmail = "$BASE_URL/api/duplicate_email";
  static const String DuplicatePhone = "$BASE_URL/api/duplicate_phone";
  static const String Verify_Email =
      "$BASE_URL/api/send_mail_verification_code";
  static const String VALIDATE_OTP = "$BASE_URL/api/checking_verification_code";
  static const String StoreLocation = "$BASE_URL/api/store_location";
  static const String CategoryList = "$BASE_URL/api/category";
  static const String MenuList = "$BASE_URL/api/menu_list";
  static const String aboutData = "$BASE_URL/api/about";
  static const String userDetails = "$BASE_URL/api/user_details";
  static const String categoryWiseMenu = "$BASE_URL/api/location_category_menu";
  static const String locationComboMenu = "$BASE_URL/api/location_combo_menu";
  static const String addTocart = "$BASE_URL/api/add_to_cart";
  static const String cartList = "$BASE_URL/api/cart_details";
  static const String cartquantity = "$BASE_URL/api/update_cart";
  static const String cartClear = "$BASE_URL/api/clear_cart";
  static const String productDetails = "$BASE_URL/api/product_details";
  static const String orderCreated = "$BASE_URL/api/order_created";
}

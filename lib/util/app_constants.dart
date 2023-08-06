import 'package:the_drive/data/model/response/language_model.dart';

class AppConstants {
  static const String APP_NAME = 'The Drive';
  static const double APP_VERSION = 6.0;

  static const String BASE_URL = 'http://thedrive-api.digitalmagna.online';

  static const String FAWRY_BASE_URL = "https://atfawry.fawrystaging.com/";

  // Shared Key

  static const String THEME = 'theme';

  // authentication
  static const String TOKEN = 'token';
  static const String DECODED_TOKEN = 'DECODEDTOKEN';
  static const String REFRESH_TOKEN = 'refreshtoken';
  static const String USER_AVATAR_PATH = 'userAvatar';
  static const String REGISTER_URI = "/api/security/v1/user";
  static const String LOGIN_URI = "/api/security/v1/user/authenticate";
  static const String CHANGE_PASSWORD = "/api/security/v1/user/changePassword";
  static const String RESET_PASSWORD = "/api/security/v1/user/resetPassword";
  static const String CREATE_USER = "/api/security/v1/user";
  static const String LOGGED_USER_ID = "logedUserID";
  static const String UPDATE_PROFILE_URI = "/api/security/v1/user";
  static const String RESET_PASSWORD_URI =
      "/api/security/v1/user/changePassword";
  static const String FORGET_PASSWORD_URI =
      "/api/security/v1/user/resetPassword";
  static const String VERIFY_TOKEN_URI = "/api/v1/auth";
  static const String REFRESH_TOKEN_URI = "/api/v1/auth";
  static const String TOKEN_URI = "/api/v1/auth";
  static const String INTRO = "/api/v1/auth";

// end of authentication

// start station end point
  static const String ALL_STATIONS = "/api/v1/data/query/stations";
  static const String STATION_CATEGORY = "/api/v1/data/query/categorybystation";
  static const String PICK_UP_TYPES = "/api/lov/v1/sync/lov";
  static const String ALL_MENUS = "/api/v1/data/query/stationmenu";
  static const String MENY_BU_ID = "/api/v1/data/query/stationmenu";
  static const String ALL_CATEGORIES = "/api/v1/data/query/categoryaddons";
  static const String CATEGORY_BY_ID = "/api/v1/data/query/categoryaddons";
  static const String CUSTOMER_REMOVE = "/api/v1/auth";
  static const String USER_INFO_URI = "/api/v1/data/query/userinfo";
  static const String WISH_LIST_GET_URI = "";
  static const String ADD_WISH_LIST_URI = "/api/security/v1/user";
  static const String REMOVE_WISH_LIST_URI = "/api/security/v1/user";
  static const String ALL_OFFER_URI = "/api/v1/data/query/offers";

// end of wishlist

// product

  static const String POPULAR_PRODUCT_URI = "/api/security/v1/user";
  static const String REVIEWED_PRODUCT_URI = "/api/security/v1/user";
  static const String PRODUCT_ADD_ONS = "/api/v1/data/query/categoryaddons";
  static const String ALL_ADD_ONS = "/api/v1/data/query/categoryaddons";
  static const String NEW_IN_MENU = "/api/v1/data/query/newinmenu";
  static const String NEW_IN_MENU_BU_ID = "/api/v1/data/query/newinmenu";
  static const String BANNER_URI = "/api/v1/data/query/banner";
  static const String BANNER_BY_ID_URI = "/api/v1/data/query/banner";
  static const String OFFERS_BY_STATIONS =
      "/api/v1/data/query/categorybystation";

// end of product
  static const String PROFILE_URI = "";
  static const String NOTIFICATION_URI = "";

  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';
  static const String CART_LIST = 'cart_list';
  static const String FAVORIT_LIST = 'favori_list';
  static const String USER_PASSWORD = 'user_password';
  static const String USER_NUMBER = 'user_number';
  static const String NOTIFICATION = 'notification';
  static const String NOTIFICATION_COUNT = 'notification_count';
  static const String LOCALIZATION_KEY = 'X-localization';
  static const String CLIENT_REMOVE = "";

  // fawry gate way credintioals
  static const Portal_Login_URL = 'https://atfawry.fawrystaging.com/';
  static const User_Name = 'kzaki@thewaterwaydevelopments.com';
  static const Password = ' P@ssw0rd';

  static const String Merchant_Code = "770000015474";
  static const String Security_Key = "d7067629-af96-4239-a6f4-b4c704a019a7";

  static List<LanguageModel> languages = [
    LanguageModel(
        languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(
        languageName: 'Arabic', countryCode: 'SA', languageCode: 'ar'),
  ];
}

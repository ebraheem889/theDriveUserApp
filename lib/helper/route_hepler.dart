import 'dart:developer';

import 'package:flutter_wall_layout/flutter_wall_layout.dart';
import 'package:get/get.dart';
import 'package:the_drive/view/screen/Auth/forgetPassword/forgetPasswordScreen.dart';
import 'package:the_drive/view/screen/Auth/newPassword/newPassword.dart';
import 'package:the_drive/view/screen/Auth/otp/otp_screen.dart';
import 'package:the_drive/view/screen/Auth/signin/signin.dart';
import 'package:the_drive/view/screen/Auth/signup/signup_widget.dart';
import 'package:the_drive/view/screen/cart/cart_screen.dart';
import 'package:the_drive/view/screen/contactus/contact_us_screen.dart';
import 'package:the_drive/view/screen/exploreStation/explore_station_screen.dart';
import 'package:the_drive/view/screen/favorit/favorit_screen.dart';
import 'package:the_drive/view/screen/home/home.dart';
import 'package:the_drive/view/screen/myorder/myOrder_screen.dart';
import 'package:the_drive/view/screen/notification/notification_screen.dart';
import 'package:the_drive/view/screen/onBording/onBording_screen.dart';
import 'package:the_drive/view/screen/personalInfo/personal_info_screen.dart';
import 'package:the_drive/view/screen/pickType/pich_up_type_screen.dart';
import 'package:the_drive/view/screen/productdetails/product_details.dart';
import 'package:the_drive/view/screen/screen_from_home/new_in_menu.dart';
import 'package:the_drive/view/screen/stationsOffers/offers_screen.dart';
import 'package:the_drive/view/screen/screens_from_darwer/location.dart';
import 'package:the_drive/view/screen/setting/setting_screen.dart';
import 'package:the_drive/view/screen/wallet/wallet_screen.dart';
import 'package:the_drive/view/widget/cart/scan_qr.dart';
import 'package:the_drive/view/widget/home_station/station_deatils.dart';

class RouteHelper {
  static const String splash = '/';
  static const String home = '/home';
  static const String signUp = '/signup';
  static const String signIn = '/signin';
  static const String otp = '/otp';
  static const String verification = '/verification';
  static const String cart = '/cart';
  static const String exploreStation = "/exploreStation";
  static const String pickupStation = "/pickupStation";
  static const String offers = "/offers";
  static const String newInMenu = "/newInMenu";
  static const String orderDetails = '/order-details';
  static const String profile = '/profile';
  static const String updateProfile = '/update-profile';
  static const String notification = '/notification';
  static const String myOrder = '/myOrder';
  static const String activeOrder = '/activeOrder';
  static const String pastOrder = '/pastOrder';
  static const String contactUs = '/contactUs';
  static const String fav = '/fav';
  static const String location = '/location';
  static const String personalInfo = '/personalInfo';
  static const String setting = '/seeting';
  static const String wallet = '/wallet';
  static const String scanQr = '/scanQr';
  static const String details = '/details';
  static const String forgetPassword = '/forgetPassword';
  static const String newPassword = '/newPassword';
  static const String PickupType = "/PickupType";

  static String getOtpScreen({required String destinationScreeen}) =>
      "${otp}?goingScreenName=$destinationScreeen";
  static String getSplashRoute() => splash;
  static String getHomePage() => home;
  static String getSignUp() => signUp;
  static String getsignInPage() => signIn;
  static String getforgetPasswordPage() => forgetPassword;
  static String getCartScreen() => '$cart';
  static String getpickupStationScreen(int Pickuptype) =>
      '$pickupStation?pickUpType=$Pickuptype';
  static String getProductDetailsScreen(int Pickuptype) =>
      '$details?pickUpType=$Pickuptype';

// start  drawer routes
  static String getPersonalInfoScreen() => personalInfo;
  static String getMyOrderScreen() => myOrder;
  static String getLoginPage() => signIn;
  static String getNotificationPage() => notification;
  static String getFavoritPage() => fav;
  static String getWalletPage() => wallet;
  static String getSettingPage() => setting;
  static String getContactUsPage() => contactUs;
  static String getExploreStationScreen() => exploreStation;
  static String getPickTypeScreen(String stationId) =>
      '$PickupType?stationId=$stationId';

  static String getNewPasswordScreen() => newPassword;

  // end of drawer routes

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => OnBoardingPageScreen()),
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: signUp, page: () => SignUpScreen()),
    GetPage(name: signIn, page: () => SignInScreen()),
    GetPage(
        name: otp,
        page: () {
          String screenName = Get.parameters['goingScreenName'].toString();

          return OTPScreen(
            goingScreenName: screenName,
          );
        }),
    GetPage(name: notification, page: () => NotificationScreen()),
    GetPage(
        name: cart,
        page: () {
          return CartScreen();
        }),
    GetPage(name: exploreStation, page: () => StationsScreen()),
    GetPage(
        name: PickupType,
        page: () {
          String stationId = Get.parameters['stationId'].toString();

          return PickupTypeScreen(
            stationID: stationId,
          );
        }),
    GetPage(name: offers, page: () => OffersScreen()),
    GetPage(name: newInMenu, page: () => NewInMenuScreen()),
    GetPage(name: myOrder, page: () => MyOrderScreen()),
    // GetPage(name: activeOrder, page: () => ActiveOrderScreen()),
    // GetPage(name: pastOrder, page: () => PostOrderScreen()),
    GetPage(name: contactUs, page: () => ContactUsScreen()),
    GetPage(name: fav, page: () => FavScreen()),
    GetPage(name: location, page: () => LocationScreen()),
    GetPage(name: personalInfo, page: () => PersonalInfoScreen()),
    GetPage(name: setting, page: () => SettingScreen()),
    GetPage(name: wallet, page: () => WalletScreen()),
    GetPage(name: scanQr, page: () => ScanQRScreen()),
    // GetPage(
    //     name: details,
    //     page: () {
    //       int pickUpType = int.parse(Get.parameters['pickUpType'].toString());
    //       return ProductDetails(
    //         pickType: pickUpType,
    //       );
    //     }),
    GetPage(name: forgetPassword, page: () => ForgetPasswordScreen()),
    GetPage(name: newPassword, page: () => NewPasswordScreen()),
  ];
}

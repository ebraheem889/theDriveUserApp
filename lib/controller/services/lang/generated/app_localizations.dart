import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @activeOrdersTitle.
  ///
  /// In en, this message translates to:
  /// **'Active orders'**
  String get activeOrdersTitle;

  /// No description provided for @addToCartButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Add To Cart'**
  String get addToCartButtonTitle;

  /// No description provided for @allNotification.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allNotification;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Paid Amount'**
  String get amount;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'The Drive'**
  String get appTitle;

  /// No description provided for @askToMoveToCart.
  ///
  /// In en, this message translates to:
  /// **'Moving to cart?'**
  String get askToMoveToCart;

  /// No description provided for @birthdayTitle.
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get birthdayTitle;

  /// No description provided for @cancelButton.
  ///
  /// In en, this message translates to:
  /// **'CANCEL'**
  String get cancelButton;

  /// No description provided for @cartButton.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cartButton;

  /// No description provided for @cartPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cartPageTitle;

  /// No description provided for @catrgoryListHint.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get catrgoryListHint;

  /// No description provided for @changeLang.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLang;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @changePasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePasswordTitle;

  /// No description provided for @checkOut.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkOut;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @contactUsButton.
  ///
  /// In en, this message translates to:
  /// **'Submit Message'**
  String get contactUsButton;

  /// No description provided for @contactUsGreating.
  ///
  /// In en, this message translates to:
  /// **'We are happy to hear from you'**
  String get contactUsGreating;

  /// No description provided for @contactUsGreating2.
  ///
  /// In en, this message translates to:
  /// **'Choose the feedback you need, to help The drive goes better.'**
  String get contactUsGreating2;

  /// No description provided for @contactUsTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Voice'**
  String get contactUsTitle;

  /// No description provided for @customizeOrderButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Customize Order'**
  String get customizeOrderButtonTitle;

  /// No description provided for @customizeTitle1.
  ///
  /// In en, this message translates to:
  /// **'Customize Your Ingredients'**
  String get customizeTitle1;

  /// No description provided for @customizeTitle2.
  ///
  /// In en, this message translates to:
  /// **'Select Your Favorite Side Item'**
  String get customizeTitle2;

  /// No description provided for @customizeTitle3.
  ///
  /// In en, this message translates to:
  /// **'Select your Favorite Beverage'**
  String get customizeTitle3;

  /// No description provided for @deleteAsk.
  ///
  /// In en, this message translates to:
  /// **'Delete ?'**
  String get deleteAsk;

  /// No description provided for @deleteButton.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteButton;

  /// No description provided for @deliveredTitle.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get deliveredTitle;

  /// No description provided for @dineDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'You Checked In'**
  String get dineDialogTitle;

  /// No description provided for @dineIn.
  ///
  /// In en, this message translates to:
  /// **'Dine in'**
  String get dineIn;

  /// No description provided for @discoverButton.
  ///
  /// In en, this message translates to:
  /// **'Discover more'**
  String get discoverButton;

  /// No description provided for @drinksTitle.
  ///
  /// In en, this message translates to:
  /// **'Drinks'**
  String get drinksTitle;

  /// No description provided for @driveThru.
  ///
  /// In en, this message translates to:
  /// **'Drive Thru'**
  String get driveThru;

  /// No description provided for @egyptCurrency.
  ///
  /// In en, this message translates to:
  /// **'E£'**
  String get egyptCurrency;

  /// No description provided for @enterYourPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Password'**
  String get enterYourPasswordTitle;

  /// No description provided for @fastfoodTitle.
  ///
  /// In en, this message translates to:
  /// **'Fast Food'**
  String get fastfoodTitle;

  /// No description provided for @favoritesTitle.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favoritesTitle;

  /// No description provided for @favourite.
  ///
  /// In en, this message translates to:
  /// **'Favourite'**
  String get favourite;

  /// No description provided for @genderTitle.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get genderTitle;

  /// No description provided for @inProgress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get inProgress;

  /// No description provided for @instractorMsg.
  ///
  /// In en, this message translates to:
  /// **'To See The Available Menu'**
  String get instractorMsg;

  /// No description provided for @itemAddedMsg.
  ///
  /// In en, this message translates to:
  /// **'Item Added'**
  String get itemAddedMsg;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @locationButton.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get locationButton;

  /// No description provided for @locationMsgPart1.
  ///
  /// In en, this message translates to:
  /// **'Do You Want To Open'**
  String get locationMsgPart1;

  /// No description provided for @locationMsgPart2.
  ///
  /// In en, this message translates to:
  /// **'Google Maps ?'**
  String get locationMsgPart2;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logOut;

  /// No description provided for @min.
  ///
  /// In en, this message translates to:
  /// **'Min'**
  String get min;

  /// No description provided for @myOrders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get myOrders;

  /// No description provided for @newInMenu.
  ///
  /// In en, this message translates to:
  /// **'New in Menu'**
  String get newInMenu;

  /// No description provided for @newInMenuHeader.
  ///
  /// In en, this message translates to:
  /// **'Explore New In Menu'**
  String get newInMenuHeader;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @offers.
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get offers;

  /// No description provided for @offersHeader.
  ///
  /// In en, this message translates to:
  /// **'Explore Offers'**
  String get offersHeader;

  /// No description provided for @opinion.
  ///
  /// In en, this message translates to:
  /// **'Opinion'**
  String get opinion;

  /// No description provided for @orderId.
  ///
  /// In en, this message translates to:
  /// **'Order ID:'**
  String get orderId;

  /// No description provided for @orderNotification.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orderNotification;

  /// No description provided for @orderSubmittedTitle.
  ///
  /// In en, this message translates to:
  /// **'Order Submitted'**
  String get orderSubmittedTitle;

  /// No description provided for @paidBy.
  ///
  /// In en, this message translates to:
  /// **'Paid By'**
  String get paidBy;

  /// No description provided for @pastOrderTitle.
  ///
  /// In en, this message translates to:
  /// **'Past Orders'**
  String get pastOrderTitle;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Info'**
  String get personalInfo;

  /// No description provided for @phoneNumberTitle.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumberTitle;

  /// No description provided for @pickupHeader.
  ///
  /// In en, this message translates to:
  /// **'Choose Your Pickup'**
  String get pickupHeader;

  /// No description provided for @qrDialogButton.
  ///
  /// In en, this message translates to:
  /// **'Scan QR'**
  String get qrDialogButton;

  /// No description provided for @qrDialogSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Please checkin to set your table'**
  String get qrDialogSubTitle;

  /// No description provided for @qrDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'This Order Dine In'**
  String get qrDialogTitle;

  /// No description provided for @rateButton.
  ///
  /// In en, this message translates to:
  /// **'Rate Order'**
  String get rateButton;

  /// No description provided for @rateButtonsubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get rateButtonsubmit;

  /// No description provided for @readyProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get readyProgressTitle;

  /// No description provided for @reorderTitle.
  ///
  /// In en, this message translates to:
  /// **'Reorder'**
  String get reorderTitle;

  /// No description provided for @saveChangeTitle.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChangeTitle;

  /// No description provided for @seeMore.
  ///
  /// In en, this message translates to:
  /// **'See More'**
  String get seeMore;

  /// No description provided for @setAvatarTitle.
  ///
  /// In en, this message translates to:
  /// **'SET YOUR AVATAR'**
  String get setAvatarTitle;

  /// No description provided for @setting.
  ///
  /// In en, this message translates to:
  /// **'Setting'**
  String get setting;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @slideItemTitle.
  ///
  /// In en, this message translates to:
  /// **'Side Items'**
  String get slideItemTitle;

  /// No description provided for @stationHeader.
  ///
  /// In en, this message translates to:
  /// **'Explore Stations'**
  String get stationHeader;

  /// No description provided for @stationTitle.
  ///
  /// In en, this message translates to:
  /// **'Station'**
  String get stationTitle;

  /// No description provided for @successfulyMsg.
  ///
  /// In en, this message translates to:
  /// **'Successfuly'**
  String get successfulyMsg;

  /// No description provided for @tableNumber.
  ///
  /// In en, this message translates to:
  /// **'Table Number:'**
  String get tableNumber;

  /// No description provided for @termsConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsConditions;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Estimate time'**
  String get time;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @totalOrder.
  ///
  /// In en, this message translates to:
  /// **'Total Amount :'**
  String get totalOrder;

  /// No description provided for @transactionNumber.
  ///
  /// In en, this message translates to:
  /// **'Transaction Number:'**
  String get transactionNumber;

  /// No description provided for @userNameTitle.
  ///
  /// In en, this message translates to:
  /// **'User Name'**
  String get userNameTitle;

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @viewCart.
  ///
  /// In en, this message translates to:
  /// **'View Cart'**
  String get viewCart;

  /// No description provided for @viewOrder.
  ///
  /// In en, this message translates to:
  /// **'View Order'**
  String get viewOrder;

  /// No description provided for @wallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get wallet;

  /// No description provided for @window.
  ///
  /// In en, this message translates to:
  /// **'Window'**
  String get window;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

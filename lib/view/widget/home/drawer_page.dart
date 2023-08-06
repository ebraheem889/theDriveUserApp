// // ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, sort_child_properties_last, avoid_types_as_parameter_names

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:the_drive/controller/services/const/colors.dart';
// import 'package:the_drive/controller/services/const/function.dart';
// import 'package:the_drive/view/screen/screens_from_darwer/contact_us.dart';
// import 'package:the_drive/view/screen/screens_from_darwer/fav_screen.dart';
// import 'package:the_drive/view/screen/screens_from_darwer/myOrder.dart';
// import 'package:the_drive/view/screen/screens_from_darwer/personal_info.dart';
// import 'package:the_drive/view/screen/screens_from_darwer/setting.dart';
// import 'package:the_drive/view/screen/screens_from_darwer/wallet.dart';
// import 'package:the_drive/view/widget/custom/alerts/alertForGoogleMaps.dart';

// Widget DrawerPage(context) {
//   return Column(
//     mainAxisSize: MainAxisSize.max,
//     children: [
//       const Spacer(),
//       // image and name
//       Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//         child: Container(
//           height: 100,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Container(
//                     width: 43,
//                     height: 43,
//                     // margin: const EdgeInsets.only(
//                     //   top: 24.0,
//                     //   bottom: 64.0,
//                     // ),
//                     clipBehavior: Clip.antiAlias,
//                     decoration: const BoxDecoration(
//                       color: lightSecondaryColor,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                   Container(
//                     child: Image.asset("assets/images/face4.png"),
//                     width: 40,
//                     height: 40,
//                     // margin: const EdgeInsets.only(
//                     //   top: 25.0,
//                     //   bottom: 64.0,
//                     // ),
//                     clipBehavior: Clip.antiAlias,
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).scaffoldBackgroundColor,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ],
//               ),
//               const Spacer(),
//               Center(
//                 child: Text(
//                   "Mahmmoud Ali".split(" ").first,
//                   style: const TextStyle(
//                       fontSize: 18, fontWeight: FontWeight.w600),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       //personal info
//       ListTile(
//         onTap: () {
//           navigatTo(context, PersonalInfoScreen());
//         },
//         leading: SvgPicture.asset("assets/icons/personal.svg"),
//         title: Text(
//           AppLocalizations.of(context)!.personalInfo,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//         ),
//       ),
//       //my order
//       ListTile(
//         onTap: () {
//           navigatTo(context, const MyOrderScreen());
//         },
//         leading: SvgPicture.asset("assets/icons/myorder.svg"),
//         title: Text(
//           AppLocalizations.of(context)!.myOrders,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//         ),
//       ),
//       //fav
//       ListTile(
//         onTap: () {
//           navigatTo(context, FavScreen());
//         },
//         leading: SvgPicture.asset("assets/icons/fav.svg"),
//         title: Text(
//           AppLocalizations.of(context)!.favourite,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//         ),
//       ),
//       //wallet
//       ListTile(
//         onTap: () {
//           navigatTo(context, const WalletScreen());
//         },
//         leading: SvgPicture.asset("assets/icons/wallet.svg"),
//         title: Text(
//           AppLocalizations.of(context)!.wallet,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//         ),
//       ),
//       //location
//       ListTile(
//         onTap: () {
//           showDialog(
//               context: context,
//               builder: (Builder) {
//                 return checkLunchGoogleMaps(context);
//               });
//         },
//         leading: SvgPicture.asset("assets/icons/location.svg"),
//         title: Text(
//           AppLocalizations.of(context)!.location,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//         ),
//       ),
//       //location
//       ListTile(
//         onTap: () {
//           navigatTo(context, const SettingScreen());
//         },
//         leading: const Icon(Icons.settings),
//         title: Text(
//           AppLocalizations.of(context)!.setting,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//         ),
//       ),
//       //contact us
//       ListTile(
//         onTap: () {
//           navigatTo(context, ContactUsScreen());
//         },
//         leading: SvgPicture.asset("assets/icons/conactus.svg"),
//         title: Text(
//           AppLocalizations.of(context)!.contactUs,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//         ),
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//       MyDivider(155, context),
//       const SizedBox(
//         height: 10,
//       ),
//       Text(
//         AppLocalizations.of(context)!.termsConditions,
//         style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
//       ),
//       const SizedBox(
//         height: 140,
//       ),
//       const Spacer(),
//     ],
//   );
// }

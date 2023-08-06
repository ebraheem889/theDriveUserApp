// // ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:the_drive/controller/services/const/function.dart';
// import 'package:the_drive/controller/services/lang/generated/app_localizations.dart';
// import 'package:the_drive/helper/route_hepler.dart';
// import 'package:the_drive/view/base/custom_appBar.dart';

// class SettingScreen extends StatefulWidget {
//   const SettingScreen({Key? key}) : super(key: key);

//   @override
//   State<SettingScreen> createState() => _SettingScreenState();
// }

// class _SettingScreenState extends State<SettingScreen> {
//   bool lang = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 17.0),
//       child: Column(
//         children: [
//           const SizedBox(
//             height: 22,
//           ),
//           //app bar
//           barApp(context, AppLocalizations.of(context)!.setting),
//           const SizedBox(
//             height: 81,
//           ),
//           //change lang
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 lang = !lang;
//                 lang == true
//                     ? localNotifair.value = "en"
//                     : localNotifair.value = "ar";
//               });
//             },
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   AppLocalizations.of(context)!.changeLang,
//                   style: const TextStyle(
//                       fontSize: 16, fontWeight: FontWeight.w500),
//                 ),
//                 localNotifair.value == 'en'
//                     ? const Text(
//                         "EN",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                           decoration: TextDecoration.underline,
//                         ),
//                       )
//                     : const Text(
//                         "عربي",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 32,
//           ),
//           //chang password
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 AppLocalizations.of(context)!.changePassword,
//                 style:
//                     const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//               Image.asset(
//                 "assets/images/changePasswordIcon.png",
//                 height: 25,
//                 width: 25,
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 32,
//           ),
//           //logout
//           GestureDetector(
//             onTap: () {
//               Get.toNamed(RouteHelper.getsignInPage());
//             },
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   AppLocalizations.of(context)!.logOut,
//                   style: const TextStyle(
//                       fontSize: 16, fontWeight: FontWeight.w500),
//                 ),
//                 RotatedBox(
//                   quarterTurns: localNotifair.value == "ar" ? -2 : 0,
//                   child: Image.asset(
//                     "assets/images/logOutIcon.png",
//                     height: 25,
//                     width: 25,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 141,
//           ),
//           Container(
//             height: 298,
//             child: Image.asset(
//               "assets/images/settingPic.png",
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
// }

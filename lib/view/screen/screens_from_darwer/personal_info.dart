// // ignore_for_file: use_key_in_widget_constructors, avoid_print, prefer_const_constructors

// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:the_drive/controller/services/const/colors.dart';
// import 'package:the_drive/helper/route_hepler.dart';
// import 'package:the_drive/view/widget/custom/customButton.dart';
// import 'package:the_drive/view/widget/custom/customTextFormField.dart';
// import 'package:the_drive/view/base/custom_appBar.dart';
// import 'package:intl/intl.dart' as intl;

// class PersonalInfoScreen extends StatefulWidget {
//   @override
//   State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
// }

// class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   TextEditingController dateCtl = TextEditingController();
//   TextEditingController userNameController = TextEditingController();
//   TextEditingController checkBoxController = TextEditingController();
//   final genderList = <String>['male', 'female'];
//   String? dropdownValue;
//   bool checkValue = false;
//   //test4

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15.0),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 22,
//                 ),
//                 barApp(context, "Mahmoud Ali"),
//                 const SizedBox(
//                   height: 24,
//                 ),
//                 //user name
//                 SizedBox(
//                     height: 19,
//                     width: 90,
//                     child: Text(
//                       AppLocalizations.of(context)!.userNameTitle,
//                       style: const TextStyle(fontSize: 13, color: greyColor),
//                     )),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 defaultTextForm(
//                   controller: userNameController,
//                   hintText: AppLocalizations.of(context)!.userNameTitle,
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 //phone number
//                 SizedBox(
//                     height: 20,
//                     child: Text(
//                       AppLocalizations.of(context)!.phoneNumberTitle,
//                       style: const TextStyle(fontSize: 13, color: greyColor),
//                     )),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 IntlPhoneField(
//                   style: const TextStyle(
//                     fontSize: 13,
//                   ),
//                   decoration: InputDecoration(
//                     counter: const SizedBox.shrink(),
//                     contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 18, vertical: 20),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: const BorderSide(),
//                     ),
//                   ),
//                   initialCountryCode: 'EG',
//                   onChanged: (phone) {
//                     print(phone.completeNumber);
//                   },
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 // gender & birth date
//                 Row(
//                   children: [
//                     // gender
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width / 2.3,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(
//                             height: 1,
//                           ),
//                           SizedBox(
//                               height: 23,
//                               child: Text(
//                                 AppLocalizations.of(context)!.genderTitle,
//                                 style: const TextStyle(
//                                     fontSize: 13, color: greyColor),
//                               )),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           DropdownButtonFormField(
//                             style: const TextStyle(
//                                 fontSize: 12, color: Colors.black),
//                             decoration: InputDecoration(
//                               contentPadding: const EdgeInsets.symmetric(
//                                   horizontal: 18, vertical: 20),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 borderSide: const BorderSide(),
//                               ),
//                             ),
//                             hint: Text(
//                               AppLocalizations.of(context)!.genderTitle,
//                               style: TextStyle(fontSize: 13),
//                             ),
//                             value: dropdownValue,
//                             items: genderList
//                                 .map<DropdownMenuItem<String>>((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Text(value),
//                               );
//                             }).toList(),
//                             onChanged: (Object? value) {},
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Spacer(),
//                     // birth date
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width / 2.3,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(
//                             height: 1,
//                           ),
//                           SizedBox(
//                               height: 23,
//                               child: Text(
//                                 AppLocalizations.of(context)!.birthdayTitle,
//                                 style: const TextStyle(
//                                     fontSize: 13, color: greyColor),
//                               )),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           TextFormField(
//                             style: const TextStyle(
//                               fontSize: 12,
//                             ),
//                             minLines: 1,
//                             onChanged: (value) {
//                               dateCtl.text = value;
//                             },
//                             controller: dateCtl,
//                             decoration: InputDecoration(
//                               suffixIcon: SizedBox(
//                                 // height: 8,
//                                 width: 9,
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     SvgPicture.asset(
//                                       "assets/icons/data_icon.svg",
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               contentPadding: const EdgeInsets.symmetric(
//                                   horizontal: 18, vertical: 20),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 borderSide: const BorderSide(),
//                               ),
//                               hintStyle: const TextStyle(
//                                   fontSize: 10, color: greyColor),
//                               hintText: "DD/MM/YYYY",
//                             ),
//                             onTap: () async {
//                               DateTime? date = DateTime(1900);
//                               FocusScope.of(context).requestFocus(FocusNode());

//                               date = await showDatePicker(
//                                   context: context,
//                                   initialDate: DateTime.now(),
//                                   firstDate: DateTime(1900),
//                                   lastDate: DateTime(2150));
//                               String formattedDate =
//                                   intl.DateFormat('dd-MM-yyyy').format(date!);

//                               dateCtl.text = formattedDate.toString();
//                               print(formattedDate);
//                             },
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 //password
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 SizedBox(
//                     height: 23,
//                     child: Text(
//                       AppLocalizations.of(context)!.changePasswordTitle,
//                       style: const TextStyle(fontSize: 13, color: greyColor),
//                     )),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 defaultTextForm(
//                     hintText:
//                         AppLocalizations.of(context)!.enterYourPasswordTitle,
//                     passwd: true,
//                     visableIcon: Icons.visibility_off_outlined,
//                     type: TextInputType.visiblePassword),
//                 const SizedBox(
//                   height: 32,
//                 ),
//                 //select your avtar
//                 SizedBox(
//                     height: 23,
//                     child: Text(
//                       AppLocalizations.of(context)!.setAvatarTitle,
//                       style: TextStyle(fontSize: 13, color: greyColor),
//                     )),
//                 const SizedBox(
//                   height: 19,
//                 ),
//                 SizedBox(
//                   height: 53,
//                   width: 337,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       SizedBox(
//                         width: 50,
//                         child: Image.asset("assets/images/main_logo.png"),
//                       ),
//                       const SizedBox(
//                         width: 8,
//                       ),
//                       SizedBox(
//                         width: 50,
//                         child: Image.asset("assets/images/face1.png"),
//                       ),
//                       const SizedBox(
//                         width: 8,
//                       ),
//                       SizedBox(
//                         width: 50,
//                         child: Image.asset("assets/images/face2.png"),
//                       ),
//                       const SizedBox(
//                         width: 8,
//                       ),
//                       SizedBox(
//                         width: 50,
//                         child: Image.asset("assets/images/face3.png"),
//                       ),
//                       const SizedBox(
//                         width: 8,
//                       ),
//                       SizedBox(
//                         width: 50,
//                         child: Image.asset("assets/images/face4.png"),
//                       ),
//                       const SizedBox(
//                         width: 8,
//                       ),
//                       SizedBox(
//                         width: 50,
//                         child: Image.asset("assets/images/face5.png"),
//                       ),
//                       const SizedBox(
//                         width: 8,
//                       ),
//                       SizedBox(
//                         width: 50,
//                         child: Image.asset("assets/images/face6.png"),
//                       ),
//                       const SizedBox(
//                         width: 8,
//                       ),
//                       SizedBox(
//                         width: 50,
//                         child: Image.asset("assets/images/face7.png"),
//                       ),
//                       const SizedBox(
//                         width: 8,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 18,
//                 ),
//                 //Save changes button
//                 Center(
//                   child: CustomButton(
//                     height: 57,
//                     width: MediaQuery.of(context).size.width,
//                     // isLoading: state is SignUpLoading,
//                     onPressed: () {
//                       Get.toNamed(RouteHelper.getHomePage());
//                     },
//                     text: AppLocalizations.of(context)!.saveChangeTitle,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 54,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ignore_for_file: curly_braces_in_flow_control_structures, avoid_types_as_parameter_names, non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:swipe/swipe.dart';
// import 'package:the_drive/controller/cubit/drive/cubit.dart';
// import 'package:the_drive/controller/cubit/drive/states.dart';
// import 'package:the_drive/controller/services/const/colors.dart';
// import 'package:the_drive/controller/services/const/function.dart';
// import 'package:the_drive/controller/services/lang/generated/app_localizations.dart';
// import 'package:the_drive/view/widget/custom/alerts/AddItemToCart.dart';
// import 'package:the_drive/view/base/gustAlert.dart';
// import 'package:the_drive/view/widget/custom/custom_icon_button.dart';
// import 'package:the_drive/view/widget/custom/custom_icon_size.dart';
// import 'package:the_drive/view/widget/custom/custom_pragraph.dart';
// import 'package:the_drive/view/widget/custom/custom_title.dart';
// import 'package:the_drive/view/widget/home/cart_widget.dart';
// import 'package:the_drive/view/base/add_to_card.dart';
// import 'package:the_drive/view/widget/home_station/product_counter_box.dart';

// class ProductDetailsScreen extends StatefulWidget {
//   final int pickType;

//   const ProductDetailsScreen({super.key, required this.pickType});
//   @override
//   State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
// }

// class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
//   bool isOpen = false;
//   bool customizeOption1 = false;
//   bool customizeOption2 = false;
//   bool customizeOption3 = false;
//   bool checkValue11 = true;
//   bool checkValue12 = false;
//   bool checkValue13 = true;
//   bool checkValue14 = false;
//   bool checkValue21 = true;
//   bool checkValue22 = false;
//   bool checkValue23 = true;
//   bool checkValue24 = false;
//   bool checkValue31 = true;
//   bool checkValue32 = true;
//   bool checkValue33 = false;
//   bool checkValue34 = false;

//   double hight = 165;
//   Offset? old;
//   Offset? newOld;
//   bool isCartClick = false;
//   int counter1 = 5;
//   int counter = 1;
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<DriverCubit, DriveStates>(
//       listener: (BuildContext context, state) {},
//       builder: (BuildContext context, Object? state) {
//         DriverCubit getData = DriverCubit.get(context);
//         final height = MediaQuery.of(context).size.height;
//         final width = MediaQuery.of(context).size.width;
//         return Swipe(
//           onSwipeRight: () => Navigator.pop(context),
//           onSwipeUp: () {
//             if (getData.gustID == null)
//               setState(() {
//                 hight = 615;
//               });
//           },
//           onSwipeDown: () {
//             if (getData.gustID == null)
//               setState(() {
//                 hight = 165;
//               });
//           },
//           child: Scaffold(
//             extendBody: true,
//             extendBodyBehindAppBar: true,
//             backgroundColor: const Color(0xFF06BFB6),
//             appBar: AppBar(
//               elevation: 0,
//               leading: GestureDetector(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Center(
//                   child: RotatedBox(
//                     quarterTurns: localNotifair.value == "ar" ? -2 : 0,
//                     child: SvgPicture.asset(
//                       "assets/icons/back.svg",
//                       width: 20,
//                       height: 20,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//               ),
//               actions: [
//                 Center(
//                   child: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         if (getData.gustID != null) {
//                           showDialog(
//                               context: context,
//                               builder: (BuildContext) {
//                                 return GustAlert(context);
//                               });
//                         } else {
//                           isCartClick = !isCartClick;
//                         }
//                       });

//                       // navigatTo(
//                       //     context,
//                       //     CartScreen(
//                       //       pickType: 3,
//                       //     ));
//                     },
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 10),
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 12),
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.5),
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       child: SvgPicture.asset(
//                         "assets/icons/cart-circle-plus.svg",
//                         width: 20,
//                         height: 20,
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             body: Stack(
//               children: [
//                 Container(
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         Color(0xFF5B5388),
//                         Color(0xFF06BFB6),
//                       ],
//                     ),
//                   ),
//                   child: Column(
//                     children: [
//                       const SizedBox(
//                         height: 100,
//                       ),
//                       //imag of product

//                       Image.asset(
//                         widget.pickType == 5
//                             ? "assets/images/icecream.png"
//                             : widget.pickType == 6
//                                 ? "assets/images/hotdog.png"
//                                 : "assets/images/burger2.png",
//                         height: 160,
//                         fit: BoxFit.contain,
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       DotsIndicator(
//                         dotsCount: 4,
//                         position: 0.toDouble(),
//                         decorator: DotsDecorator(
//                           activeColor: Colors.white,
//                           shape: const OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.white,
//                             ),
//                           ),
//                           color: Colors.transparent,
//                           spacing:
//                               const EdgeInsets.all(5.0).copyWith(bottom: 10),
//                           size: const Size(10, 10),
//                           activeSize: const Size(12, 12),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const ProductCounterBox(),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       CustomTitle(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         title: widget.pickType == 5
//                             ? "Ice Cream"
//                             : widget.pickType == 6
//                                 ? "Hot Dog"
//                                 : "Classic Meal Burger Beef",
//                         titleColor: Colors.white,
//                         fontSize: 25,
//                       ),
//                       const SizedBox(
//                         height: 21,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: customProductText(
//                           context: context,
//                           paragraph:
//                               "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy",
//                           paragraphColor: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 24,
//                       ),
//                       Center(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizeIcon(isSelector: false, sizeTitle: "S"),
//                             const SizedBox(
//                               width: 24,
//                             ),
//                             SizeIcon(isSelector: true, sizeTitle: "M"),
//                             const SizedBox(
//                               width: 24,
//                             ),
//                             SizeIcon(isSelector: false, sizeTitle: "L"),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 if (isCartClick)
//                   cartLayout(
//                       context: context,
//                       counter1: counter1,
//                       counter: counter,
//                       height: (height * .12),
//                       width: (width * .40),
//                       imgPositionTop: height / 20,
//                       imgPositionLeft: width * .40,
//                       imgPositionRight: width * .40),
//               ],
//             ),
//             bottomNavigationBar: ClipRRect(
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(30.0),
//                 topRight: Radius.circular(30.0),
//               ),
//               child: Container(
//                 height: hight.abs(),
//                 width: MediaQuery.of(context).size.width,
//                 // height: isOpen ? 650: 165,
//                 decoration: const BoxDecoration(
//                   color: Colors.transparent,
//                 ),
//                 child: Stack(
//                   children: [
//                     Container(
//                       child: GestureDetector(
//                         onTap: (() {
//                           if (getData.gustID != null) {
//                             showDialog(
//                                 context: context,
//                                 builder: ((context) {
//                                   return GustAlert(context);
//                                 }));
//                           } else if (getData.gustID == null) {
//                             if (hight <= 165) {
//                               setState(() {
//                                 hight = 615;
//                               });
//                             } else {
//                               setState(() {
//                                 hight = 165;
//                               });
//                             }
//                           }
//                         }),
//                         // onVerticalDragUpdate: (DragUpdateDetails _) {
//                         //   if(_.delta.dy < - 30){
//                         //     setState((){
//                         //       hight=640;
//                         //     });
//                         //     return;

//                         //   }else if(_.delta.dy >  30){
//                         //     setState(() {
//                         //       hight=165;
//                         //     });
//                         //     return;
//                         //   }

//                         //   if (hight < 640)
//                         //   {
//                         //     customizeOption1=false;
//                         //     customizeOption2=false;
//                         //     customizeOption3=false;
//                         //   };
//                         //   if (old == null) {
//                         //     old = _.localPosition;
//                         //     newOld = _.localPosition;
//                         //   } else {
//                         //     if (newOld!.dy == _.localPosition.dy) return;
//                         //     final diffrence =  _.localPosition.dy.toInt() - newOld!.dy.toInt();
//                         //     final newHeight = hight - diffrence.toInt();
//                         //     if (newHeight <= 640 && newHeight >= 165) {
//                         //       setState(() {
//                         //         hight = newHeight;

//                         //       });
//                         //       newOld = _.localPosition;
//                         //     }
//                         //   }
//                         // },
//                         // onVerticalDragEnd: (_) {
//                         //   setState(() {
//                         //     old = null;
//                         //   });
//                         // },
//                         // onVerticalDragCancel: () {
//                         //   setState(() {
//                         //     old = null;
//                         //   });
//                         // },
//                         child: Align(
//                           alignment: Alignment.bottomCenter,
//                           child: AnimatedContainer(
//                             decoration: BoxDecoration(
//                               color: Colors.transparent.withOpacity(.3),
//                               borderRadius: BorderRadius.circular(35),
//                               boxShadow: [],
//                             ),
//                             duration: const Duration(milliseconds: 300),
//                             height: hight.abs(),
//                             width: MediaQuery.of(context).size.width,
//                             child: hight <= 200
//                                 ? Column(
//                                     children: [
//                                       SizedBox(
//                                         height: 9,
//                                       ),
//                                       InkWell(
//                                         onTap: () {
//                                           if (getData.gustID == null)
//                                             setState(() {
//                                               hight = 640;
//                                             });
//                                         },
//                                         child: SizedBox(
//                                           height: 40,
//                                           child: Column(
//                                             children: [
//                                               SvgPicture.asset(
//                                                 "assets/icons/custmoize_order.svg",
//                                               ),
//                                               Text(
//                                                 AppLocalizations.of(context)!
//                                                     .customizeOrderButtonTitle,
//                                                 style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 14,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 5,
//                                       ),
//                                     ],
//                                   )
//                                 : OverflowBox(
//                                     maxHeight: double.infinity,
//                                     child: Column(
//                                       // mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         const SizedBox(
//                                           height: 22,
//                                         ),
//                                         //down arrow
//                                         InkWell(
//                                           onTap: () {
//                                             setState(() {
//                                               hight = 165;
//                                             });
//                                           },
//                                           child: SizedBox(
//                                             height: 24,
//                                             child: SvgPicture.asset(
//                                                 "assets/icons/uncustomize_order.svg"),
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           height: 19,
//                                         ),
//                                         //first customize
//                                         InkWell(
//                                           onTap: () {
//                                             setState(() {
//                                               customizeOption2 = false;
//                                               customizeOption3 = false;
//                                               customizeOption1 =
//                                                   !customizeOption1;
//                                               print(customizeOption1);
//                                             });
//                                           },
//                                           child: Container(
//                                             height: customizeOption1 ? 333 : 57,
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width /
//                                                 1.1,
//                                             decoration: BoxDecoration(
//                                               color: Theme.of(context)
//                                                   .scaffoldBackgroundColor,
//                                               borderRadius:
//                                                   BorderRadius.circular(12),
//                                             ),
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                 horizontal: 13.0,
//                                               ),
//                                               child: Column(
//                                                 children: [
//                                                   const SizedBox(
//                                                     height: 19,
//                                                   ),
//                                                   Row(
//                                                     children: [
//                                                       Text(
//                                                         AppLocalizations.of(
//                                                                 context)!
//                                                             .customizeTitle1,
//                                                         style: TextStyle(
//                                                             fontSize: 14,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .w500),
//                                                       ),
//                                                       const Spacer(),
//                                                       customizeOption1
//                                                           ? SvgPicture.asset(
//                                                               "assets/icons/arrow_down.svg")
//                                                           : RotatedBox(
//                                                               quarterTurns:
//                                                                   localNotifair
//                                                                               .value ==
//                                                                           "ar"
//                                                                       ? -2
//                                                                       : 0,
//                                                               child: SvgPicture
//                                                                   .asset(
//                                                                       "assets/icons/cusomizeIcon.svg")),
//                                                     ],
//                                                   ),
//                                                   //Lettuce
//                                                   if (customizeOption1 == true)
//                                                     CheckboxListTile(
//                                                       checkboxShape:
//                                                           RoundedRectangleBorder(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           6)),
//                                                       secondary: Image.asset(
//                                                           "assets/images/custom11.png"),
//                                                       value: checkValue11,
//                                                       onChanged: (v) {
//                                                         setState(() {
//                                                           checkValue11 = v!;
//                                                           print(checkValue11);
//                                                         });
//                                                       },
//                                                       title: const Text(
//                                                         "Lettuce",
//                                                         style: TextStyle(
//                                                             fontSize: 16,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .w600),
//                                                       ),
//                                                       subtitle: const Text(
//                                                         "Default",
//                                                         style: TextStyle(
//                                                             fontSize: 12),
//                                                       ),
//                                                       activeColor:
//                                                           lightSecondaryColor,
//                                                     ),
//                                                   //Mushroom
//                                                   if (customizeOption1 == true)
//                                                     CheckboxListTile(
//                                                       checkboxShape:
//                                                           RoundedRectangleBorder(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           6)),
//                                                       secondary: Image.asset(
//                                                           "assets/images/custom12.png"),
//                                                       value: checkValue12,
//                                                       onChanged: (v) {
//                                                         setState(() {
//                                                           checkValue12 = v!;
//                                                           print(checkValue12);
//                                                         });
//                                                       },
//                                                       title: const Text(
//                                                         "Mushroom",
//                                                         style: TextStyle(
//                                                             fontSize: 16,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .w600),
//                                                       ),
//                                                       subtitle: const Text(
//                                                         "Extra ( + 5 E£ )",
//                                                         style: TextStyle(
//                                                             fontSize: 12),
//                                                       ),
//                                                       activeColor:
//                                                           lightSecondaryColor,
//                                                     ),
//                                                   //Tomatoes
//                                                   if (customizeOption1 == true)
//                                                     CheckboxListTile(
//                                                       checkboxShape:
//                                                           RoundedRectangleBorder(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           6)),
//                                                       secondary: Image.asset(
//                                                           "assets/images/custom13.png"),
//                                                       value: checkValue13,
//                                                       onChanged: (v) {
//                                                         setState(() {
//                                                           checkValue13 = v!;
//                                                           print(checkValue13);
//                                                         });
//                                                       },
//                                                       title: const Text(
//                                                         "Tomatoes",
//                                                         style: TextStyle(
//                                                             fontSize: 16,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .w600),
//                                                       ),
//                                                       subtitle: const Text(
//                                                         "Default",
//                                                         style: TextStyle(
//                                                             fontSize: 12),
//                                                       ),
//                                                       activeColor:
//                                                           lightSecondaryColor,
//                                                     ),
//                                                   //Onions
//                                                   if (customizeOption1 == true)
//                                                     CheckboxListTile(
//                                                       checkboxShape:
//                                                           RoundedRectangleBorder(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           6)),
//                                                       secondary: Image.asset(
//                                                           "assets/images/custom14.png"),
//                                                       value: checkValue14,
//                                                       onChanged: (v) {
//                                                         setState(() {
//                                                           checkValue14 = v!;
//                                                           print(checkValue14);
//                                                         });
//                                                       },
//                                                       title: const Text(
//                                                         "Onions",
//                                                         style: TextStyle(
//                                                             fontSize: 16,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .w600),
//                                                       ),
//                                                       subtitle: const Text(
//                                                         "Extra ( + 5 E£ )",
//                                                         style: TextStyle(
//                                                             fontSize: 12),
//                                                       ),
//                                                       activeColor:
//                                                           lightSecondaryColor,
//                                                     ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           height: 11,
//                                         ),
//                                         //second customize
//                                         InkWell(
//                                           onTap: () {
//                                             setState(() {
//                                               customizeOption1 = false;
//                                               customizeOption3 = false;
//                                               customizeOption2 =
//                                                   !customizeOption2;
//                                               print(customizeOption2);
//                                             });
//                                           },
//                                           child: Container(
//                                             height: customizeOption2 ? 333 : 57,
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width /
//                                                 1.1,
//                                             decoration: BoxDecoration(
//                                               color: Theme.of(context)
//                                                   .scaffoldBackgroundColor,
//                                               borderRadius:
//                                                   BorderRadius.circular(12),
//                                             ),
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                 horizontal: 13.0,
//                                               ),
//                                               child: Column(
//                                                 children: [
//                                                   const SizedBox(
//                                                     height: 19,
//                                                   ),
//                                                   Row(
//                                                     children: [
//                                                       Text(
//                                                         AppLocalizations.of(
//                                                                 context)!
//                                                             .customizeTitle2,
//                                                         style: TextStyle(
//                                                             fontSize: 14,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .w500),
//                                                       ),
//                                                       const Spacer(),
//                                                       customizeOption2
//                                                           ? SvgPicture.asset(
//                                                               "assets/icons/arrow_down.svg")
//                                                           : RotatedBox(
//                                                               quarterTurns:
//                                                                   localNotifair
//                                                                               .value ==
//                                                                           "ar"
//                                                                       ? -2
//                                                                       : 0,
//                                                               child: SvgPicture
//                                                                   .asset(
//                                                                       "assets/icons/cusomizeIcon.svg")),
//                                                     ],
//                                                   ),
//                                                   //Chinkly Fries
//                                                   if (customizeOption2 == true)
//                                                     CheckboxListTile(
//                                                       checkboxShape:
//                                                           RoundedRectangleBorder(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           6)),
//                                                       secondary: Image.asset(
//                                                           "assets/images/custom21.png"),
//                                                       value: checkValue21,
//                                                       onChanged: (v) {
//                                                         setState(() {
//                                                           checkValue21 = v!;
//                                                           print(checkValue21);
//                                                         });
//                                                       },
//                                                       title: const Text(
//                                                         "Chinkly Fries",
//                                                         style: TextStyle(
//                                                             fontSize: 16,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .w600),
//                                                       ),
//                                                       subtitle: const Text(
//                                                         "Default",
//                                                         style: TextStyle(
//                                                             fontSize: 12),
//                                                       ),
//                                                       activeColor:
//                                                           lightSecondaryColor,
//                                                     ),
//                                                   //Hawt Crinkless
//                                                   if (customizeOption2 == true)
//                                                     CheckboxListTile(
//                                                       checkboxShape:
//                                                           RoundedRectangleBorder(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           6)),
//                                                       secondary: Image.asset(
//                                                           "assets/images/custom22.png"),
//                                                       value: checkValue22,
//                                                       onChanged: (v) {
//                                                         setState(() {
//                                                           checkValue22 = v!;
//                                                           print(checkValue22);
//                                                         });
//                                                       },
//                                                       title: const Text(
//                                                         "Hawt Crinkless",
//                                                         style: TextStyle(
//                                                             fontSize: 16,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .w600),
//                                                       ),
//                                                       subtitle: const Text(
//                                                         "Extra ( + 5 E£ )",
//                                                         style: TextStyle(
//                                                             fontSize: 12),
//                                                       ),
//                                                       activeColor:
//                                                           lightSecondaryColor,
//                                                     ),
//                                                   //Regular Fries
//                                                   if (customizeOption2 == true)
//                                                     CheckboxListTile(
//                                                       checkboxShape:
//                                                           RoundedRectangleBorder(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           6)),
//                                                       secondary: Image.asset(
//                                                           "assets/images/custom23.png"),
//                                                       value: checkValue23,
//                                                       onChanged: (v) {
//                                                         setState(() {
//                                                           checkValue23 = v!;
//                                                           print(checkValue23);
//                                                         });
//                                                       },
//                                                       title: const Text(
//                                                         "Regular Fries",
//                                                         style: TextStyle(
//                                                             fontSize: 16,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .w600),
//                                                       ),
//                                                       subtitle: const Text(
//                                                         "Default",
//                                                         style: TextStyle(
//                                                             fontSize: 12),
//                                                       ),
//                                                       activeColor:
//                                                           lightSecondaryColor,
//                                                     ),
//                                                   //Cheesy Crinkles
//                                                   if (customizeOption2 == true)
//                                                     CheckboxListTile(
//                                                       checkboxShape:
//                                                           RoundedRectangleBorder(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           6)),
//                                                       secondary: Image.asset(
//                                                           "assets/images/custom24.png"),
//                                                       value: checkValue24,
//                                                       onChanged: (v) {
//                                                         setState(() {
//                                                           checkValue24 = v!;
//                                                           print(checkValue24);
//                                                         });
//                                                       },
//                                                       title: const Text(
//                                                         "Cheesy Crinkles",
//                                                         style: TextStyle(
//                                                             fontSize: 16,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .w600),
//                                                       ),
//                                                       subtitle: const Text(
//                                                         "Extra ( + 5 E£ )",
//                                                         style: TextStyle(
//                                                             fontSize: 12),
//                                                       ),
//                                                       activeColor:
//                                                           lightSecondaryColor,
//                                                     ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           height: 11,
//                                         ),
//                                         //third customize
//                                         InkWell(
//                                           onTap: () {
//                                             setState(() {
//                                               customizeOption1 = false;
//                                               customizeOption2 = false;
//                                               customizeOption3 =
//                                                   !customizeOption3;
//                                               print(customizeOption3);
//                                             });
//                                           },
//                                           child: Container(
//                                             height: customizeOption3 ? 333 : 57,
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width /
//                                                 1.1,
//                                             decoration: BoxDecoration(
//                                               color: Theme.of(context)
//                                                   .scaffoldBackgroundColor,
//                                               borderRadius:
//                                                   BorderRadius.circular(12),
//                                             ),
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                 horizontal: 13.0,
//                                               ),
//                                               child: Column(
//                                                 children: [
//                                                   const SizedBox(
//                                                     height: 19,
//                                                   ),
//                                                   Row(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .spaceBetween,
//                                                     children: [
//                                                       Text(
//                                                         AppLocalizations.of(
//                                                                 context)!
//                                                             .customizeTitle3,
//                                                         style: TextStyle(
//                                                             fontSize: 14,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .w500),
//                                                       ),
//                                                       customizeOption3
//                                                           ? SvgPicture.asset(
//                                                               "assets/icons/arrow_down.svg")
//                                                           : RotatedBox(
//                                                               quarterTurns:
//                                                                   localNotifair
//                                                                               .value ==
//                                                                           "ar"
//                                                                       ? -2
//                                                                       : 0,
//                                                               child: SvgPicture
//                                                                   .asset(
//                                                                       "assets/icons/cusomizeIcon.svg")),
//                                                     ],
//                                                   ),
//                                                   //Middy Diet Pepsi
//                                                   if (customizeOption3 == true)
//                                                     CheckboxListTile(
//                                                       checkboxShape:
//                                                           RoundedRectangleBorder(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           6)),
//                                                       secondary: Image.asset(
//                                                           "assets/images/custom31.png"),
//                                                       value: checkValue31,
//                                                       onChanged: (v) {
//                                                         setState(() {
//                                                           checkValue31 = v!;
//                                                           print(checkValue31);
//                                                         });
//                                                       },
//                                                       title: const Text(
//                                                         "Middy Diet Pepsi",
//                                                         style: TextStyle(
//                                                             fontSize: 16,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .w600),
//                                                       ),
//                                                       subtitle: const Text(
//                                                         "Default",
//                                                         style: TextStyle(
//                                                             fontSize: 12),
//                                                       ),
//                                                       activeColor:
//                                                           lightSecondaryColor,
//                                                     ),
//                                                   //Middy Pepsi
//                                                   if (customizeOption3 == true)
//                                                     CheckboxListTile(
//                                                       checkboxShape:
//                                                           RoundedRectangleBorder(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           6)),
//                                                       secondary: Image.asset(
//                                                           "assets/images/custom32.png"),
//                                                       value: checkValue32,
//                                                       onChanged: (v) {
//                                                         setState(() {
//                                                           checkValue32 = v!;
//                                                           print(checkValue32);
//                                                         });
//                                                       },
//                                                       title: const Text(
//                                                         "Middy Pepsi",
//                                                         style: TextStyle(
//                                                             fontSize: 16,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .w600),
//                                                       ),
//                                                       subtitle: const Text(
//                                                         "Default",
//                                                         style: TextStyle(
//                                                             fontSize: 12),
//                                                       ),
//                                                       activeColor:
//                                                           lightSecondaryColor,
//                                                     ),
//                                                   //Middy 7up
//                                                   if (customizeOption3 == true)
//                                                     CheckboxListTile(
//                                                       checkboxShape:
//                                                           RoundedRectangleBorder(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           6)),
//                                                       secondary: Image.asset(
//                                                           "assets/images/custom33.png"),
//                                                       value: checkValue33,
//                                                       onChanged: (v) {
//                                                         setState(() {
//                                                           checkValue33 = v!;
//                                                           print(checkValue33);
//                                                         });
//                                                       },
//                                                       title: const Text(
//                                                         "Middy 7up",
//                                                         style: TextStyle(
//                                                             fontSize: 16,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .w600),
//                                                       ),
//                                                       subtitle: const Text(
//                                                         "Extra ( + 5 E£ )",
//                                                         style: TextStyle(
//                                                             fontSize: 12),
//                                                       ),
//                                                       activeColor:
//                                                           lightSecondaryColor,
//                                                     ),
//                                                   //Cheesy Crinkles
//                                                   if (customizeOption3 == true)
//                                                     CheckboxListTile(
//                                                       checkboxShape:
//                                                           RoundedRectangleBorder(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           6)),
//                                                       secondary: Image.asset(
//                                                           "assets/images/custom34.png"),
//                                                       value: checkValue34,
//                                                       onChanged: (v) {
//                                                         setState(() {
//                                                           checkValue34 = v!;
//                                                           print(checkValue34);
//                                                         });
//                                                       },
//                                                       title: const Text(
//                                                         "Middy Mirinda",
//                                                         style: TextStyle(
//                                                             fontSize: 16,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .w600),
//                                                       ),
//                                                       subtitle: const Text(
//                                                         "Extra ( + 5 E£ )",
//                                                         style: TextStyle(
//                                                             fontSize: 12),
//                                                       ),
//                                                       activeColor:
//                                                           lightSecondaryColor,
//                                                     ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     //footer
//                     Align(
//                       alignment: Alignment.bottomCenter,
//                       child: Container(
//                         height: 109,
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(30.0),
//                             topRight: Radius.circular(30.0),
//                           ),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               CustomIconButton(
//                                 height: 50,
//                                 width: 50,
//                                 allowShadow: true,
//                                 color: Colors.white,
//                                 iconColor: Colors.grey,
//                                 iconPath: "assets/icons/heart.svg",
//                                 onTap: () {},
//                               ),
//                               // const SizedBox(
//                               //   width: 20,
//                               // ),
//                               AddToCartButton(
//                                 onPressed: () {
//                                   getData.gustID != null
//                                       ? showDialog(
//                                           context: context,
//                                           builder: (BuildContext context) {
//                                             return GustAlert(context);
//                                           })
//                                       : showDialog(
//                                           context: context,
//                                           builder: (BuildContext context) {
//                                             //==========================> dialog here
//                                             return AddItemToCart(
//                                                 context, widget.pickType);
//                                           });
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

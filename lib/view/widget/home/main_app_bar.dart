// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, unused_local_variable
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/cubit/drive/cubit.dart';
import 'package:the_drive/controller/cubit/drive/states.dart';
import 'package:the_drive/controller/localization_controller.dart';

import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/view/widget/custom/custom_paint.dart';

class MainAppBar extends StatefulWidget {
  final Widget? centerWidget;
  final Widget? leadingWidget;
  final Widget? trillingWidget;
  final double? spaceFromCenterTop;
  final bool canNavigate;
  bool? isNavigateFromCart;

  MainAppBar({
    Key? key,
    this.centerWidget,
    this.leadingWidget,
    this.trillingWidget,
    this.spaceFromCenterTop,
    this.canNavigate = false,
    this.isNavigateFromCart,
  }) : super(key: key);

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomPaint(
            size: Size(width, (width * 0.4582677847060769).toDouble()),
            painter: RPSCustomPainter(),
          ),
          Positioned(
            left: 15,
            right: 15,
            // top: 30,
            child: SafeArea(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // back arrow or drawer icon
                  if (widget.canNavigate)
                    Align(
                      alignment: Get.find<LocalizationController>().isLtr
                          ? Alignment.bottomLeft
                          : Alignment.bottomRight,
                      heightFactor: 2.5,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                          // isNavigateFromCart == false ? context.router.pop() : context.router.replace(HomeRoute());
                        },
                        child: RotatedBox(
                          quarterTurns:
                              Get.find<LocalizationController>().isLtr ? 0 : -2,
                          child: SvgPicture.asset(
                            "assets/icons/back.svg",
                          ),
                        ),
                      ),
                    )
                  else
                    Align(
                      alignment: Get.find<LocalizationController>().isLtr
                          ? Alignment.bottomLeft
                          : Alignment.bottomRight,
                      heightFactor: 1.7,
                      child: widget.leadingWidget ?? const SizedBox(),
                    ),
                  Positioned(
                    top: 25,
                    right: 0,
                    left: 0,
                    child: Align(
                      // alignment: Alignment.center,
                      child: widget.centerWidget ?? const SizedBox(),
                    ),
                  ),
                  //trilling widget
                  Positioned(
                    right: Get.find<LocalizationController>().isLtr
                        ? null
                        : MediaQuery.of(context).size.width * .78,
                    left: Get.find<LocalizationController>().isLtr
                        ? MediaQuery.of(context).size.width * .87
                        : null,
                    top: 29,
                    child: widget.trillingWidget ?? const SizedBox(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

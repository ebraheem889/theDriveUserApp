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
  late LocalizationController _localizationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _localizationController = Get.find<LocalizationController>();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height,
      width: context.width,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomPaint(
            size: Size(
                context.width, (context.width * 0.4582677847060769).toDouble()),
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
                      alignment: localNotifair.value == "en"
                          ? Alignment.bottomLeft
                          : Alignment.bottomRight,
                      heightFactor: 2.5,
                      child: GestureDetector(
                        onTap: () {
                          context.router.pop();
                          // isNavigateFromCart == false ? context.router.pop() : context.router.replace(HomeRoute());
                        },
                        child: RotatedBox(
                          quarterTurns: _localizationController.isLtr ? 0 : -2,
                          child: SvgPicture.asset(
                            "assets/icons/back.svg",
                          ),
                        ),
                      ),
                    )
                  else
                    Align(
                      alignment: _localizationController.isLtr
                          ? Alignment.bottomLeft
                          : Alignment.bottomRight,
                      heightFactor: 1.7,
                      child: widget.leadingWidget ?? const SizedBox(),
                    ),
                  Positioned(
                    top: widget.spaceFromCenterTop ?? 0,
                    right: 0,
                    left: 0,
                    child: Align(
                      // alignment: Alignment.center,
                      child: widget.centerWidget ?? const SizedBox(),
                    ),
                  ),
                  //trilling widget
                  Positioned(
                    right:
                        _localizationController.isLtr ? 0 : context.width * .70,
                    top: 20,
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

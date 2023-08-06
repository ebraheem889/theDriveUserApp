import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/view/base/base_loader.dart';
import 'package:the_drive/view/base/categrois_list.dart';
import 'package:the_drive/view/screen/pickType/widget/category_items_loader.dart';
import 'package:the_drive/view/widget/custom/custom_title.dart';
import 'package:the_drive/view/widget/home/main_app_bar.dart';

class PickUpScreenLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Container(
                width: context.width,
                height: context.height,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child:
                    Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: CustomTitle(
                              title: "pickupHeader".tr,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          AppLoader(
                              loaderView: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(3, (index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 4,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                          )),
                          SizedBox(
                            height: 20,
                          ),
                          CategoryItemsLoader()
                        ],
                      ),
                    ),
                  )
                ]))),
        MainAppBar(
          isNavigateFromCart: true,
          trillingWidget: InkWell(
            onTap: () {
              // navigatTo(
              //     context,
              //     CartScreen(
              //       pickType: 3,
              //     ));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: SvgPicture.asset(
                "assets/icons/cart.svg",
              ),
            ),
          ),
          canNavigate: true,
          spaceFromCenterTop: 15,
          centerWidget: Image.asset(
            "assets/images/brgr.png",
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

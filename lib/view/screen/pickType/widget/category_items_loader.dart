import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/view/base/base_loader.dart';
import 'package:the_drive/view/base/categrois_list.dart';

class CategoryItemsLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLoader(
      loaderView: Container(
        width: context.width,
        height: context.height,
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: const CategoriesList()),
              Container(
                width: double.infinity,
                height: context.height / 1.2,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 5,
                    primary: true,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 3, vertical: 3),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(35),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(6, 8),
                                  blurRadius: 20,
                                  color: Colors.black.withOpacity(0.08),
                                ),
                              ],
                            ),
                          ));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

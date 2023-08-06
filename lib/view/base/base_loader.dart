import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:the_drive/controller/services/const/colors.dart';

class AppLoader extends StatelessWidget {
  Widget loaderView;

  AppLoader({required this.loaderView});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: greyColor.withOpacity(0.5),
        highlightColor: Colors.grey.withOpacity(0.4),
        enabled: true,
        child: loaderView);
  }
}

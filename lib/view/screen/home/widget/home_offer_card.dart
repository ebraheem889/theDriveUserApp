import 'package:flutter/material.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:the_drive/util/styles.dart';
import 'package:the_drive/view/widget/custom/custom_title.dart';

class HomeOfferCard extends StatelessWidget {
  final double? height;
  final String title;
  final String image;
  final String logo;
  final String? offer;
  final Color color;
  final String productName;
  final String price;
  final bool? isOffer;

  const HomeOfferCard({
    Key? key,
    this.height,
    required this.title,
    required this.image,
    required this.logo,
    this.offer,
    this.isOffer,
    required this.color,
    required this.productName,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          color: Colors.transparent,
          foregroundDecoration: isOffer == true
              ? RotatedCornerDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF06BFB6),
                      Color(0xFF5B5388),
                    ],
                  ),
                  geometry: const BadgeGeometry(width: 60, height: 60),
                  textSpan: TextSpan(
                    text: '$offer',
                    style: const TextStyle(
                      fontSize: 14,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : null,
          child: Container(
            height: height ?? 250,
            decoration: BoxDecoration(
              color: color,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomTitle(
                    title: title,
                    fontSize: 13,
                    titleColor: Colors.white,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      image,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          logo,
                          height: 40,
                          width: 40,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 100,
                          child: Text(productName,
                              style: arabicmaincairoRegular.copyWith(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  overflow: TextOverflow.ellipsis)),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        CustomTitle(
                          title: "E£ $price",
                          fontSize: 14,
                          titleColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

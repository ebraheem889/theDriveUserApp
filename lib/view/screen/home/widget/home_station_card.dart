import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/services/const/colors.dart';

class HomeStationCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final GestureTapCallback? tap;

  const HomeStationCard(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.tap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Offset distance = const Offset(1, 10);
    double blur = 5.0;
    return GestureDetector(
      onTap: tap,
      child: SizedBox(
        width: context.width / 5.21,
        height: context.height / 6,
        child: Column(
          children: [
            Container(
              height: 78,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: const Color(0xFFF9F9F9),
                gradient: const LinearGradient(colors: [
                  Color(0xFFffffff),
                  Color(0xFFe0e0e0),
                ]),
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: [
                  BoxShadow(
                    offset: -distance,
                    blurRadius: blur,
                    color: Colors.transparent,
                    // offset: true,
                  ),
                  BoxShadow(
                    offset: distance,
                    blurRadius: blur,
                    color: Colors.grey.withOpacity(0.5),
                    // inset: true,
                  ),
                  BoxShadow(
                    offset: -const Offset(0, 3),
                    blurRadius: blur,
                    color: Colors.grey.withOpacity(0.3),
                    // inset: false,
                  ),
                  BoxShadow(
                    offset: distance,
                    blurRadius: blur,
                    color: Colors.grey.withOpacity(0.4),
                    // inset: false,
                  ),
                ],
              ),
              child: Image.asset(imagePath),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: Text(
                title,
                style: const TextStyle(
                    color: lightSecondaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}

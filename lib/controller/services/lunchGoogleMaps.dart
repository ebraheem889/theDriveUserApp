// ignore_for_file: file_names, deprecated_member_use

import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();

  static Future<void> openMap() async {
    String googleUrl = "https://maps.app.goo.gl/BBGdFuX1hV4N2zPr7";
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}

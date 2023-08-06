import 'package:get/get.dart';
import 'package:the_drive/data/api/api_client.dart';
import 'package:the_drive/data/repository/check_in_repo.dart';

class CheckInController extends GetxController {
  late CheckInRepo _checkInRepo;

  CheckInController({required CheckInRepo checkInRepo}) {
    this._checkInRepo = checkInRepo;
  }

  void pay() {}
}

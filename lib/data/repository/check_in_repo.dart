import 'package:the_drive/data/api/api_client.dart';

class CheckInRepo {
  late ApiClient _apiClient;

  CheckInRepo({required ApiClient apiClient}) {
    this._apiClient = apiClient;
  }
}

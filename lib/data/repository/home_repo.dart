import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_drive/data/api/api_client.dart';

class HomeRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  HomeRepo({required this.apiClient, required this.sharedPreferences});
}

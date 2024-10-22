import 'package:tradefolioo/models/response_data.dart';
import 'package:tradefolioo/services/api/api_services.dart';

class AuthResponses {
  static Future<ResponseData> register(Map<String, dynamic> data) async {
    try {
      final response = await ApiServices.post(ApiServices.register, data);
      return response;
    } catch (e) {
      return ResponseData(data: null, message: e.toString(), success: false);
    }
  }

  static Future<ResponseData> login(Map<String, dynamic> data) async {
    try {
      final response = await ApiServices.post(ApiServices.login, data);
      return response;
    } catch (e) {
      return ResponseData(data: null, message: e.toString(), success: false);
    }
  }
}

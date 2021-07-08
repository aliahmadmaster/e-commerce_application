import 'package:dio/dio.dart';
import 'package:ecommerce_user/constants/end_points.dart';
import 'package:ecommerce_user/models/user_model.dart';
import 'package:ecommerce_user/services/services_client.dart';

class UserServices {
  ServiceClient _client = ServiceClient();

  Future<UserModel> getUserDetail() async {
    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYwZDQ2ODA3NDI5NDJmMTQxODk5ZWEzNCIsImlhdCI6MTYyNDUzMzUzMH0.rSeyWYNbSAIYP_TjHMSeMce5vLWaFHzMMxK50DxzhLU';
    try {
      final response = await _client.get(
        '${Endpoints.users}/detail',
        options: Options(headers: {"x-access-token": "bearer $token"}),
      );
      print(response.data);
      final results = Map<String, dynamic>.from(response.data['data']);
      UserModel userDetails = UserModel.fromMap(results);
      return userDetails;
    } catch (e) {
      throw e;
    }
  }
}

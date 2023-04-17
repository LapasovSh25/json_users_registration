




import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:offline_comment/core/base_urls/end_points.dart';
import 'package:offline_comment/core/config/dio_catch_error.dart';

import '../core/config/dio_config.dart';

class UserService {
  Future<dynamic> getUserInfo() async {
    try {
      await Hive.openBox("access_token");
      String accessToken = await Hive.box("access_token").get("access_token");
      await Hive.box("access_token").close();
      Response response = await DioConfig.createRequest().get(
          EndPoints.getUserInfo,
          options: Options(headers: {"Authorization": "Bearer $accessToken"}));
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return DioCatchError.catchError(e);
    }
  }
}
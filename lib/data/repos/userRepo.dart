import 'package:easyrent/core/services/api/api_consumer.dart';
import 'package:easyrent/core/services/api/end_points.dart';
import 'package:easyrent/core/services/errors/exceptions.dart';
import 'package:easyrent/main.dart';
import 'package:flutter/material.dart';

class Userrepo {
  late final ApiConsumer api;
  TextEditingController controller = TextEditingController();

  login(number, password) {
    try {
      api.post(
        EndPoints.Login,
        data: {ApiKey.email: controller.text, ApiKey.password: controller.text},
      );
      debug.e("II LOGIN");
// !User user = User.fromJson(responseData);
//how to call it 

//user.userName
// user.profileImage
// user.token

    } on ServerException {
      rethrow;
    }
  }

  register(number) {}

  logout() {}

  getUserProfile(id) {}
}

import 'package:easyrent/core/services/api/api_consumer.dart';
import 'package:easyrent/core/services/api/end_points.dart';
import 'package:easyrent/core/services/errors/exceptions.dart';
import 'package:flutter/material.dart';

class Exampleofcallingrequest {
  late final ApiConsumer api;
  TextEditingController controller = TextEditingController();

  signInRequest() {
    try {
      api.post(
        EndPoints.Login, 
        data: {
          ApiKey.email: controller.text, 
          ApiKey.password: controller.text
        },
      );

    } on ServerException {
      rethrow;
    }
  }
}

import 'package:dio/dio.dart';
import 'package:easyrent/core/services/api/dio_consumer.dart';
import 'package:easyrent/core/services/api/errors/exceptions.dart';
import 'package:easyrent/data/models/property_model.dart';
import 'package:easyrent/main.dart';

class PropertiesRepo {
  static Future<List<PropertyModel>> getProperties() async {
    final api = DioConsumer(Dio()); //TODO not like this call the dio
    try {
      final response = await api
          .get("https://run.mocky.io/v3/558f5f70-0536-43e2-b897-3c01312e74cf");
      //todo add the endpoint of the API
      if (response.statusCode == 200) {
        debug.i("Status Code is ${response.statusCode} ");
        var responseData = response.data;
        List tempList = [];
        for (var v in responseData) {
          debug.e(v);
          tempList.add(v);
        }
        return PropertyModel.propertiesFromSnapshot(tempList);
      }
      return [];
    } on ServerException catch (e) {
      debug.e("Exception $e");
      return [];
    }
  }

  const PropertiesRepo();
}

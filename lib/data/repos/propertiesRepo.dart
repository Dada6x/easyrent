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
          .get("https://run.mocky.io/v3/fa9cfba5-611c-4fbe-91c4-eb1f90e5fd8f");
      //todo add the endpoint of the API
      if (response.statusCode == 200) {
        debug.i("Fetch Properties status code  ${response.statusCode} ");
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

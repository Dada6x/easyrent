  import 'package:easyrent/main.dart';
  import 'package:get/get.dart';
  import 'package:easyrent/data/models/property_model.dart';
  import 'package:easyrent/data/repos/propertiesRepo.dart';

  // chatgpt done this i was worinkg singletone
  class PropertiesController extends GetxController {
    var properties = <PropertyModel>[].obs;
    var isLoading = true.obs;
    var hasError = false.obs;

    @override
    void onInit() {
      super.onInit();
      debug.w("Fetching Data in the GETX Controller ");

      fetchProperties();
    }

    Future<void> fetchProperties() async {
      try {
        isLoading(true);
        hasError(false);
        final result = await PropertiesRepo.getProperties();
        properties.assignAll(result);
      } catch (e) {
        hasError(true);
      } finally {
        isLoading(false);
      }
    }

    Future<void> refreshProperties() async {
      await fetchProperties();
    }
//! how to Pagination 



    
  }

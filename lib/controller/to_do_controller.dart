import 'package:get/get.dart';
import 'package:young_innovation/model/album_model.dart';
import 'package:young_innovation/model/to_do_model.dart';
import 'package:young_innovation/service/remote_service.dart';

class ToDoController extends GetxController {
  var toDO = <ToDoModel>[].obs;
  var processing = true.obs;

  Future getToDO(int id) async {
    try {
      processing(true);
      var data = await RemoteService.fetchToDO(id);
      if (data != null) {
        toDO.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      processing(false);
    }
  }
}

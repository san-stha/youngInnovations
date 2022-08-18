import 'package:get/get.dart';
import 'package:young_innovation/model/photo_model.dart';
import 'package:young_innovation/service/remote_service.dart';

class PhotoController extends GetxController {
  var photo = <PhotoModel>[].obs;
  var processing = true.obs;

  Future getPhoto(int id) async {
    try {
      processing(true);
      var data = await RemoteService.fetchPhoto(id);
      if (data != null) {
        photo.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally{
      processing(false);
    }
  }
}

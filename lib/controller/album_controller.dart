import 'package:get/get.dart';
import 'package:young_innovation/model/album_model.dart';
import 'package:young_innovation/service/remote_service.dart';

class AlbumController extends GetxController {
  var album = <AlbumModel>[].obs;
  var processing = true.obs;

  Future getAlbum(int id) async {
    try {
      processing(true);
      var data = await RemoteService.fetchAlbum(id);
      if (data != null) {
        album.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      processing(false);
    }
  }
}

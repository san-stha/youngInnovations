import 'package:get/get.dart';
import 'package:young_innovation/model/album_model.dart';
import 'package:young_innovation/model/post_model.dart';
import 'package:young_innovation/service/remote_service.dart';

class PostController extends GetxController {
  var post = <PostModel>[].obs;
  var processing = true.obs;

  Future getPost(int id) async {
    try {
      processing(true);
      var data = await RemoteService.fetchPost(id);
      if (data != null) {
        post.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      processing(false);
    }
  }
}

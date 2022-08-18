import 'package:get/get.dart';
import 'package:young_innovation/model/comment_model.dart';
import 'package:young_innovation/service/remote_service.dart';

class CommentController extends GetxController {
  var comment = <CommentModel>[].obs;
  var processing = true.obs;

  Future getComment(int id) async {
    try {
      processing(true);
      var data = await RemoteService.fetchComment(id);
      if (data != null) {
        comment.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      processing(false);
    }
  }
}

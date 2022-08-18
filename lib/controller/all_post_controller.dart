import 'package:get/get.dart';
import 'package:young_innovation/model/all_post_model.dart';
import 'package:young_innovation/service/remote_service.dart';

class AllPostController extends GetxController {
  var allPost = <AllPostModel>[].obs;
  var processing = true.obs;

  Future getAllPost() async {
    try {
      processing(true);
      var data = await RemoteService.fetchAllPost();
      if (data != null) {
        allPost.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      processing(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllPost();
  }
}

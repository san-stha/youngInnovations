import 'package:get/get.dart';
import 'package:young_innovation/model/all_user_model.dart';
import 'package:young_innovation/service/remote_service.dart';

class AllUserController extends GetxController {
  var allUser = <AllUserModel>[].obs;
  var processing = true.obs;

  Future getAllUser() async {
    try {
      processing(true);
      var data = await RemoteService.fetchAllUser();
      if (data != null) {
        allUser.value = data;
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
    getAllUser();
  }
}

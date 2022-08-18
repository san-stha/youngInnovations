import 'package:get/get.dart';
import 'package:young_innovation/controller/album_controller.dart';
import 'package:young_innovation/controller/all_post_controller.dart';
import 'package:young_innovation/controller/all_user_controller.dart';
import 'package:young_innovation/controller/photo_controller.dart';
import 'package:young_innovation/controller/post_controller.dart';
import 'package:young_innovation/controller/comment_controller.dart';
import 'package:young_innovation/controller/to_do_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AllPostController());
    Get.put(CommentController());
    Get.put(AllUserController());
    Get.put(AlbumController());
    Get.put(PostController());
    Get.put(ToDoController());
    Get.put(PhotoController());
  }
}

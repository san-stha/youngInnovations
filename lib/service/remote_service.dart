import 'dart:convert';

import 'package:get/get.dart';
import 'package:young_innovation/components/error_snackbar.dart';
import 'package:young_innovation/components/success_snackbar.dart';
import 'package:young_innovation/model/album_model.dart';
import 'package:young_innovation/model/all_post_model.dart';
import 'package:http/http.dart' as http;
import 'package:young_innovation/model/all_user_model.dart';
import 'package:young_innovation/model/photo_model.dart';
import 'package:young_innovation/model/comment_model.dart';
import 'package:young_innovation/model/post_model.dart';
import 'package:young_innovation/model/to_do_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteService {
  static var client = http.Client();
  static var baseURL = "https://jsonplaceholder.typicode.com/";

  static Future<List<AllPostModel>?> fetchAllPost() async {
    try {
      // String url = baseURL + endPoint;
      var response = await client.get(
        Uri.parse(baseURL + "posts"),
        // headers: {"Accept": "application/json"}
      );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return allPostModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  static Future<List<CommentModel>?> fetchComment(int id) async {
    try {
      // String url = baseURL + endPoint;
      var response = await client.get(
        Uri.parse(baseURL + "posts/$id/comments"),
      );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return commentModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  static Future<List<AllUserModel>?> fetchAllUser() async {
    try {
      // String url = baseURL + endPoint;
      var response = await client.get(
        Uri.parse("${baseURL}users"),
        // headers: {"Accept": "application/json"}
      );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return allUserModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  static Future<List<AlbumModel>?> fetchAlbum(int id) async {
    try {
      var response = await client.get(
        Uri.parse("${baseURL}users/$id/albums"),
      );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return albumModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  static Future<List<PostModel>?> fetchPost(int id) async {
    try {
      var response = await client.get(
        Uri.parse("${baseURL}users/$id/posts"),
      );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return postModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  static Future<List<ToDoModel>?> fetchToDO(int id) async {
    try {
      var response = await client.get(
        Uri.parse("${baseURL}users/$id/todos"),
      );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return toDoModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  static Future<List<PhotoModel>?> fetchPhoto(int id) async {
    try {
      var response = await client.get(
        Uri.parse("${baseURL}albums/1/photos"),
      );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return photoModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // posting data
  static Future postData(String endPoint, Map data) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var token = preferences.getString("token");
      // "$baseURL"
      var response = await client.post(Uri.parse(baseURL + endPoint),
          headers: {
            'Content-type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));
      print(response.body);
      if (response.statusCode == 201) {
        var result = json.decode(response.body);
        successSnackbar("${response.body} \n added successfully!");
      } else {
        errorSnackbar("Please add essential details!");
        // Get.snackbar("Message", "error");
      }
    } catch (e) {
      Get.snackbar("Message", e.toString());
    }
  }

  // deleting data
  static Future deleteData(String endPoint) async {
    try {
      var response =
          await client.delete(Uri.parse(baseURL + endPoint), headers: {
        'Content-type': 'application/json',
        'accept': 'application/json',
      });
      if (response.statusCode == 201 || response.statusCode == 200) {
        var result = json.decode(response.body);
        successSnackbar("${response.body} deleted succesfully!");
      } else {
        errorSnackbar("delete unsucessful!");
      }
    } catch (e) {
      Get.snackbar("Message", e.toString());
    }
  }
}

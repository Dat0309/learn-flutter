import 'package:get/get.dart';
import 'package:task_managerment/db/db_helper.dart';
import 'package:task_managerment/models/task.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }
}

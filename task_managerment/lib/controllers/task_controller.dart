import 'package:get/get.dart';
import 'package:task_managerment/db/db_helper.dart';
import 'package:task_managerment/models/task.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }

  void getTask() async {
    List<Map<String, dynamic?>>? tasks = await DBHelper.query();
    taskList.assignAll(tasks!.map((e) => new Task.fromJson(e)).toList());
  }
}

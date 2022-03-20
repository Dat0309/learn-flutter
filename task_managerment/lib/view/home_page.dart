import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:task_managerment/controllers/task_controller.dart';
import 'package:task_managerment/service/notification_services.dart';
import 'package:task_managerment/service/theme_service.dart';
import 'package:task_managerment/theme/theme.dart';
import 'package:task_managerment/view/widgets/add_task_bar.dart';
import 'package:task_managerment/view/widgets/app_bar.dart';
import 'package:task_managerment/view/widgets/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());
  var notifyHelper;

  @override
  void initState() {
    super.initState();
    notifyHelper = NotifiHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
          _showTask(),
        ],
      ),
    );
  }

  _showTask() {
    return Expanded(
      child: Obx(
        () {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _taskController.taskList.length,
              itemBuilder: (_, context) {
                print(_taskController.taskList.length);
                return Container(
                  width: 100,
                  height: 50,
                  color: Colors.green,
                  margin: EdgeInsets.only(bottom: 10),
                );
              });
        },
      ),
    );
  }

  _addDateBar() {
    return Container(
      child: Container(
        margin: const EdgeInsets.only(top: 20, left: 20),
        child: DatePicker(
          DateTime.now(),
          height: 100,
          width: 80,
          initialSelectedDate: DateTime.now(),
          selectionColor: primaryClr,
          selectedTextColor: Colors.white,
          dateTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          dayTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          monthTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          onDateChange: (date) {
            _selectedDate = date;
          },
        ),
      ),
    );
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: subHeadingStyle,
                ),
                Text(
                  "Today",
                  style: headingStyle,
                ),
              ],
            ),
          ),
          MyButton(
            label: "+ Add Task",
            onTap: () => {
              Get.to(AddTaskPage()),
            },
          ),
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: !Get.isDarkMode ? Color(0xff424242) : Colors.white,
      leading: GestureDetector(
        onTap: () {
          setState(() {
            ThemeService().switchTheme();
            notifyHelper.displayNotification(
              title: "Theme Changed",
              body: Get.isDarkMode
                  ? "Activated Light Theme"
                  : "Activated Dark Theme",
            );
            notifyHelper.scheduledNotification();
          });
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
          size: 20,
          color: Get.isDarkMode ? Colors.black : Colors.white,
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage(
            'assets/images/dat.jpg',
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}

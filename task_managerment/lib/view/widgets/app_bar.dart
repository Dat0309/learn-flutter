import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_managerment/service/theme_service.dart';

appBar(var notifyHelper) {
  return AppBar(
    elevation: 0,
    backgroundColor: Get.isDarkMode ? Color(0xff424242) : Colors.white,
    leading: GestureDetector(
      onTap: () {
        ThemeService().switchTheme();
        notifyHelper.displayNotification(
          title: "Theme Changed",
          body:
              Get.isDarkMode ? "Activated Light Theme" : "Activated Dark Theme",
        );
        notifyHelper.scheduledNotification();
      },
      child: Icon(
        Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
        size: 20,
        color: Get.isDarkMode ? Colors.white : Colors.black,
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

import 'package:konekseed_test/feature/target/presentation/view/notification_view.dart';
import 'package:konekseed_test/feature/auth/presentation/view/profile_view.dart';
import 'package:konekseed_test/feature/target/presentation/view/setting_view.dart';
import 'package:konekseed_test/feature/target/presentation/view/target_view.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

getFromGallery(ImagePicker imagePicker) async {
  final pickedFile = await imagePicker.pickImage(
    source: ImageSource.gallery,
    maxWidth: 1800,
    maxHeight: 1800,
  );
  if (pickedFile != null) {
    return File(pickedFile.path);
  }
}

getFromCamera(ImagePicker imagePicker) async {
  final pickedFile = await imagePicker.pickImage(
    source: ImageSource.camera,
    maxWidth: 1800,
    maxHeight: 1800,
  );
  if (pickedFile != null) {
    return File(pickedFile.path);
  }
}

void showSnackBarAlert(BuildContext context, String text) =>
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(text),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );

SnackBar showSnackBarWithoutContextRed(String text) => SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
    );

SnackBar showSnackBarWithoutContextGreen(String text) => SnackBar(
      content: Text(text),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
    );

var decoration = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(width: 0.5, color: Colors.black),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(width: 0.5, color: Colors.black),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(width: 0.5, color: Colors.red),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(width: 0.5, color: Colors.red),
  ),
);

const viewList = [
  TargetView(),
  NotificationView(),
  SettingView(),
  ProfileView(),
];

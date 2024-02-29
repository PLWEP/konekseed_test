import 'package:konekseed_test/presentation/view/notification_view.dart';
import 'package:konekseed_test/presentation/view/profile_view.dart';
import 'package:konekseed_test/presentation/view/setting_view.dart';
import 'package:konekseed_test/presentation/view/target_view.dart';
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

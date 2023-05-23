import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';

import '../widgets/alertBox.dart';

Future<bool> checkPermission(Permission permission) async {
  log("permission:" + permission.toString());
  PermissionStatus status = await permission.request();
  log("status: $status");
  if (status.isGranted) {
    return true;
  }
  if (status.isPermanentlyDenied || status.isDenied) {
    showAlertBox("Permission Required!",
        "You need to allow permission for a better experience.", () {
      openAppSettings();
    }, cancelText: "Close", confirmText: "Open Setting");
  }
  return false;
}

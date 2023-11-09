import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medcab_task/src/business_layer/util/helper/device_info_helper.dart';
import 'package:medcab_task/src/business_layer/util/helper/flavor_configuration_helper.dart';
import 'package:medcab_task/src/data_layer/local_db/hive_database_helper.dart';
import 'package:medcab_task/src/my_app.dart';

import 'src/data_layer/res/styles.dart';

Future<void> main() async {
  /// Initialize the WidgetFlutterBinding if required
  WidgetsFlutterBinding.ensureInitialized();

  /// Sets the status bar color of the widget
  AppStyles.setStatusBarTheme();

  /// Sets Device info
  DeviceInfo.setDeviceId();

  /// Ensuring Size of the phone in UI Design
  await ScreenUtil.ensureScreenSize();

  /// Initialize Hive DB and register adapters and generate encryption key
  await HiveDatabaseHelper.instance.initializeHiveAndRegisterAdapters();

  /// Sets the device orientation of the application
  AppStyles.setDeviceOrientationOfApp();

  /// Sets the server configuration of the application
  FlavorConfig.setServerConfig();

  /// Run the application
  runApp(const MyApp());
}

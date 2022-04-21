import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ultimate_space_x_app/manager/notification_manager.dart';
import 'package:ultimate_space_x_app/repository/get_it.dart';
import 'app/app.dart';
import 'manager/database_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  setupGetIt();
  getItLocator<NotificationManager>().init();
  getItLocator<DatabaseManager>().init();
  runApp(const App());
}

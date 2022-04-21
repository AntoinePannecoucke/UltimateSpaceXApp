
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SettingsViewModel {
  late bool dailyNotificationEnable;
  late bool timerNotificationEnable;
  late SharedPreferences prefs;
  // Obtain shared preferences.
  Future<bool> init() async {
    // Obtain shared preferences.
    prefs = await SharedPreferences.getInstance();
    dailyNotificationEnable = prefs.getBool("dailyNotificationEnable") ?? true;
    timerNotificationEnable = prefs.getBool("timerNotificationEnable") ?? true;

    await prefs.setBool("dailyNotificationEnable", dailyNotificationEnable);
    await prefs.setBool("timerNotificationEnable", timerNotificationEnable);

    return true;
  }

  toggleDaily() async {
    dailyNotificationEnable = !dailyNotificationEnable;
    await prefs.setBool("dailyNotificationEnable", dailyNotificationEnable);
  }

  toggleTimer() async {
    timerNotificationEnable = !timerNotificationEnable;
    await prefs.setBool("timerNotificationEnable", timerNotificationEnable);
  }
}

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SettingsViewModel {
  // Obtain shared preferences.
  init() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
  }
}
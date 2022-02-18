import 'package:flutter/cupertino.dart';
import 'package:ultimate_space_x_app/manager/launches_manager.dart';
import 'package:ultimate_space_x_app/model/launch.dart';
import 'package:ultimate_space_x_app/repository/get_it.dart';

class HomeViewModel extends ChangeNotifier {
  List<Launch> launches = [];

  HomeViewModel() {
    loadLaunches();
  }

  loadLaunches() async{
    launches = (await getItLocator<LaunchesManager>().getUpcomingLaunches())!;
    notifyListeners();
  }
}
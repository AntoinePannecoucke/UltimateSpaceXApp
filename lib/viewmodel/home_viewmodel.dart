import 'package:flutter/cupertino.dart';
import 'package:ultimate_space_x_app/manager/launches_manager.dart';
import 'package:ultimate_space_x_app/model/launch.dart';
import 'package:ultimate_space_x_app/repository/get_it.dart';

class HomeViewModel extends ChangeNotifier {
  List<Launch> upcomingLaunches = [];
  List<Launch> launches = [];
  int currentIndex = 0;
  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  PageController pageController = PageController();

  HomeViewModel() {
    loadUpcomingLaunches();
  }

  loadUpcomingLaunches() async{
    upcomingLaunches = (await getItLocator<LaunchesManager>().getUpcomingLaunches())!;
    notifyListeners();
  }

  loadLaunches() async {
    launches = (await getItLocator<LaunchesManager>().getLaunches())!;
    notifyListeners();
  }
}
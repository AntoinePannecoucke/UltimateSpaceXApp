import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:ultimate_space_x_app/manager/notification_manager.dart';
import 'package:ultimate_space_x_app/model/launch.dart';
import 'package:ultimate_space_x_app/repository/get_it.dart';

import '../manager/data_manager.dart';

@injectable
class HomeViewModel extends ChangeNotifier {
  List<Launch> upcomingLaunches = [];
  List<Launch> launches = [];
  Set<Marker> markers = {};


  int currentIndex = 0;
  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  PageController pageController = PageController();

  Future<bool> load() async {
    upcomingLaunches = (await getItLocator<DataManager>().getUpcomingLaunches())!;
    launches = (await getItLocator<DataManager>().getLaunches())!;
    await getItLocator<DataManager>().loadFavorites();
    var launchpads = await getItLocator<DataManager>().getLaunchpads();
    launchpads?.forEach((launchpad) {
      markers.add(Marker(position: LatLng(launchpad.latitude ?? 0, launchpad.longitude ?? 0), markerId: MarkerId(launchpad.id ?? "")));
    });
    startTimer();
    return true;
  }

  //#region Timer

  late Timer _timer;
  String timerText = "";

  void startTimer(){
    _timer = Timer.periodic(
        const Duration(seconds: 1),
            (Timer timer) {

          DateTime launchDate = DateTime.parse(upcomingLaunches.first.dateUTC ?? DateTime.now().toString());
          DateTime now = DateTime.now();
          if (now.millisecondsSinceEpoch == launchDate.millisecondsSinceEpoch){
            timer.cancel();
          }

          var difference = launchDate.difference(now);
          timerText = difference.timeLeft();
          if (difference.isItOClock()){
            getItLocator<NotificationManager>().send("Next launch in :", timerText);
          }
          notifyListeners();
        });
  }

  //#endregion
}

extension DurationExtension on Duration {
  String timeLeft() {
    return "$inDays days ${(inHours % 24).clockFormat()}:${(inMinutes % 60).clockFormat()}:${(inSeconds % 60).clockFormat()} left";
  }

  bool isItOClock() {
    return (inMinutes % 60) == 0 && (inSeconds % 60) == 0;
  }
}

extension IntExtension on int {
  String clockFormat() {
    return this < 10 ? "0$this" : "$this";
  }
}
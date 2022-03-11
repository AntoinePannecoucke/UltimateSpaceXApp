import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ultimate_space_x_app/model/launch.dart';
import 'package:ultimate_space_x_app/repository/get_it.dart';

import '../manager/data_manager.dart';

class HomeViewModel extends ChangeNotifier {
  List<Launch> upcomingLaunches = [];
  List<Launch> launches = [];
  Set<Marker> markers = Set();

  int currentIndex = 0;
  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  PageController pageController = PageController();

  Future<bool> load() async {
    upcomingLaunches = (await getItLocator<DataManager>().getUpcomingLaunches())!;
    launches = (await getItLocator<DataManager>().getLaunches())!;
    var launchpads = await getItLocator<DataManager>().getLaunchpads();
    launchpads?.forEach((launchpad) {
      markers.add(Marker(position: LatLng(launchpad.latitude ?? 0, launchpad.longitude ?? 0), markerId: MarkerId(launchpad.id ?? "")));
    });
    return true;
  }
}
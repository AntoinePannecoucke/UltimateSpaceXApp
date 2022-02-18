import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_space_x_app/model/launch.dart';

import '../component/image_placeholder.dart';
import '../component/launch_list.dart';
import '../viewmodel/home_viewmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(builder: (context, model, child){
        return Scaffold(
            appBar: AppBar(
              // Here we take the value from the HomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: const Text("SpaceX launches"),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    label: "Upcoming",
                    icon: Icon(Icons.upcoming_outlined),
                    activeIcon: Icon(
                      Icons.upcoming,
                      color: Colors.blue,
                    )),
                BottomNavigationBarItem(
                    label: "Previous",
                    icon: Icon(Icons.access_time),
                    activeIcon: Icon(
                      Icons.access_time_filled,
                      color: Colors.blue,
                    )),
                BottomNavigationBarItem(
                    label: "Map",
                    icon: Icon(Icons.map_outlined),
                    activeIcon: Icon(
                      Icons.map,
                      color: Colors.blue,
                    ))
              ],
              currentIndex: model.currentIndex,
              onTap: (newIndex) {
                model.setCurrentIndex(newIndex);
                switch(newIndex){
                  case 0:
                    model.loadUpcomingLaunches();
                    break;
                  case 1:
                    model.loadLaunches();
                    break;
                  case 2:
                    break;
                  default:
                    return;
                }
                model.pageController.animateToPage(newIndex, duration: const Duration(seconds: 1), curve: Curves.ease);
              },
            ),
          body: PageView(
            controller: model.pageController,
            children: [
              LaunchListView(launches: model.upcomingLaunches),
              LaunchListView(launches: model.launches),
              LaunchListView(launches: model.upcomingLaunches),
            ],
          )
        );
      }),
    );
  }

}

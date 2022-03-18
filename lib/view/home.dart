import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ultimate_space_x_app/manager/notification_manager.dart';
import 'package:ultimate_space_x_app/view/settings.dart';

import '../component/launch_list.dart';
import '../manager/data_manager.dart';
import '../model/launch.dart';
import '../repository/get_it.dart';
import '../viewmodel/home_viewmodel.dart';
import 'company.dart';
import 'favorite_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Completer<GoogleMapController> _controller = Completer();

    const CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(0, 0),
      zoom: 0,
    );

    return ChangeNotifierProvider(
      create: (context) => getItLocator<HomeViewModel>(),
      child: Consumer<HomeViewModel>(builder: (context, model, child){
        return Scaffold(
            appBar: AppBar(
              // Here we take the value from the HomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: const Text("SpaceX App"),
              titleTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue,
              actions: <Widget>[
                IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () async =>  {
                      await Navigator.of(context).pushNamed(FavoritePage.route)
                    }
                ),
                IconButton(onPressed: () async => {
                  await Navigator.of(context).pushNamed(CompanyPage.route)
                }, icon: const Icon(Icons.info_outline_rounded)
                ),
                IconButton(
                  icon: const Icon(Icons.settings_outlined),
                  onPressed: () async => {
                    await Navigator.of(context).pushNamed(SettingsPage.route)
                  }
                ),
              ],
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
                model.pageController.animateToPage(newIndex, duration: const Duration(seconds: 1), curve: Curves.ease);
              },
            ),
          body: FutureBuilder(
            future: model.load(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return PageView(
                  controller: model.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Stack(
                        children: [
                      Container(
                        margin: const EdgeInsets.only(top : 10, bottom: 10),
                        alignment: Alignment.topCenter,
                        child: Text(model.timerText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                        ),),
                      ),
                      Container(

                          margin: const EdgeInsets.only(top: 50),
                          child: LaunchListView(launches: model.upcomingLaunches, onToggleFavorite: (Launch launch, bool shouldToggle) {
                            if (shouldToggle) {
                              getItLocator<DataManager>().toggleFavorite(launch);
                            }
                            model.notifyListeners();
                          },)
                      ),
                    ]),
                    LaunchListView(launches: model.launches, onToggleFavorite: (Launch launch, bool shouldToggle) {
                      if (shouldToggle) {
                        getItLocator<DataManager>().toggleFavorite(launch);
                      }
                      model.notifyListeners();
                    },
                    ),
                    GoogleMap(
                      compassEnabled: true,
                      mapToolbarEnabled: true,
                      markers: model.markers,
                      mapType: MapType.hybrid,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ) ,
                  ],
                );
              }
              else {
                return const Center(child: CircularProgressIndicator(),);
              }
            })
          );
      }),
    );
  }

}

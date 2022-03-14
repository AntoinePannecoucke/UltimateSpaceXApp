import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../component/launch_list.dart';
import '../viewmodel/home_viewmodel.dart';
import 'company.dart';

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
      create: (context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(builder: (context, model, child){
        return Scaffold(
            appBar: AppBar(
              // Here we take the value from the HomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: const Text("SpaceX app"),
              titleTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue,
              actions: <Widget>[
                IconButton(onPressed: () async => {
                  await Navigator.of(context).pushNamed(CompanyPage.route)
                }, icon: const Icon(Icons.info_outline_rounded)
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
                    LaunchListView(launches: model.upcomingLaunches),
                    LaunchListView(launches: model.launches),
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_space_x_app/model/launch.dart';

import '../component/image_placeholder.dart';
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
              title: Text("SpaceX launches"),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    label: "Upcoming",
                    icon: Icon(Icons.access_time),
                    activeIcon: Icon(
                      Icons.access_time_filled,
                      color: Colors.blue,
                    )),
                BottomNavigationBarItem(
                    label: "Favoris",
                    icon: Icon(Icons.favorite_border),
                    activeIcon: Icon(
                      Icons.favorite,
                      color: Colors.blue,
                    ))
              ],
            ),
          body: ListView.builder(
        itemBuilder: (context, position) {
          Launch launch = model.launches[position];
          return InkWell(
            onTap: () async {
              //TODO: Favorite
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: 100,
                    height: 100,
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.network(
                        launch.links?.patch?.small ?? '',
                        fit: BoxFit.cover,
                        errorBuilder: (context, child, stack) {
                          return const ImagePlaceholder();
                        },
                      ),
                    )),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${launch.name}" ,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text("Launch date : ${launch.staticFireDateUTC ?? "Not defined"}")
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: model.launches.length,
        )
        );
      }),
    );
  }

}

import 'package:flutter/material.dart';
import 'package:ultimate_space_x_app/component/launch_list.dart';
import 'package:ultimate_space_x_app/repository/get_it.dart';
import 'package:ultimate_space_x_app/viewmodel/favorite_list_viewmodel.dart';

import '../model/launch.dart';

class FavoritePage extends StatefulWidget {

  static const route = "/favorites";

  FavoritePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FavoritePage();
}

class _FavoritePage extends State<FavoritePage>{
  final viewmodel = getItLocator<FavoriteListViewModel>();

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the HomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Favorites"),
          titleTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(onPressed: () => {},
              icon: const Icon(Icons.favorite_outlined),
              color: Colors.blue,
            ),
          ],
        ),
        body: FutureBuilder(
          future: viewmodel.load(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PageView(
                children: [
                  LaunchListView(launches: viewmodel.favorites, onToggleFavorite: (Launch launch, bool shouldToggle) async {
                    if (shouldToggle) {
                      await viewmodel.onToggleFavorite(launch);
                    }
                    setState(() {

                    });
                  },)
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        ));
  }



}
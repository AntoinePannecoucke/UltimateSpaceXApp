import 'package:flutter/material.dart';
import 'package:ultimate_space_x_app/component/launch_list.dart';
import 'package:ultimate_space_x_app/repository/get_it.dart';
import 'package:ultimate_space_x_app/viewmodel/favorite_list_viewmodel.dart';

import '../model/launch.dart';
import '../viewmodel/settings_viewmodel.dart';

class SettingsPage extends StatefulWidget {

  static const route = "/settings";

  SettingsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage>{
  final viewmodel = getItLocator<SettingsViewModel>();

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
          title: const Text("Settings"),
          titleTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
        ),
        body: FutureBuilder(
        future: viewmodel.init(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Daily notifications : "),
                          Switch(value: viewmodel.dailyNotificationEnable,
                              onChanged: (newValue) {
                            viewmodel.toggleDaily();
                                setState(() {

                                });
                              })
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Timer notifications : "),
                          Switch(value: viewmodel.timerNotificationEnable,
                              onChanged: (newValue) {
                                viewmodel.toggleTimer();
                                setState(() {

                                });
                              })
                        ],
                      )
                    ],
                  )
              );
            } else {
              return const Center(child: CircularProgressIndicator(),);
            }
          })
    );
  }



}
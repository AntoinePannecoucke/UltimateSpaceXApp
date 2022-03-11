import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ultimate_space_x_app/viewmodel/compagny_viewmodel.dart';

class CompagnyPage extends StatelessWidget {

  static const route = "/compagny";

  var viewmodel = CompagnyViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the HomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Compagny info"),
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PageView(

              );
            } else {
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        ));
  }

}
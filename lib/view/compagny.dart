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
          future: viewmodel.loadInfo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PageView(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text("${viewmodel.info?.name}",
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text("Founded in ${viewmodel.info?.founded} by ${viewmodel.info?.founder}",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text("CEO : ${viewmodel.info?.ceo} \n"
                            "CTO : ${viewmodel.info?.cto}\n"
                            "COO : ${viewmodel.info?.coo}\n"
                            "CTO Propulsion : ${viewmodel.info?.ctoPropulsion}",
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text("Headquarters : ${viewmodel.info?.headquarters?.address}, ${viewmodel.info?.headquarters?.city}, ${viewmodel.info?.headquarters?.state}",
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20 ,left: 10, right: 10),
                        child: Text("${viewmodel.info?.summary}",
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 15,

                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        ));
  }

}
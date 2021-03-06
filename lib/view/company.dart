import 'package:flutter/material.dart';
import 'package:ultimate_space_x_app/viewmodel/company_viewmodel.dart';

import '../repository/get_it.dart';

class CompanyPage extends StatelessWidget {

  static const route = "/company";

  final viewmodel = getItLocator<CompanyViewModel>();

  CompanyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the HomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Company info"),
          titleTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          actions: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 10),
                child: const Icon(Icons.info_rounded, color: Colors.blue)
            ),
          ],
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
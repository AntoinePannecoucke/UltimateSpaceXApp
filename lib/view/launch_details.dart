import 'package:flutter/material.dart';
import 'package:ultimate_space_x_app/viewmodel/launch_details_viewmodel.dart';

import '../component/image_placeholder.dart';
import '../model/crew.dart';
import '../model/launch.dart';

class LaunchDetailsArguments {
  Launch launch;

  LaunchDetailsArguments({required this.launch});
}


class LaunchDetailsPage extends StatelessWidget {

  static const route = "/launch-details";

  late final LaunchDetailsViewModel viewModel;

  LaunchDetailsPage(Launch launch, {Key? key}) : super(key: key){
    viewModel = LaunchDetailsViewModel(launch: launch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the HomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("${viewModel.launch.name}"),
          titleTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
        ),
        body: FutureBuilder(
          future: viewModel.load(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Text("Launch at : ${viewModel.launch.dateUTC}",
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                          SizedBox(
                            height: 250,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: viewModel.crews.length,
                                itemBuilder: (context, position) {
                                  Crew crew = viewModel.crews[position];
                                  return InkWell(
                                    child: SizedBox(
                                      width: 200,
                                      height: 200,

                                      child: Container(
                                        padding: const EdgeInsets.all(5.0),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(200)),
                                        ),
                                        child: Image.network(
                                          crew.image ?? '',
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, child, stack) {
                                            return const ImagePlaceholder();
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                }
                            ),
                          ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text("CEO :\n"
                            "CTO : \n"
                            "COO : \n"
                            "CTO Propulsion : ",
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text("Headquarters : ",
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20 ,left: 10, right: 10),
                        child: Text("",
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 15,

                          ),
                        ),
                      ),
                    ],
                  );
            } else {
            return const Center(child: CircularProgressIndicator(),);
            }
        })
    );
  }

}
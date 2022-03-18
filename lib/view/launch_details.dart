import 'package:flutter/material.dart';
import 'package:ultimate_space_x_app/repository/get_it.dart';
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
    viewModel = getItLocator<LaunchDetailsViewModel>(param1: launch);
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
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Text("Launch at :\n${viewModel.launch.dateUTC}",
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: const Text("Crew members :",
                      style: TextStyle(
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
                                    child: Column(
                                      children: [
                                        SizedBox(
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
                                              loadingBuilder: (context, child, loadingProgress) {
                                                return child ;
                                            },
                                              errorBuilder: (context, child, stack) {
                                                return const ImagePlaceholder();
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 200,
                                          height: 50,
                                          child: Text(
                                            "${crew.name}",
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }
                            ),
                          ),
                      Container(
                        margin: const EdgeInsets.only(left: 16, right: 16),
                        child: Text( viewModel.launch.details.toText(),
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.justify,
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

extension StringExtension on String? {
  String toText() {
    return this != null ? "$this" : "";
  }
}
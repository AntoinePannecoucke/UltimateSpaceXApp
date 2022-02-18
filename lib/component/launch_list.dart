import 'package:flutter/material.dart';

import '../model/launch.dart';
import '../viewmodel/home_viewmodel.dart';
import 'image_placeholder.dart';

class LaunchListView extends StatelessWidget {
  LaunchListView({Key? key, required this.launches}) : super(key: key);

  List<Launch> launches;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        Launch launch = launches[position];
        return InkWell(
          onTap: () async {
            //TODO: Nav
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
                      "${launch.name}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text("Launch date : ${launch.staticFireDateUTC ??
                        "Not defined"}")
                  ],
                ),
              ),
            ],
          ),
        );
      },
      itemCount: launches.length,
    );
  }
}
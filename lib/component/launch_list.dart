import 'package:flutter/material.dart';
import 'package:ultimate_space_x_app/repository/get_it.dart';
import 'package:ultimate_space_x_app/view/launch_details.dart';

import '../manager/data_manager.dart';
import '../model/launch.dart';
import 'image_placeholder.dart';

class LaunchListView extends StatelessWidget {
  LaunchListView({Key? key, required this.launches, this.onToggleFavorite}) : super(key: key);
  final Function(Launch, bool)? onToggleFavorite;

  final List<Launch> launches;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
        itemBuilder: (context, position) {
          Launch launch = launches[position];
          return InkWell(
            onTap: () async {
              await Navigator.of(context).pushNamed(LaunchDetailsPage.route,
                  arguments: LaunchDetailsArguments(launch: launch));
              onToggleFavorite?.call(launch, false);
            },
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 100,
                        height: 100,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.network(
                            launch.links?.patch?.small ?? '',
                            fit: BoxFit.fitWidth,
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
                          Text("Launch date : ${launch.dateUTC ??
                              "Not defined"}"
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () => {
                          onToggleFavorite?.call(launch, true)
                        },
                        icon: (getItLocator<DataManager>().isFavorites(launch) ?
                            const Icon(Icons.favorite_outlined, color: Colors.blue) :
                            const Icon(Icons.favorite_outline_outlined, color: Colors.black)

                        )
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  margin: const EdgeInsets.only(left: 25, right: 25, top: 8, bottom: 8),
                  color: Colors.grey,
                ),
              ],

            ),
          );
        },
        itemCount: launches.length,
      ),
    );
  }
}
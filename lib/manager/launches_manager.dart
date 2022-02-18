import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ultimate_space_x_app/repository/dio_repository.dart';
import 'package:ultimate_space_x_app/repository/get_it.dart';

import '../model/launch.dart';

@singleton
class LaunchesManager {

  Future<List<Launch>?> getUpcomingLaunches() async {
    List<Launch>? launches = [];
    try {
      var response = await getItLocator<DioRepository>().getUpcomingLaunches();
      if (response.data != null) {
        // Mapping data
        launches = List<dynamic>.from(response.data!)
            .map((json) => Launch.fromJson(json))
            .toList();
      }
    } catch (e) {
      debugPrint("Erreur : $e");
    }
    return launches;
  }
}
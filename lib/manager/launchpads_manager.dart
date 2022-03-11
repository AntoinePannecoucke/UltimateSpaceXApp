import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ultimate_space_x_app/model/launchpad.dart';
import 'package:ultimate_space_x_app/repository/dio_repository.dart';
import 'package:ultimate_space_x_app/repository/get_it.dart';

@singleton
class LaunchpadsManager {

  Future<List<Launchpad>?> getLaunchpads() async {
    List<Launchpad>? launchpads = [];
    try {
      var response = await getItLocator<DioRepository>().getLaunchpads();
      if (response.data != null) {
        // Mapping data
        launchpads = List<dynamic>.from(response.data!)
            .map((json) => Launchpad.fromJson(json))
            .toList();
      }
    } catch (e) {
      debugPrint("Erreur : $e");
    }
    return launchpads;
  }
}
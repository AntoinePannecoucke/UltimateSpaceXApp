import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ultimate_space_x_app/model/compagny_info.dart';
import 'package:ultimate_space_x_app/model/launchpad.dart';
import 'package:ultimate_space_x_app/repository/dio_repository.dart';
import 'package:ultimate_space_x_app/repository/get_it.dart';

import '../model/launch.dart';

@singleton
class DataManager {

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

  Future<List<Launch>?> getLaunches() async {
    List<Launch>? launches = [];
    try {
      var response = await getItLocator<DioRepository>().getLaunches();
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

  Future<CompagnyInfo?> getInfo() async {
    CompagnyInfo? info;
    try {
      var response = await getItLocator<DioRepository>().getInfo();
      if (response.data != null) {
        // Mapping data
        info = CompagnyInfo.fromJson(response.data!);
      }
    } catch (e) {
      debugPrint("Erreur : $e");
    }
    return info;
  }
}
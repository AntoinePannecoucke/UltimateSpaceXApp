import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ultimate_space_x_app/model/company_info.dart';
import 'package:ultimate_space_x_app/model/launchpad.dart';
import 'package:ultimate_space_x_app/repository/dio_repository.dart';
import 'package:ultimate_space_x_app/repository/get_it.dart';

import '../model/crew.dart';
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

  Future<CompanyInfo?> getInfo() async {
    CompanyInfo? info;
    try {
      var response = await getItLocator<DioRepository>().getInfo();
      if (response.data != null) {
        // Mapping data
        info = CompanyInfo.fromJson(response.data!);
      }
    } catch (e) {
      debugPrint("Erreur : $e");
    }
    return info;
  }

  Future<Crew?> getCrewById(String idCrew) async {
    Crew? crew;
    try {
      var response = await getItLocator<DioRepository>().getCrew(idCrew);
      if (response.data != null) {
        // Mapping data
        crew = Crew.fromJson(response.data!);
      }
    } catch (e) {
      debugPrint("Erreur : $e");
    }
    return crew;
  }
}
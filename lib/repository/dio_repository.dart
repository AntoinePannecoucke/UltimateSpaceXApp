import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class DioRepository {
  late Dio dio;

  DioRepository() {
    dio = Dio();
    dio.options.baseUrl = "https://api.spacexdata.com/v4";
  }

  Future<Response<List<dynamic>>> getUpcomingLaunches() async =>
      await dio.get<List<dynamic>>("/launches/upcoming");

}
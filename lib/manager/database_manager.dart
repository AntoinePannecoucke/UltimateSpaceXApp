import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:ultimate_space_x_app/model/launch.dart';

@singleton
class DatabaseManager {
  static const spotStore = "spot-store";
  static DatabaseManager instance = DatabaseManager._internal();

  factory DatabaseManager() => instance;

  late Database _db;

  final StoreRef<String, Map<String, dynamic>> _spotStore = stringMapStoreFactory.store(spotStore);

  DatabaseManager._internal();

  Future<void> init() async {
    String dataDirectoryPath = (await getApplicationDocumentsDirectory()).path;
    _db = await databaseFactoryIo
        .openDatabase("$dataDirectoryPath/ultimate_spacex_db.db");
  }

  Future<void> toggleFavorite(bool isFavorite, Launch launch) =>
      isFavorite ? removeSpot(launch.id) : insertSpot(launch);

  Future<void> insertSpot(Launch launch) async =>
      await _db.transaction((transaction) async =>
      await _spotStore.record(launch.id).put(transaction, launch.toJson()));

  Future<void> removeSpot(String idSpot) async =>
      await _spotStore.record(idSpot).delete(_db);

  Future<bool> isFavorite(String idSpot) async =>
      await _spotStore.record(idSpot).exists(_db);

  Future<List<Launch>> getFavoriteLaunches() async =>
      await _spotStore.find(_db).then((records) =>
          records.map((record) => Launch.fromJson(record.value)).toList());
}

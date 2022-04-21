import 'package:injectable/injectable.dart';
import 'package:ultimate_space_x_app/manager/data_manager.dart';
import 'package:ultimate_space_x_app/model/company_info.dart';
import 'package:ultimate_space_x_app/repository/get_it.dart';

import '../model/launch.dart';

@injectable
class FavoriteListViewModel {
  List<Launch> favorites = [];

  Future<bool> load() async {
    favorites = await getItLocator<DataManager>().getFavorites();
    return true;
  }

  onToggleFavorite(Launch launch) async {
    await getItLocator<DataManager>().toggleFavorite(launch);
    await load();
  }
}
import 'package:injectable/injectable.dart';
import 'package:ultimate_space_x_app/manager/data_manager.dart';
import 'package:ultimate_space_x_app/model/launch.dart';
import 'package:ultimate_space_x_app/repository/get_it.dart';

import '../model/crew.dart';

@injectable
class LaunchDetailsViewModel {
  Launch launch;
  List<Crew> crews = [];

  LaunchDetailsViewModel({
    @factoryParam required this.launch
  });

  Future<bool> load() async {
    for (String crewId in launch.crew ?? []){
      var crew = await getItLocator<DataManager>().getCrewById(crewId);
      if (crew != null){
        crews.add(crew);
      }
    }
    return true;
  }


}
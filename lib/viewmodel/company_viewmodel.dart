import 'package:ultimate_space_x_app/manager/data_manager.dart';
import 'package:ultimate_space_x_app/model/company_info.dart';
import 'package:ultimate_space_x_app/repository/get_it.dart';

class CompanyViewModel {
  CompanyInfo? info;

  Future<bool> loadInfo() async {
    info = await getItLocator<DataManager>().getInfo();
    return true;
  }
}
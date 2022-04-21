// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../manager/data_manager.dart' as _i4;
import '../manager/database_manager.dart' as _i5;
import '../manager/notification_manager.dart' as _i11;
import '../model/launch.dart' as _i10;
import '../viewmodel/company_viewmodel.dart' as _i3;
import '../viewmodel/favorite_list_viewmodel.dart' as _i7;
import '../viewmodel/home_viewmodel.dart' as _i8;
import '../viewmodel/launch_details_viewmodel.dart' as _i9;
import '../viewmodel/settings_viewmodel.dart' as _i12;
import 'dio_repository.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.CompanyViewModel>(() => _i3.CompanyViewModel());
  gh.singleton<_i4.DataManager>(_i4.DataManager());
  gh.singleton<_i5.DatabaseManager>(_i5.DatabaseManager());
  gh.singleton<_i6.DioRepository>(_i6.DioRepository());
  gh.factory<_i7.FavoriteListViewModel>(() => _i7.FavoriteListViewModel());
  gh.factory<_i8.HomeViewModel>(() => _i8.HomeViewModel());
  gh.factoryParam<_i9.LaunchDetailsViewModel, _i10.Launch, dynamic>(
      (launch, _) => _i9.LaunchDetailsViewModel(launch: launch));
  gh.singleton<_i11.NotificationManager>(_i11.NotificationManager());
  gh.factory<_i12.SettingsViewModel>(() => _i12.SettingsViewModel());
  return get;
}

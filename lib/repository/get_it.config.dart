// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../manager/launches_manager.dart' as _i4;
import '../manager/launchpads_manager.dart' as _i5;
import 'dio_repository.dart' as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.DioRepository>(_i3.DioRepository());
  gh.singleton<_i4.LaunchesManager>(_i4.LaunchesManager());
  gh.singleton<_i5.LaunchpadsManager>(_i5.LaunchpadsManager());
  return get;
}

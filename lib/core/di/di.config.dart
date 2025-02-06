// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/register/data/data_source/remote/base_register_remote_data_source.dart'
    as _i579;
import '../../features/register/data/data_source/remote/register_remote_data_source.dart'
    as _i448;
import '../../features/register/data/repo/register_repo_impl.dart' as _i612;
import '../../features/register/domain/repo/base_register_repo.dart' as _i950;
import '../../features/register/domain/use_cases/register_use_case.dart'
    as _i51;
import '../../features/register/presentation/controller/register_cubit/register_cubit.dart'
    as _i274;
import '../network/api_manager.dart' as _i119;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i119.ApiManager>(() => _i119.ApiManager());
    gh.factory<_i579.BaseRegisterRemoteDataSource>(
        () => _i448.RegisterRemoteDataSource());
    gh.factory<_i950.BaseRegisterRepo>(() => _i612.RegisterRepoImpl(
        registerRemoteDataSource: gh<_i579.BaseRegisterRemoteDataSource>()));
    gh.factory<_i51.RegisterUseCase>(
        () => _i51.RegisterUseCase(registerRepo: gh<_i950.BaseRegisterRepo>()));
    gh.factory<_i274.RegisterCubit>(
        () => _i274.RegisterCubit(registerUseCase: gh<_i51.RegisterUseCase>()));
    return this;
  }
}

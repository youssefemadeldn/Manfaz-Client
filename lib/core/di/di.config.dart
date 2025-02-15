// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/login/data/data_source/remote/base_login_remote_data_source.dart'
    as _i940;
import '../../features/login/data/data_source/remote/login_remote_data_source_impl.dart'
    as _i892;
import '../../features/login/data/repo/login_repo_impl.dart' as _i176;
import '../../features/login/domain/repo/base_login_repo.dart' as _i375;
import '../../features/login/domain/use_cases/login_use_case.dart' as _i191;
import '../../features/login/presentation/controller/login_cubit/login_cubit.dart'
    as _i868;
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
import '../../features/tabs/home_tab/data/data_source/base_home_tab_remote_data_source.dart'
    as _i936;
import '../../features/tabs/home_tab/data/data_source/home_tab_remote_data_source_impl.dart'
    as _i280;
import '../../features/tabs/home_tab/data/repo/home_tab_repo_impl.dart'
    as _i107;
import '../../features/tabs/home_tab/domain/repo/base_home_tab_repo.dart'
    as _i364;
import '../../features/tabs/home_tab/domain/use_cases/home_tab_use_case.dart'
    as _i59;
import '../../features/tabs/home_tab/presentation/controller/home_tab_cubit/home_tab_cubit.dart'
    as _i600;
import '../network/api_manager.dart' as _i119;
import 'di.dart' as _i913;

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
    final registerModule = _$RegisterModule();
    gh.singleton<_i409.GlobalKey<_i409.NavigatorState>>(
        () => registerModule.navigatorKey);
    gh.singleton<_i119.ApiManager>(() => _i119.ApiManager());
    gh.factory<_i940.BaseLoginRemoteDataSource>(
        () => _i892.LoginRemoteDataSourceImpl());
    gh.factory<_i936.BaseHomeTabRemoteDataSource>(
        () => _i280.HomeTabRemoteDataSourceImpl());
    gh.factory<_i579.BaseRegisterRemoteDataSource>(
        () => _i448.RegisterRemoteDataSource());
    gh.factory<_i375.BaseLoginRepo>(
        () => _i176.LoginRepoImpl(gh<_i940.BaseLoginRemoteDataSource>()));
    gh.factory<_i364.BaseHomeTabRepo>(
        () => _i107.HomeTabRepoImpl(gh<_i936.BaseHomeTabRemoteDataSource>()));
    gh.factory<_i191.LoginUseCase>(
        () => _i191.LoginUseCase(gh<_i375.BaseLoginRepo>()));
    gh.factory<_i950.BaseRegisterRepo>(() => _i612.RegisterRepoImpl(
        registerRemoteDataSource: gh<_i579.BaseRegisterRemoteDataSource>()));
    gh.factory<_i59.HomeTabUseCase>(
        () => _i59.HomeTabUseCase(gh<_i364.BaseHomeTabRepo>()));
    gh.factory<_i51.RegisterUseCase>(
        () => _i51.RegisterUseCase(registerRepo: gh<_i950.BaseRegisterRepo>()));
    gh.factory<_i868.LoginCubit>(
        () => _i868.LoginCubit(loginUseCase: gh<_i191.LoginUseCase>()));
    gh.factory<_i274.RegisterCubit>(
        () => _i274.RegisterCubit(registerUseCase: gh<_i51.RegisterUseCase>()));
    gh.factory<_i600.HomeTabCubit>(
        () => _i600.HomeTabCubit(homeTabUseCase: gh<_i59.HomeTabUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i913.RegisterModule {}

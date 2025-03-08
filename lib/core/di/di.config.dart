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

import '../../features/delivery/delivery_service_from_to/presentation/controller/cubit/delivery_service_from_to_cubit.dart'
    as _i790;
import '../../features/login/data/data_source/remote/base_login_remote_data_source.dart'
    as _i940;
import '../../features/login/data/data_source/remote/base_resend_verification_code_remote_data_source.dart'
    as _i63;
import '../../features/login/data/data_source/remote/login_remote_data_source_impl.dart'
    as _i892;
import '../../features/login/data/data_source/remote/resend_verification_code_remote_data_source_impl.dart'
    as _i804;
import '../../features/login/data/repo/login_repo_impl.dart' as _i176;
import '../../features/login/data/repo/resend_verification_code_repo_impl.dart'
    as _i618;
import '../../features/login/domain/repo/base_login_repo.dart' as _i375;
import '../../features/login/domain/repo/base_resend_verification_code_repo.dart'
    as _i994;
import '../../features/login/domain/use_cases/login_use_case.dart' as _i191;
import '../../features/login/domain/use_cases/resend_verification_code_use_case.dart'
    as _i24;
import '../../features/login/presentation/controller/login_cubit/login_cubit.dart'
    as _i868;
import '../../features/login/presentation/controller/otp_verification/otp_verification_cubit.dart'
    as _i163;
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
import '../../features/servicses/services_list_view_view/data/data_source/remote/base_services_list_view_remote_data_source.dart'
    as _i500;
import '../../features/servicses/services_list_view_view/data/data_source/remote/services_list_view_remote_data_source_impl.dart'
    as _i525;
import '../../features/servicses/services_list_view_view/data/repo/services_list_view_repo_impl.dart'
    as _i1073;
import '../../features/servicses/services_list_view_view/domain/repo/base_services_list_view_repo.dart'
    as _i600;
import '../../features/servicses/services_list_view_view/domain/use_cases/get_services_parameters_use_case.dart'
    as _i117;
import '../../features/servicses/services_list_view_view/presentation/controller/cubit/service_list_view_cubit.dart'
    as _i1002;
import '../../features/tabs/home_tab/data/data_source/remote/base_home_tab_remote_data_source.dart'
    as _i710;
import '../../features/tabs/home_tab/data/data_source/remote/home_tab_remote_data_source_impl.dart'
    as _i834;
import '../../features/tabs/home_tab/data/repo/home_tab_repo_impl.dart'
    as _i107;
import '../../features/tabs/home_tab/domain/repo/base_home_tab_repo.dart'
    as _i364;
import '../../features/tabs/home_tab/domain/use_cases/get_services_based_on_category_use_case.dart'
    as _i586;
import '../../features/tabs/home_tab/domain/use_cases/home_tab_use_case.dart'
    as _i59;
import '../../features/tabs/home_tab/presentation/controller/home_tab_cubit/home_tab_cubit.dart'
    as _i600;
import '../../features/tabs/home_tab/presentation/controller/search_bar_cubit/search_bar_cubit.dart'
    as _i320;
import '../../features/tabs/home_tab/presentation/controller/services_cubit/services_cubit.dart'
    as _i256;
import '../../features/workers/worker_list_view/data/data_source/remote/base_worker_list_remote_data_source.dart'
    as _i852;
import '../../features/workers/worker_list_view/data/data_source/remote/worker_list_remote_data_source_impl.dart'
    as _i365;
import '../../features/workers/worker_list_view/data/repo/worker_list_repo_impl.dart'
    as _i241;
import '../../features/workers/worker_list_view/domain/repo/base_worker_list_repo.dart'
    as _i1003;
import '../../features/workers/worker_list_view/domain/use_cases/worker_list_use_case.dart'
    as _i320;
import '../../features/workers/worker_list_view/presentation/controller/cubit/worker_list_cubit.dart'
    as _i525;
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
    gh.factory<_i790.DeliveryServiceFromToCubit>(
        () => _i790.DeliveryServiceFromToCubit());
    gh.factory<_i320.SearchBarCubit>(() => _i320.SearchBarCubit());
    gh.singleton<_i409.GlobalKey<_i409.NavigatorState>>(
        () => registerModule.navigatorKey);
    gh.singleton<_i119.ApiManager>(() => _i119.ApiManager());
    gh.factory<_i710.BaseHomeTabRemoteDataSource>(
        () => _i834.HomeTabRemoteDataSourceImpl());
    gh.factory<_i852.BaseWorkerListRemoteDataSource>(
        () => _i365.WorkerListRemoteDataSourceImpl());
    gh.factory<_i500.BaseServicesListViewRemoteDataSource>(
        () => _i525.ServicesListViewRemoteDataSourceImpl());
    gh.factory<_i940.BaseLoginRemoteDataSource>(
        () => _i892.LoginRemoteDataSourceImpl());
    gh.factory<_i63.BaseResendVerificationCodeRemoteDataSource>(
        () => _i804.ResendVerificationCodeRemoteDataSourceImpl());
    gh.factory<_i579.BaseRegisterRemoteDataSource>(
        () => _i448.RegisterRemoteDataSource());
    gh.factory<_i364.BaseHomeTabRepo>(
        () => _i107.HomeTabRepoImpl(gh<_i710.BaseHomeTabRemoteDataSource>()));
    gh.factory<_i994.BaseResendVerificationCodeRepo>(() =>
        _i618.ResendVerificationCodeRepoImpl(
            gh<_i63.BaseResendVerificationCodeRemoteDataSource>()));
    gh.factory<_i1003.BaseWorkerListRepo>(() =>
        _i241.WorkerListRepoImpl(gh<_i852.BaseWorkerListRemoteDataSource>()));
    gh.factory<_i375.BaseLoginRepo>(
        () => _i176.LoginRepoImpl(gh<_i940.BaseLoginRemoteDataSource>()));
    gh.factory<_i600.BaseServicesListViewRepo>(() =>
        _i1073.ServicesListViewRepoImpl(
            gh<_i500.BaseServicesListViewRemoteDataSource>()));
    gh.factory<_i24.ResendVerificationCodeUseCase>(() =>
        _i24.ResendVerificationCodeUseCase(
            gh<_i994.BaseResendVerificationCodeRepo>()));
    gh.factory<_i117.ServicesListParametersUseCase>(() =>
        _i117.ServicesListParametersUseCase(
            gh<_i600.BaseServicesListViewRepo>()));
    gh.factory<_i320.WorkerListUseCase>(
        () => _i320.WorkerListUseCase(gh<_i1003.BaseWorkerListRepo>()));
    gh.factory<_i191.LoginUseCase>(
        () => _i191.LoginUseCase(gh<_i375.BaseLoginRepo>()));
    gh.factory<_i950.BaseRegisterRepo>(() => _i612.RegisterRepoImpl(
        registerRemoteDataSource: gh<_i579.BaseRegisterRemoteDataSource>()));
    gh.factory<_i586.GetServicesBasedOnCategoryUseCase>(() =>
        _i586.GetServicesBasedOnCategoryUseCase(gh<_i364.BaseHomeTabRepo>()));
    gh.factory<_i59.HomeTabUseCase>(
        () => _i59.HomeTabUseCase(gh<_i364.BaseHomeTabRepo>()));
    gh.factory<_i1002.ServiceListViewCubit>(() =>
        _i1002.ServiceListViewCubit(gh<_i117.ServicesListParametersUseCase>()));
    gh.factory<_i256.ServicesCubit>(() => _i256.ServicesCubit(
        getServicesBasedOnCategoryUseCase:
            gh<_i586.GetServicesBasedOnCategoryUseCase>()));
    gh.factory<_i51.RegisterUseCase>(
        () => _i51.RegisterUseCase(registerRepo: gh<_i950.BaseRegisterRepo>()));
    gh.factory<_i868.LoginCubit>(
        () => _i868.LoginCubit(loginUseCase: gh<_i191.LoginUseCase>()));
    gh.factory<_i163.OtpVerificationCubit>(() =>
        _i163.OtpVerificationCubit(gh<_i24.ResendVerificationCodeUseCase>()));
    gh.factory<_i274.RegisterCubit>(
        () => _i274.RegisterCubit(registerUseCase: gh<_i51.RegisterUseCase>()));
    gh.factory<_i525.WorkerListCubit>(() => _i525.WorkerListCubit(
        workerListUseCase: gh<_i320.WorkerListUseCase>()));
    gh.factory<_i600.HomeTabCubit>(
        () => _i600.HomeTabCubit(homeTabUseCase: gh<_i59.HomeTabUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i913.RegisterModule {}

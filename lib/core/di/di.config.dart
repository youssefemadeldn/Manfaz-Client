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

import '../../features/auth/login/data/data_source/remote/base_login_remote_data_source.dart'
    as _i187;
import '../../features/auth/login/data/data_source/remote/base_resend_verification_code_remote_data_source.dart'
    as _i216;
import '../../features/auth/login/data/data_source/remote/login_remote_data_source_impl.dart'
    as _i300;
import '../../features/auth/login/data/data_source/remote/resend_verification_code_remote_data_source_impl.dart'
    as _i157;
import '../../features/auth/login/data/repo/login_repo_impl.dart' as _i1001;
import '../../features/auth/login/data/repo/resend_verification_code_repo_impl.dart'
    as _i970;
import '../../features/auth/login/domain/repo/base_login_repo.dart' as _i752;
import '../../features/auth/login/domain/repo/base_resend_verification_code_repo.dart'
    as _i385;
import '../../features/auth/login/domain/use_cases/login_use_case.dart' as _i50;
import '../../features/auth/login/domain/use_cases/resend_verification_code_use_case.dart'
    as _i496;
import '../../features/auth/login/presentation/controller/login_cubit/login_cubit.dart'
    as _i1070;
import '../../features/auth/login/presentation/controller/otp_verification/otp_verification_cubit.dart'
    as _i579;
import '../../features/auth/register/data/data_source/remote/base_register_remote_data_source.dart'
    as _i347;
import '../../features/auth/register/data/data_source/remote/register_remote_data_source.dart'
    as _i258;
import '../../features/auth/register/data/repo/register_repo_impl.dart'
    as _i934;
import '../../features/auth/register/domain/repo/base_register_repo.dart'
    as _i88;
import '../../features/auth/register/domain/use_cases/register_use_case.dart'
    as _i118;
import '../../features/auth/register/presentation/controller/register_cubit/register_cubit.dart'
    as _i844;
import '../../features/delivery/delivery_service_from_to/presentation/controller/cubit/delivery_service_from_to_cubit.dart'
    as _i790;
import '../../features/order/create_service_order/data/data_source/remote/base_create_service_order_remote_data_source.dart'
    as _i416;
import '../../features/order/create_service_order/data/data_source/remote/create_service_order_remote_data_source_impl.dart'
    as _i638;
import '../../features/order/create_service_order/data/repo/create_service_order_repo_impl.dart'
    as _i1056;
import '../../features/order/create_service_order/domin/repo/base_create_service_order_repo.dart'
    as _i32;
import '../../features/order/create_service_order/domin/use_cases/create_service_order_use_case.dart'
    as _i449;
import '../../features/order/create_service_order/presentation/controller/create_service_order_cubit/create_service_order_cubit.dart'
    as _i482;
import '../../features/order/create_service_order/presentation/controller/service_order_location_picker_cubit/service_order_location_picker_cubit.dart'
    as _i996;
import '../../features/order/orders_tab/data/data_source/remote/base_orders_tab_remote_data_source.dart'
    as _i377;
import '../../features/order/orders_tab/data/data_source/remote/orders_tab_remote_data_source_impl.dart'
    as _i542;
import '../../features/order/orders_tab/data/repo/orders_tab_repo_impl.dart'
    as _i666;
import '../../features/order/orders_tab/domain/repo/base_orders_tab_repo.dart'
    as _i198;
import '../../features/order/orders_tab/domain/use_cases/get_orders_tab_use_case.dart'
    as _i289;
import '../../features/order/orders_tab/presentation/controller/order_tab_cubit/order_tab_cubit.dart'
    as _i561;
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
import '../../features/store/restaurant_store/data/data_source/remote/base_restaurant_store_remote_data_source.dart'
    as _i904;
import '../../features/store/restaurant_store/data/data_source/remote/restaurant_store_remote_data_source_impl.dart'
    as _i277;
import '../../features/store/restaurant_store/data/repo/restaurant_store_repo_impl.dart'
    as _i484;
import '../../features/store/restaurant_store/domin/repo/base_restaurant_store_repo.dart'
    as _i253;
import '../../features/store/restaurant_store/domin/use_cases/get_store_sub_categories_by_category_id.dart'
    as _i117;
import '../../features/store/restaurant_store/domin/use_cases/restaurant_store_use_case.dart'
    as _i1023;
import '../../features/store/restaurant_store/presentation/controller/restaurant_store_cubit/restaurant_store_cubit.dart'
    as _i554;
import '../../features/store/restaurant_store/presentation/controller/store_sub_categories_cubit/store_sub_categories_cubit.dart'
    as _i288;
import '../../features/store/restaurant_store_details/data/data_source/remote/base_restaurant_store_details_remote_data_source.dart'
    as _i826;
import '../../features/store/restaurant_store_details/data/data_source/remote/restaurant_store_details_remote_data_source_impl.dart'
    as _i56;
import '../../features/store/restaurant_store_details/data/repo/restaurant_store_details_repo_impl.dart'
    as _i984;
import '../../features/store/restaurant_store_details/domin/repo/base_restaurant_store_details_repo.dart'
    as _i929;
import '../../features/store/restaurant_store_details/domin/use_cases/get_store_details_use_case.dart'
    as _i946;
import '../../features/store/restaurant_store_details/presentation/controller/restaurant_store_details_cubit/restaurant_store_details_cubit.dart'
    as _i648;
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
import '../network/realtime/web_socket_service.dart' as _i489;
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
    gh.factory<_i996.ServiceOrderLocationPickerCubit>(
        () => _i996.ServiceOrderLocationPickerCubit());
    gh.factory<_i320.SearchBarCubit>(() => _i320.SearchBarCubit());
    gh.singleton<_i409.GlobalKey<_i409.NavigatorState>>(
        () => registerModule.navigatorKey);
    gh.singleton<_i119.ApiManager>(() => _i119.ApiManager());
    gh.singleton<_i489.WebSocketService>(() => _i489.WebSocketService());
    gh.factory<_i710.BaseHomeTabRemoteDataSource>(
        () => _i834.HomeTabRemoteDataSourceImpl());
    gh.factory<_i826.BaseRestaurantStoreDetailsRemoteDataSource>(
        () => _i56.RestaurantStoreDetailsRemoteDataSourceImpl());
    gh.factory<_i377.BaseOrdersTabRemoteDataSource>(
        () => _i542.OrdersTabRemoteDataSourceImpl());
    gh.factory<_i347.BaseRegisterRemoteDataSource>(
        () => _i258.RegisterRemoteDataSource());
    gh.factory<_i187.BaseLoginRemoteDataSource>(
        () => _i300.LoginRemoteDataSourceImpl());
    gh.factory<_i852.BaseWorkerListRemoteDataSource>(
        () => _i365.WorkerListRemoteDataSourceImpl());
    gh.factory<_i500.BaseServicesListViewRemoteDataSource>(
        () => _i525.ServicesListViewRemoteDataSourceImpl());
    gh.factory<_i416.BaseCreateServiceOrderRemoteDataSource>(
        () => _i638.CreateServiceOrderRemoteDataSourceImpl());
    gh.factory<_i216.BaseResendVerificationCodeRemoteDataSource>(
        () => _i157.ResendVerificationCodeRemoteDataSourceImpl());
    gh.factory<_i364.BaseHomeTabRepo>(
        () => _i107.HomeTabRepoImpl(gh<_i710.BaseHomeTabRemoteDataSource>()));
    gh.factory<_i198.BaseOrdersTabRepo>(() =>
        _i666.OrdersTabRepoImpl(gh<_i377.BaseOrdersTabRemoteDataSource>()));
    gh.factory<_i1003.BaseWorkerListRepo>(() =>
        _i241.WorkerListRepoImpl(gh<_i852.BaseWorkerListRemoteDataSource>()));
    gh.factory<_i904.BaseRestaurantStoreRemoteDataSource>(
        () => _i277.RestaurantStoreRemoteDataSourceImpl());
    gh.factory<_i289.GetOrdersTabUseCase>(
        () => _i289.GetOrdersTabUseCase(gh<_i198.BaseOrdersTabRepo>()));
    gh.factory<_i385.BaseResendVerificationCodeRepo>(() =>
        _i970.ResendVerificationCodeRepoImpl(
            gh<_i216.BaseResendVerificationCodeRemoteDataSource>()));
    gh.factory<_i561.OrderTabCubit>(
        () => _i561.OrderTabCubit(gh<_i289.GetOrdersTabUseCase>()));
    gh.factory<_i600.BaseServicesListViewRepo>(() =>
        _i1073.ServicesListViewRepoImpl(
            gh<_i500.BaseServicesListViewRemoteDataSource>()));
    gh.factory<_i32.BaseCreateServiceOrderRepo>(() =>
        _i1056.CreateServiceOrderRepoImpl(
            gh<_i416.BaseCreateServiceOrderRemoteDataSource>()));
    gh.factory<_i752.BaseLoginRepo>(
        () => _i1001.LoginRepoImpl(gh<_i187.BaseLoginRemoteDataSource>()));
    gh.factory<_i117.ServicesListParametersUseCase>(() =>
        _i117.ServicesListParametersUseCase(
            gh<_i600.BaseServicesListViewRepo>()));
    gh.factory<_i929.BaseRestaurantStoreDetailsRepo>(() =>
        _i984.RestaurantStoreDetailsRepoImpl(
            gh<_i826.BaseRestaurantStoreDetailsRemoteDataSource>()));
    gh.factory<_i449.CreateServiceOrderUseCase>(() =>
        _i449.CreateServiceOrderUseCase(gh<_i32.BaseCreateServiceOrderRepo>()));
    gh.factory<_i320.WorkerListUseCase>(
        () => _i320.WorkerListUseCase(gh<_i1003.BaseWorkerListRepo>()));
    gh.factory<_i253.BaseRestaurantStoreRepo>(() =>
        _i484.RestaurantStoreRepoImpl(
            gh<_i904.BaseRestaurantStoreRemoteDataSource>()));
    gh.factory<_i88.BaseRegisterRepo>(() => _i934.RegisterRepoImpl(
        registerRemoteDataSource: gh<_i347.BaseRegisterRemoteDataSource>()));
    gh.factory<_i496.ResendVerificationCodeUseCase>(() =>
        _i496.ResendVerificationCodeUseCase(
            gh<_i385.BaseResendVerificationCodeRepo>()));
    gh.factory<_i117.GetStoreSubCategoriesByCategoryId>(() =>
        _i117.GetStoreSubCategoriesByCategoryId(
            gh<_i253.BaseRestaurantStoreRepo>()));
    gh.factory<_i1023.RestaurantStoreUseCase>(() =>
        _i1023.RestaurantStoreUseCase(gh<_i253.BaseRestaurantStoreRepo>()));
    gh.factory<_i586.GetServicesBasedOnCategoryUseCase>(() =>
        _i586.GetServicesBasedOnCategoryUseCase(gh<_i364.BaseHomeTabRepo>()));
    gh.factory<_i59.HomeTabUseCase>(
        () => _i59.HomeTabUseCase(gh<_i364.BaseHomeTabRepo>()));
    gh.factory<_i1002.ServiceListViewCubit>(() =>
        _i1002.ServiceListViewCubit(gh<_i117.ServicesListParametersUseCase>()));
    gh.factory<_i256.ServicesCubit>(() => _i256.ServicesCubit(
        getServicesBasedOnCategoryUseCase:
            gh<_i586.GetServicesBasedOnCategoryUseCase>()));
    gh.factory<_i50.LoginUseCase>(
        () => _i50.LoginUseCase(gh<_i752.BaseLoginRepo>()));
    gh.factory<_i579.OtpVerificationCubit>(() =>
        _i579.OtpVerificationCubit(gh<_i496.ResendVerificationCodeUseCase>()));
    gh.factory<_i554.RestaurantStoreCubit>(() => _i554.RestaurantStoreCubit(
        restaurantStoreUseCase: gh<_i1023.RestaurantStoreUseCase>()));
    gh.factory<_i946.GetStoreDetailsUseCase>(() => _i946.GetStoreDetailsUseCase(
        gh<_i929.BaseRestaurantStoreDetailsRepo>()));
    gh.factory<_i288.StoreSubCategoriesCubit>(() =>
        _i288.StoreSubCategoriesCubit(
            getStoreSubCategoriesByCategoryId:
                gh<_i117.GetStoreSubCategoriesByCategoryId>()));
    gh.factory<_i482.CreateServiceOrderCubit>(() =>
        _i482.CreateServiceOrderCubit(
            createServiceOrderUseCase: gh<_i449.CreateServiceOrderUseCase>()));
    gh.factory<_i118.RegisterUseCase>(
        () => _i118.RegisterUseCase(registerRepo: gh<_i88.BaseRegisterRepo>()));
    gh.factory<_i844.RegisterCubit>(() =>
        _i844.RegisterCubit(registerUseCase: gh<_i118.RegisterUseCase>()));
    gh.factory<_i525.WorkerListCubit>(() => _i525.WorkerListCubit(
        workerListUseCase: gh<_i320.WorkerListUseCase>()));
    gh.factory<_i648.RestaurantStoreDetailsCubit>(() =>
        _i648.RestaurantStoreDetailsCubit(
            getStoreDetailsUseCase: gh<_i946.GetStoreDetailsUseCase>()));
    gh.factory<_i600.HomeTabCubit>(
        () => _i600.HomeTabCubit(homeTabUseCase: gh<_i59.HomeTabUseCase>()));
    gh.factory<_i1070.LoginCubit>(
        () => _i1070.LoginCubit(loginUseCase: gh<_i50.LoginUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i913.RegisterModule {}

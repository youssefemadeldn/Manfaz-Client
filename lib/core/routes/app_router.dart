import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manfaz/core/routes/routes.dart';
import 'package:manfaz/features/bottom_navigation_bar/presentation/view/cus_bottom_navigation_bar.dart';
import 'package:manfaz/features/login/presentation/view/login_view.dart';
import 'package:manfaz/features/login/presentation/view/otp_verification_view.dart';
import 'package:manfaz/features/login/presentation/view/success_verification_view.dart';
import 'package:manfaz/features/onBoardings/presentation/views/on_boarding_view.dart';
import '../../features/delivery_list_view_view/presentation/view/delivery_list_view_view.dart';
import '../../features/workers/worker_profile/presentation/views/worker_profile_view.dart';
import '../../features/google_maps/presentation/controller/google_maps_cubit/google_maps_cubit.dart';
import '../../features/google_maps/presentation/views/get_user_location_view.dart';
import '../../features/services_list_view_view/presentation/views/services_list_view_view.dart';
import '../../features/login/presentation/controller/login_cubit/login_cubit.dart';
import '../../features/workers/worker_list_view/presentation/views/worker_list_view_view.dart';
import '../../features/register/presentation/controller/register_cubit/register_cubit.dart';
import '../../features/register/presentation/views/register_view.dart';
import '../../features/send_an_offer/presentation/views/send_an_offer_view.dart';
import '../../features/tabs/home_tab/data/models/services_based_on_category_model.dart';
import '../di/di.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return CupertinoPageRoute(builder: (_) => const OnBoardingView());

      case Routes.loginView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginView(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOutCubic,
                )),
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 400),
        );
      //
      case Routes.registerView:
        return CupertinoPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<RegisterCubit>(),
                  child: RegisterView(),
                ));
      //
      case Routes.successVerificationView:
        return CupertinoPageRoute(
            builder: (_) => const SuccessVerificationView());
      //
      case Routes.otpVerificationView:
        return CupertinoPageRoute(builder: (_) => const OtpVerificationView());
      case Routes.cusBottomNavigationBar:
        return CupertinoPageRoute(builder: (_) => CusBottomNavigationBar());
      //
      case Routes.workerListViewView:
        return CupertinoPageRoute(builder: (_) => WorkerListViewView());
      //
      case Routes.workerProfileView:
        return CupertinoPageRoute(builder: (_) => WorkerProfileView());
      //
      case Routes.sendAnOfferView:
        return CupertinoPageRoute(builder: (context) => SendAnOfferView());
      //
      case Routes.getUserLocationView:
        return CupertinoPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => GoogleMapsCubit()..init(),
                  child: GetUserLocationView(),
                ));

      case Routes.servicesListViewView:
        return CupertinoPageRoute(
            builder: (context) => ServicesListViewView(
                  servicesList: settings.arguments as List<ServiceModel>,
                ));

      case Routes.deliveryListViewView:
        return CupertinoPageRoute(builder: (context) => DeliveryListViewView());

      default:
        return CupertinoPageRoute(
          builder: (_) => CupertinoPageScaffold(
            child: Scaffold(
              body: Center(
                child: Text("No Route defined for ${settings.name}"),
              ),
            ),
          ),
        );
    }
  }
}

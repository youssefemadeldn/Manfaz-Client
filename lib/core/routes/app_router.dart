import 'package:flutter/cupertino.dart';
import 'package:manfaz/core/routes/routes.dart';
import 'package:manfaz/features/bottom_navigation_bar/presentation/view/cus_bottom_navigation_bar.dart';
import 'package:manfaz/features/login/presentation/view/login_view.dart';
import 'package:manfaz/features/login/presentation/view/otp_verification_view.dart';
import 'package:manfaz/features/login/presentation/view/success_verification_view.dart';
import 'package:manfaz/features/onBoardings/language_switcher_view.dart';
import 'package:manfaz/features/onBoardings/presentation/views/on_boarding_view.dart';
import '../../features/freelancer_profile/presentation/views/freelancer_profile_view.dart';
import '../../features/google_maps/presentation/views/get_user_location_view.dart';
import '../../features/people_list_view/presentation/views/people_list_view_view.dart';
import '../../features/register/presentation/views/register_view.dart';
import '../../features/send_an_offer/presentation/views/send_an_offer_view.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return CupertinoPageRoute(builder: (_) => const OnBoardingView());

      // case Routes.yourTurnView:
      //   return CupertinoPageRoute(builder: (_) => const YourTurnView());

      case Routes.loginView:
        return CupertinoPageRoute(builder: (_) => const LoginView());

      case Routes.registerView:
        return CupertinoPageRoute(builder: (_) => const RegisterView());
      case Routes.successVerificationView:
        return CupertinoPageRoute(
            builder: (_) => const SuccessVerificationView());
      case Routes.otpVerificationView:
        return CupertinoPageRoute(builder: (_) => const OtpVerificationView());
      case Routes.cusBottomNavigationBar:
        return CupertinoPageRoute(builder: (_) => CusBottomNavigationBar());

      case Routes.peopleListViewView:
        return CupertinoPageRoute(builder: (_) => PeopleListViewView());

      case Routes.freelancerProfileView:
        return CupertinoPageRoute(builder: (_) => FreelancerProfileView());

      case Routes.sendAnOfferView:
        return CupertinoPageRoute(builder: (context) => SendAnOfferView());
      case Routes.languageSwitcherScreen:
        return CupertinoPageRoute(builder: (context) => LanguageSwitcherView());
      case Routes.getUserLocationView:
        return CupertinoPageRoute(builder: (context) => GetUserLocationView());
      default:
        return CupertinoPageRoute(
          builder: (_) => CupertinoPageScaffold(
            child: Center(
              child: Text("No Route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}

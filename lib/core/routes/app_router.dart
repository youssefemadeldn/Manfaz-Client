import 'package:flutter/material.dart';
import 'package:manfaz/core/routes/routes.dart';
import 'package:manfaz/features/bottom_navigation_bar/presentation/view/cus_bottom_navigation_bar.dart';
import 'package:manfaz/features/login/presentation/view/login_view.dart';
import 'package:manfaz/features/login/presentation/view/otp_verification_view.dart';
import 'package:manfaz/features/login/presentation/view/success_verification_view.dart';
import 'package:manfaz/features/onBoardings/language_switcher_view.dart';
import 'package:manfaz/features/onBoardings/presentation/views/on_boarding_view.dart';
// import 'package:manfaz/features/onBoardings/presentation/views/your_turn_view.dart';

import '../../features/freelancer_profile/presentation/views/freelancer_profile_view.dart';
import '../../features/people_list_view/presentation/views/people_list_view_view.dart';
import '../../features/register/presentation/views/register_view.dart';
import '../../features/send_an_offer/presentation/views/send_an_offer_view.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());

      // case Routes.yourTurnView:
      //   return MaterialPageRoute(builder: (_) => const YourTurnView());

      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());

      case Routes.registerView:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.successVerificationView:
        return MaterialPageRoute(
            builder: (_) => const SuccessVerificationView());
      case Routes.otpVerificationView:
        return MaterialPageRoute(builder: (_) => const OtpVerificationView());
      case Routes.cusBottomNavigationBar:
        return MaterialPageRoute(builder: (_) => CusBottomNavigationBar());

      case Routes.peopleListViewView:
        return MaterialPageRoute(builder: (_) => PeopleListViewView());

      case Routes.freelancerProfileView:
        return MaterialPageRoute(builder: (_) => FreelancerProfileView());

      case Routes.sendAnOfferView:
        return MaterialPageRoute(builder: (context) => SendAnOfferView());
      case Routes.languageSwitcherScreen:
        return MaterialPageRoute(builder: (context) => LanguageSwitcherView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No Route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:manfaz/core/routes/routes.dart';
import 'package:manfaz/features/bottom_navigation_bar/presentation/view/cus_bottom_navigation_bar.dart';
import 'package:manfaz/features/login/presentation/view/login_view.dart';
import 'package:manfaz/features/login/presentation/view/otp_verification_view.dart';
import 'package:manfaz/features/login/presentation/view/success_verification_view.dart';
import 'package:manfaz/features/onBoardings/presentation/views/welcome_to_our_app_view.dart';
import 'package:manfaz/features/onBoardings/presentation/views/your_turn_view.dart';

import '../../features/freelancer_profile/presentation/views/freelancer_profile_view.dart';
import '../../features/freelancer_specific_skill_view/presentation/views/freelancers_with_specific_skill_view.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcomeToOurAppView:
        return MaterialPageRoute(builder: (_) => const WelcomeToOurAppView());

      case Routes.yourTurnView:
        return MaterialPageRoute(builder: (_) => const YourTurnView());

      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.successVerificationView:
        return MaterialPageRoute(
            builder: (_) => const SuccessVerificationView());
      case Routes.otpVerificationView:
        return MaterialPageRoute(builder: (_) => const OtpVerificationView());
      case Routes.cusBottomNavigationBar:
        return MaterialPageRoute(builder: (_) => CusBottomNavigationBar());

      case Routes.freelancerWithSpecificSkillView:
        return MaterialPageRoute(
            builder: (_) => FreelancersWithSpecificSkillView());

      case Routes.freelancerProfileView:
        return MaterialPageRoute(builder: (_) => FreelancerProfileView());
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

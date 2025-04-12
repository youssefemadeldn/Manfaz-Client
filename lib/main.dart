import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/routes/app_router.dart';
import 'package:manfaz/core/routes/routes.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'core/cache/shared_pref_utils.dart';
import 'core/di/di.dart';
import 'my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedPrefUtils.init();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  bool? isLoggedIn = await SharedPrefUtils.getData('hasLoggedIn');
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/lang', // Path to your language files
      fallbackLocale: const Locale('en'), // Default language
      child: ManfazApp(isLoggedIn: isLoggedIn ?? false)));
}

class ManfazApp extends StatelessWidget {
  final bool isLoggedIn;
  const ManfazApp({super.key, required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      child: MaterialApp(
        navigatorKey: getIt<GlobalKey<NavigatorState>>(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        initialRoute:
            isLoggedIn ? Routes.cusBottomNavigationBar : Routes.onBoarding,
        onGenerateRoute: AppRouter.generateRoute,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.background,
          ),
          scaffoldBackgroundColor: AppColors.background,
          primaryColor: AppColors.primary,
        ),
      ),
    );
  }
}

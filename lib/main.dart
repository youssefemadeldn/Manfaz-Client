import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/routes/app_router.dart';
import 'package:manfaz/core/routes/routes.dart';
import 'package:manfaz/core/theme/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/lang', // Path to your language files
      fallbackLocale: const Locale('en'), // Default language
      child: const ManfazApp()));
}

class ManfazApp extends StatelessWidget {
  const ManfazApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.cusBottomNavigationBar,
        onGenerateRoute: AppRouter.generateRoute,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.background,
          ),
          scaffoldBackgroundColor: AppColors.background,
          
        ),
      ),
    );
  }
}

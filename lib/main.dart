import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manfaz/core/routes/app_router.dart';
import 'package:manfaz/core/routes/routes.dart';

void main() {
  runApp(const ManfazApp());
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
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.welcomeToOurAppView,
        onGenerateRoute: AppRouter.generateRoute,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFFFFFFFF),
          ),
          scaffoldBackgroundColor: Color(0xFFF2F6FF),
        ),
      ),
    );
  }
}

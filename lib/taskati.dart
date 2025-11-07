import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/routes/app_route.dart';
import 'package:taskati/core/routes/routes.dart';
import 'package:taskati/feature/splash/presentation/splash_screen.dart';

class Taskati extends StatelessWidget {
  const Taskati({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        onGenerateRoute: AppRoute.route,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashScreen,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskati/core/routes/routes.dart';
import 'package:taskati/feature/auth/presentation/auth_screen.dart';
import 'package:taskati/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:taskati/feature/home/presentation/home_screen.dart';
import 'package:taskati/feature/settings/presentation/settinge_screen.dart';
import 'package:taskati/feature/splash/presentation/splash_screen.dart';

class AppRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case Routes.authScreen:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => AuthCubit(),
              child: AuthScreen(),
            ));

      // case Routes.settingScreen:
      //   return MaterialPageRoute(builder: (_) => SettingeScreen());

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}

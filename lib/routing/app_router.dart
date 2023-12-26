import 'package:bollybood_restorent/features/Home/home.dart';
import 'package:bollybood_restorent/features/sign_in_screen/sign_in_screen.dart';
import 'package:bollybood_restorent/features/sign_up_screen/sign_up_screen.dart';
import 'package:bollybood_restorent/features/splash_screen/splash_screen.dart';
import 'package:bollybood_restorent/features/verify/verify_email.dart';
import 'package:bollybood_restorent/routing/routing_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case splashScreen:
      return CupertinoPageRoute<dynamic>(
        builder: (BuildContext context) => const SplashScreen(),
      );

    case signInScreen:
      return CupertinoPageRoute<dynamic>(
        builder: (BuildContext context) => const SignInScreen(),
      );

    case signUpScreen:
      return CupertinoPageRoute<dynamic>(
        builder: (BuildContext context) => const SignUpScreen(),
      );
    case verifyEmailScreen:
      return CupertinoPageRoute<dynamic>(
        builder: (BuildContext context) => const VerifyEmailScreen(),
      );

    // case appHomeScreen:
    //   return CupertinoPageRoute<dynamic>(
    //     builder: (BuildContext context) => homeScreen(),
    //   );

    default:
      return CupertinoPageRoute<dynamic>(
        builder: (BuildContext context) => Scaffold(
          body: Center(
            child: Text(
              'No route defined for ${routeSettings.name}',
            ),
          ),
        ),
      );
  }
}

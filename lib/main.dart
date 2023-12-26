import 'dart:async';
import 'dart:io';
import 'package:bollybood_restorent/features/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: BollyboodApp(),
    ),
  );
}

class BollyboodApp extends StatelessWidget {
  const BollyboodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bollywood',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}



// class BollyboodApp extends StatelessWidget {
//   const BollyboodApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Bollybood',
//       theme: ThemeData(
//         useMaterial3: true,
//         scaffoldBackgroundColor: colorScaffold,
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: colorGoldenYellow,
//           primary: colorGoldenYellow,
//           secondary: colorPrimaryBlack,
//           brightness: Brightness.light,
//         ),
//       ),
//       debugShowCheckedModeBanner: false,
//       initialRoute: initialScreen,
//       onGenerateRoute: generateRoutes,
//     );
//   }
// }

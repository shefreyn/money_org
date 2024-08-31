import 'package:flutter/material.dart';
import 'package:money_org/pages/camera/camera.dart';
import 'package:money_org/pages/home/dashboard.dart';
import 'package:money_org/pages/splash.dart';
import 'package:money_org/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.splash,
    routes: {
      Routes.splash: (context) => const SplashPage(),
      Routes.dashboard: (context) => const DashboardPage(),
      Routes.camera: (context) => const CameraPage(),
      // Routes.upi: (context) => UPIPage(),
    },
  ));
}

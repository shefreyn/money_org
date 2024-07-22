import 'package:flutter/material.dart';
import 'package:money_org/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => {
        Navigator.pop(context),
        Navigator.pushNamed(context, Routes.dashboard)
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: Center(
        child: Text('Splash Page'),
      ),
    ));
  }
}

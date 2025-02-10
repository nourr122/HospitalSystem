import 'package:flutter/material.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/features/home/presentation/views/home_screen.dart';

class Splash extends StatefulWidget {
  const Splash({
    super.key,
  });

  static const id = '/';

  @override
  State createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1)).then(
      (value) => navigateToNextScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.logo),
          ],
        ),
      ),
    );
  }

  void navigateToNextScreen() {
    Navigator.pushReplacementNamed(
      context,
      HomeScreen.id,
    );
  }
}

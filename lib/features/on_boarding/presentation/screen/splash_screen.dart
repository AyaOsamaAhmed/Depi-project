import 'dart:async';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/core/theme/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      context.go(AppRoutes.onBoarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary900,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [Image.asset('assets/images/logo.png')],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:dipe_freelance/core/di/injection.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/core/theme/app_colors.dart';
import 'package:dipe_freelance/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final authLocalDataSource = getIt<AuthLocalDataSource>();

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () async {
      String? token = await authLocalDataSource.getAccessToken();
      String? userType = await authLocalDataSource.getUserType();

      if (token == null) {
        context.go(AppRoutes.onBoarding);
      } else {
        // Navigate based on userType (1: Freelancer, 2: Client/User)

        if (userType == '1') {
          context.go(AppRoutes.freelanceDashboard);
        } else {
          context.go(AppRoutes.userDashboard);
        }
      }
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

import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/features/on_boarding/presentation/screen/on_boarding_screen.dart';
import 'package:dipe_freelance/features/on_boarding/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.initial,
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('No routes'))),
    routes: [
      GoRoute(
        name: AppRoutes.initial,
        path: AppRoutes.initial,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        name: AppRoutes.onBoarding,
        path: AppRoutes.onBoarding,
        builder: (context, state) => OnBoardingScreen(),
      ),
    ],
  );
}

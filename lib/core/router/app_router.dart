import 'package:dipe_freelance/core/router/app_routes.dart';
<<<<<<< HEAD
import 'package:dipe_freelance/features/on_boarding/presentation/screen/on_boarding_screen.dart';
=======
import 'package:dipe_freelance/features/auth/presentation/views/login_screen.dart';
import 'package:dipe_freelance/features/auth/presentation/views/signup_screen.dart';
>>>>>>> 5b6bbdf330977f2c17b79e49818260c497eec855
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
<<<<<<< HEAD
    initialLocation: AppRoutes.onBoarding,
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('No routes'))),
    routes: [
      GoRoute(
        name: AppRoutes.onBoarding,
        path: AppRoutes.onBoarding,
        builder: (context, state) => OnBoardingScreen(),
=======
    initialLocation: AppRoutes.login,
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.signup,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: AppRoutes.initial,
        builder: (context, state) => Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("h1", style: context.textTheme.headlineMedium),
                Text("h2", style: context.textTheme.headlineMedium),
                Text("h3", style: context.textTheme.headlineMedium),
                Text("h4", style: context.textTheme.headlineMedium),
                Text("bodyL", style: context.textTheme.bodyLarge),
                Text("bodyM", style: context.textTheme.bodyMedium),
                Text("bodyS", style: context.textTheme.bodySmall),
                Text("label", style: context.textTheme.labelLarge),
                Text("smallLabel", style: context.textTheme.labelMedium),
                Text("buttonL", style: context.textTheme.labelLarge),
                Text("buttonS", style: context.textTheme.labelMedium),

                ElevatedButton(
                  onPressed: () {},
                  child: Text(context.local.helloWorld),
                ),
                FilledButton(
                  onPressed: () {},
                  child: Text(context.local.helloWorld),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(context.local.helloWorld),
                ),
              ],
            ),
          ),
        ),
>>>>>>> 5b6bbdf330977f2c17b79e49818260c497eec855
      ),
    ],
  );
}


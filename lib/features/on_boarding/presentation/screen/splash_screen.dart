import 'dart:async';
import 'package:dipe_freelance/core/di/injection.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/core/theme/app_colors.dart';
import 'package:dipe_freelance/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:dipe_freelance/features/on_boarding/presentation/state/splash_cubit.dart';
import 'package:dipe_freelance/features/on_boarding/presentation/state/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(seconds: 3), () async {
      if (mounted) {
        context.read<SplashCubit>().refreshToken();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashChecking) {
          if (state.isLoggin) {
            // Navigate based on userType (1: Freelancer, 2: Client/User)

            if (state.userType == '1') {
              context.go(AppRoutes.freelanceDashboard);
            } else {
              context.go(AppRoutes.userDashboard);
            }
          } else {
            context.go(AppRoutes.onBoarding);
          }
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary900,

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [Image.asset('assets/images/logo.jpeg')],
          ),
        ),
      ),
    );
  }
}

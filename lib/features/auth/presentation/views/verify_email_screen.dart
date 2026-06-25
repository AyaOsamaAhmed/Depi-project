import 'dart:async';
import 'package:dipe_freelance/core/di/injection.dart';
import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/features/auth/presentation/states/verify_email/verify_email_cubit.dart';
import 'package:dipe_freelance/features/auth/presentation/states/verify_email/verify_email_state.dart';
import 'package:dipe_freelance/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class VerifyEmailScreen extends StatefulWidget {
  final String email;
  const VerifyEmailScreen({super.key, required this.email});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  int _seconds = 44;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        timer.cancel();
      } else {
        setState(() => _seconds--);
      }
    });
  }

  void _resetTimer() {
    setState(() => _seconds = 44);
    _startTimer();
  }

  Future<void> _openEmailApp() async {
    final Uri emailUri = Uri(scheme: 'mailto');
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('مش قادر يفتح تطبيق الإيميل'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<VerifyEmailCubit>(),
      child: BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
        listener: (context, state) {
          if (state is VerifyEmailResendSuccess) {
            _resetTimer();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.green,
                ),
              );
          }
          if (state is VerifyEmailFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
          }
        },
        builder: (context, state) {
          final isLoading = state is VerifyEmailLoading;

          return Scaffold(
            backgroundColor: context.colorScheme.surface,
            appBar: AppBar(
              backgroundColor: context.colorScheme.surface,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: context.colorScheme.onSurface,
                ),
                onPressed: () => context.pop(),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                children: [
                  SizedBox(height: 40.h),
                  // Email Icon
                  Container(
                    width: 120.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.mail_outline_rounded,
                      size: 60.sp,
                      color: context.colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    'Verify Your email',
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "We've sent a verification link to\n${widget.email}",
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      'Check your inbox and spam folder',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const Spacer(),
                  // Open Email App Button
                  AuthButton(
                    text: 'Open Email App',
                    isLoading: false,
                    onPressed: _openEmailApp,
                  ),
                  SizedBox(height: 16.h),
                  // Resend Email
                  GestureDetector(
                    onTap: _seconds == 0 && !isLoading
                        ? () => context.read<VerifyEmailCubit>().resendEmail(
                            widget.email,
                          )
                        : null,
                    child: isLoading
                        ? SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: context.colorScheme.primary,
                            ),
                          )
                        : Text(
                            _seconds > 0
                                ? 'Resend Email (00:${_seconds.toString().padLeft(2, '0')})'
                                : 'Resend Email',
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: _seconds > 0
                                  ? Colors.grey
                                  : context.colorScheme.primary,
                              fontWeight: _seconds > 0
                                  ? FontWeight.normal
                                  : FontWeight.bold,
                            ),
                          ),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

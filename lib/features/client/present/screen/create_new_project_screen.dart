import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/features/client/present/widgets/shared_blue_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CreateNewProjectScreen extends StatelessWidget {
  const CreateNewProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF0F2F8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Create New Projects',
          style: context.textTheme.titleLarge?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          children: [
            const Spacer(),
            Container(
              width: 200.w,
              height: 200.w,
              decoration: const BoxDecoration(
                color: Color(0xFFDDE3F0),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: CustomPaint(
                  size: Size(120.w, 96.w),
                  painter: FolderPainter(),
                ),
              ),
            ),
            SizedBox(height: 36.h),
            Text(
              "Let's start a new Projects",
              style: context.textTheme.headlineSmall?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              'Tell us what you need and we well\nhelp you find the best freelancers',
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.black38,
              ),
            ),
            const Spacer(),
            SharedBlueButton(
              text: 'Get Started',
              onPressed: () => context.push(AppRoutes.projectDetails),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}

class FolderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final darkPaint = Paint()..color = const Color(0xFF1E3A5F);
    final midPaint = Paint()..color = const Color(0xFF2D5090);
    final lightPaint = Paint()..color = const Color(0xFF4A72C0);

    final backTabPath = Path()
      ..moveTo(size.width * 0.10, size.height * 0.10)
      ..lineTo(size.width * 0.42, size.height * 0.10)
      ..quadraticBezierTo(
        size.width * 0.48,
        size.height * 0.10,
        size.width * 0.50,
        size.height * 0.20,
      )
      ..lineTo(size.width * 0.54, size.height * 0.28)
      ..lineTo(size.width * 0.10, size.height * 0.28)
      ..close();
    canvas.drawPath(backTabPath, darkPaint);

    final backBodyRect = RRect.fromRectAndCorners(
      Rect.fromLTWH(
        size.width * 0.10,
        size.height * 0.25,
        size.width * 0.88,
        size.height * 0.65,
      ),
      topLeft: const Radius.circular(2),
      topRight: const Radius.circular(8),
      bottomLeft: const Radius.circular(8),
      bottomRight: const Radius.circular(8),
    );
    canvas.drawRRect(backBodyRect, darkPaint);

    final midBodyRect = RRect.fromRectAndCorners(
      Rect.fromLTWH(
        size.width * 0.04,
        size.height * 0.38,
        size.width * 0.88,
        size.height * 0.56,
      ),
      topLeft: const Radius.circular(2),
      topRight: const Radius.circular(8),
      bottomLeft: const Radius.circular(8),
      bottomRight: const Radius.circular(8),
    );
    canvas.drawRRect(midBodyRect, midPaint);

    final midTabPath = Path()
      ..moveTo(size.width * 0.04, size.height * 0.26)
      ..lineTo(size.width * 0.36, size.height * 0.26)
      ..quadraticBezierTo(
        size.width * 0.42,
        size.height * 0.26,
        size.width * 0.44,
        size.height * 0.36,
      )
      ..lineTo(size.width * 0.48, size.height * 0.40)
      ..lineTo(size.width * 0.04, size.height * 0.40)
      ..close();
    canvas.drawPath(midTabPath, midPaint);

    final frontBodyRect = RRect.fromRectAndCorners(
      Rect.fromLTWH(
        size.width * 0.00,
        size.height * 0.52,
        size.width * 0.86,
        size.height * 0.46,
      ),
      topLeft: const Radius.circular(2),
      topRight: const Radius.circular(8),
      bottomLeft: const Radius.circular(8),
      bottomRight: const Radius.circular(8),
    );
    canvas.drawRRect(frontBodyRect, lightPaint);

    final frontTabPath = Path()
      ..moveTo(size.width * 0.00, size.height * 0.40)
      ..lineTo(size.width * 0.32, size.height * 0.40)
      ..quadraticBezierTo(
        size.width * 0.38,
        size.height * 0.40,
        size.width * 0.40,
        size.height * 0.50,
      )
      ..lineTo(size.width * 0.44, size.height * 0.54)
      ..lineTo(size.width * 0.00, size.height * 0.54)
      ..close();
    canvas.drawPath(frontTabPath, lightPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

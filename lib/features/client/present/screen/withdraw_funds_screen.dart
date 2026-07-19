import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WithdrawFundsScreen extends StatefulWidget {
  const WithdrawFundsScreen({super.key});

  @override
  State<WithdrawFundsScreen> createState() => _WithdrawFundsViewState();
}

class _WithdrawFundsViewState extends State<WithdrawFundsScreen> {
  int _selectedMethod = 0;
  final TextEditingController _amountController = TextEditingController(
    text: '1,500.00',
  );

  final List<Map<String, dynamic>> _paymentMethods = [
    {
      'name': 'InstaPay',
      'detail': 'sarahahmed18@instapay',
      'icon': Icons.payment,
    },
    {'name': 'Bank transfer', 'detail': '****4568', 'icon': Icons.credit_card},
    {
      'name': 'PayPal',
      'detail': 'sarahahmed18@paypall',
      'icon': Icons.account_balance_wallet,
    },
  ];

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: context.colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.colorScheme.onSurface),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Withdraw Funds',
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colorScheme.onSurface,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Balance Card
            Container(
              width: double.infinity,
              height: 130.h,
              decoration: BoxDecoration(
                color: context.colorScheme.primary,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(double.infinity, 130.h),
                      painter: _NetworkPatternPainter(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Amount',
                            style: context.textTheme.bodySmall?.copyWith(
                              color: context.colorScheme.onPrimary.withOpacity(
                                0.7,
                              ),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '\$4,250.00',
                            style: context.textTheme.headlineMedium?.copyWith(
                              color: context.colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Available Balance',
                            style: context.textTheme.bodySmall?.copyWith(
                              color: context.colorScheme.onPrimary.withOpacity(
                                0.7,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),
            // Amount Input
            Text(
              'Payment Methods',
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: context.colorScheme.onSurface.withOpacity(0.2),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    '\$',
                    style: context.textTheme.titleLarge?.copyWith(
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.edit_outlined,
                    color: context.colorScheme.onSurface.withOpacity(0.5),
                    size: 20.sp,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: context.colorScheme.primary.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.credit_card_outlined,
                    color: Colors.grey,
                    size: 20.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Payment Methods: \$7,250.00',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'Payment Methods',
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 12.h),
            // Payment Methods List
            ...List.generate(_paymentMethods.length, (index) {
              final method = _paymentMethods[index];
              return GestureDetector(
                onTap: () => setState(() => _selectedMethod = index),
                child: Container(
                  margin: EdgeInsets.only(bottom: 12.h),
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: _selectedMethod == index
                          ? context.colorScheme.primary
                          : context.colorScheme.onSurface.withOpacity(0.1),
                      width: _selectedMethod == index ? 1.5 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 48.w,
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          method['icon'] as IconData,
                          color: context.colorScheme.primary,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              method['name'],
                              style: context.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              method['detail'],
                              style: context.textTheme.bodySmall?.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _selectedMethod == index
                          ? CircleAvatar(
                              radius: 12.r,
                              backgroundColor: context.colorScheme.primary,
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 14.sp,
                              ),
                            )
                          : CircleAvatar(
                              radius: 12.r,
                              backgroundColor: Colors.transparent,
                              child: CircleAvatar(
                                radius: 11.r,
                                backgroundColor: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              );
            }),
            SizedBox(height: 24.h),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 32.h),
        child: SizedBox(
          width: double.infinity,
          height: 56.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Withdraw Now',
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.onPrimary,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NetworkPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pointPaint = Paint()
      ..color = Colors.white.withOpacity(0.25)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final linePaint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..strokeWidth = 0.8;

    final points = [
      Offset(size.width * 0.55, size.height * 0.15),
      Offset(size.width * 0.65, size.height * 0.45),
      Offset(size.width * 0.75, size.height * 0.20),
      Offset(size.width * 0.85, size.height * 0.55),
      Offset(size.width * 0.95, size.height * 0.25),
      Offset(size.width * 0.70, size.height * 0.75),
      Offset(size.width * 0.90, size.height * 0.80),
      Offset(size.width * 0.60, size.height * 0.60),
      Offset(size.width * 0.80, size.height * 0.40),
    ];

    for (int i = 0; i < points.length; i++) {
      for (int j = i + 1; j < points.length; j++) {
        final distance = (points[i] - points[j]).distance;
        if (distance < size.width * 0.28) {
          canvas.drawLine(points[i], points[j], linePaint);
        }
      }
    }

    for (final point in points) {
      canvas.drawCircle(point, 2.5, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

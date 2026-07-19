import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:dipe_freelance/core/extensions/context_extensions.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Local list of mockup transactions based on the screenshot
    final List<_TransactionItemData> transactions = [
      _TransactionItemData(
        title: 'Payment to Sarah Ahmed',
        subtitle: 'Project E-commerce website',
        amount: '\$1,202',
        date:
            'May 10k 2024', // Representing exactly the screenshot / "May 10, 2024" formatted
        isCredit: false,
      ),
      _TransactionItemData(
        title: 'Added Funds',
        subtitle: 'Via Visa ****4242',
        amount: '\$1,202',
        date: 'May 10, 2024',
        isCredit: true,
      ),
      _TransactionItemData(
        title: 'Payment to Sarah Ahmed',
        subtitle: 'Project E-commerce website',
        amount: '\$1,202',
        date: 'May 10, 2024',
        isCredit: false,
      ),
      _TransactionItemData(
        title: 'Added Funds',
        subtitle: 'Via Visa ****4242',
        amount: '\$1,202',
        date: 'May 10, 2024',
        isCredit: true,
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FE),
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'Payment',
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 22.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Blue Wallet Balance Card
            Container(
              width: double.infinity,
              height: 170.h,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF072146), Color(0xFF0F3973)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF072146).withAlpha(51),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Stack(
                  children: [
                    // Network Particle Background Painter
                    Positioned.fill(
                      child: CustomPaint(painter: _NetworkPatternPainter()),
                    ),
                    // Card contents
                    Padding(
                      padding: EdgeInsets.all(15.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Wallet Balance',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            'Available to spend',
                            style: TextStyle(
                              color: Colors.white.withAlpha(153),
                              fontSize: 10.sp,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            '\$4,250.00',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          // Action Buttons Row
                          Row(
                            children: [
                              // Add Funds Button
                              ElevatedButton(
                                onPressed: () {
                                  // Action
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color(0xFF072146),
                                  elevation: 0,
                                  shadowColor: Colors.transparent,
                                  minimumSize: Size(100.w, 36.h),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                ),
                                child: Text(
                                  '+ Add Funds',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12.w),
                              // Send Payment Button
                              OutlinedButton(
                                onPressed: () {
                                  // Action
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  side: const BorderSide(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                  minimumSize: Size(110.w, 36.h),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                ),
                                child: Text(
                                  'Send Payment',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32.h),
            // Section Title
            Text(
              'Recent Transactions',
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 17.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.h),
            // White Rounded Transactions Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.015),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 8.h),
                itemCount: transactions.length,
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Divider(height: 1.h, color: Colors.grey[100]),
                ),
                itemBuilder: (context, index) {
                  final tx = transactions[index];
                  return _TransactionItem(data: tx);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TransactionItemData {
  final String title;
  final String subtitle;
  final String amount;
  final String date;
  final bool isCredit;

  _TransactionItemData({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.date,
    required this.isCredit,
  });
}

class _TransactionItem extends StatelessWidget {
  final _TransactionItemData data;

  const _TransactionItem({required this.data});

  @override
  Widget build(BuildContext context) {
    // Deciding colors & icons based on credit vs debit
    final Color iconBgColor = data.isCredit
        ? const Color(0xFFE8F7F0) // Light green
        : const Color(0xFFFFEFE5); // Light peach/orange
    final Color iconColor = data.isCredit
        ? const Color(0xFF2ECC71) // Nice green
        : const Color(0xFFFF7F37); // Nice orange
    final IconData icon = data.isCredit
        ? Icons.arrow_upward_rounded
        : Icons.arrow_downward_rounded;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        children: [
          // Circular rounded-rect Icon container
          Container(
            width: 48.r,
            height: 48.r,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Icon(icon, color: iconColor, size: 24.r),
            ),
          ),
          SizedBox(width: 14.w),
          // Transaction Text Description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  data.subtitle,
                  style: TextStyle(fontSize: 11.sp, color: Colors.grey[500]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          // Amount & Date
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${data.isCredit ? '+' : '-'}${data.amount}',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: data.isCredit
                      ? const Color(0xFF2ECC71) // green for credit
                      : Colors.black, // black for debit
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                data.date,
                style: TextStyle(fontSize: 11.sp, color: Colors.grey[400]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Particle/network line painter block
class _NetworkPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pointPaint = Paint()
      ..color = Colors.white.withAlpha(46)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final linePaint = Paint()
      ..color = Colors.white.withAlpha(20)
      ..strokeWidth = 0.8;

    final points = [
      Offset(size.width * 0.15, size.height * 0.20),
      Offset(size.width * 0.35, size.height * 0.15),
      Offset(size.width * 0.25, size.height * 0.55),
      Offset(size.width * 0.45, size.height * 0.40),
      Offset(size.width * 0.55, size.height * 0.15),
      Offset(size.width * 0.65, size.height * 0.50),
      Offset(size.width * 0.75, size.height * 0.20),
      Offset(size.width * 0.85, size.height * 0.60),
      Offset(size.width * 0.95, size.height * 0.25),
      Offset(size.width * 0.60, size.height * 0.80),
      Offset(size.width * 0.80, size.height * 0.85),
      Offset(size.width * 0.40, size.height * 0.80),
    ];

    for (int i = 0; i < points.length; i++) {
      for (int j = i + 1; j < points.length; j++) {
        final distance = (points[i] - points[j]).distance;
        if (distance < size.width * 0.26) {
          canvas.drawLine(points[i], points[j], linePaint);
        }
      }
    }

    for (final point in points) {
      canvas.drawCircle(point, 2.0, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

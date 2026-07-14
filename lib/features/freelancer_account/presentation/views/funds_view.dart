import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/finance_cubit.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/finance_state.dart';
import 'package:dipe_freelance/core/di/injection.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:go_router/go_router.dart';

class FundsView extends StatefulWidget {
  const FundsView({super.key});

  @override
  State<FundsView> createState() => _FundsViewState();
}

class _FundsViewState extends State<FundsView> {
  int _selectedMethodIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<FinanceCubit>(),
      child: BlocListener<FinanceCubit, FinanceState>(
        listener: (context, state) {
          if (state is WithdrawalSuccess) {
            context.push(AppRoutes.rateClient);
          }
        },
        child: BlocBuilder<FinanceCubit, FinanceState>(
          builder: (context, state) {
            if (state is FinanceLoading) {
              return const Scaffold(
                  body: Center(child: CircularProgressIndicator()));
            }
            return Scaffold(
              backgroundColor: const Color(0xFFF8F9FD),
              appBar: AppBar(
                backgroundColor: const Color(0xFFF8F9FD),
                elevation: 0,
                surfaceTintColor: Colors.transparent,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
                centerTitle: true,
                title: Text(
                  context.local.withdrawFunds,
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBalanceCard(context),
                    SizedBox(height: 24.h),
                    const _SectionHeader(title: 'Withdrawal Amount'),
                    SizedBox(height: 12.h),
                    _buildAmountInput(),
                    SizedBox(height: 16.h),
                    _buildInfoBanner(),
                    SizedBox(height: 24.h),
                    const _SectionHeader(title: 'Payment Methods'),
                    SizedBox(height: 16.h),
                    _buildPaymentMethodsList(),
                    SizedBox(height: 40.h),
                    _buildWithdrawButton(context, state),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBalanceCard(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: const LinearGradient(
          colors: [Color(0xFF061B3B), Color(0xFF14305D)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // Pattern Background (Simulated with icons or opacity)
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: CustomPaint(
                painter: _NetworkPainter(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.local.amount,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  '\$4,250.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  context.local.availableBalance,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmountInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Text(
            '\$',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF061B3B),
            ),
          ),
          SizedBox(width: 12.w),
          Text(
            '1,500.00',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF061B3B),
            ),
          ),
          const Spacer(),
          Icon(Icons.edit_note, color: const Color(0xFF061B3B), size: 28.sp),
        ],
      ),
    );
  }

  Widget _buildInfoBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F1FF),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(Icons.account_balance_wallet_outlined,
              size: 20.r, color: const Color(0xFF061B3B).withOpacity(0.6)),
          SizedBox(width: 12.w),
          Text(
            'Payment Methods: \$ 7,250.00',
            style: TextStyle(
              fontSize: 12.sp,
              color: const Color(0xFF061B3B).withOpacity(0.8),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodsList() {
    return Column(
      children: [
        _buildPaymentMethodItem(
          index: 0,
          title: 'InstaPay',
          subtitle: 'sarahahmed18@instapay',
          icon: Icons.bolt,
          iconColor: Colors.deepPurple,
        ),
        SizedBox(height: 12.h),
        _buildPaymentMethodItem(
          index: 1,
          title: 'Bank transfer',
          subtitle: '****4568',
          icon: Icons.credit_card,
          iconColor: Colors.black,
        ),
        SizedBox(height: 12.h),
        _buildPaymentMethodItem(
          index: 2,
          title: 'PayPal',
          subtitle: 'sarahahmed18@paypal.com',
          icon: Icons.payment_rounded,
          iconColor: Colors.blue.shade800,
        ),
      ],
    );
  }

  Widget _buildPaymentMethodItem({
    required int index,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
  }) {
    bool isSelected = _selectedMethodIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedMethodIndex = index),
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEBF2FF) : Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF061B3B)
                : Colors.black.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, color: iconColor, size: 28.r),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF061B3B),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 24.r,
              height: 24.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF061B3B),
                  width: 2,
                ),
                color: isSelected ? const Color(0xFF061B3B) : Colors.white,
              ),
              child: isSelected
                  ? Icon(Icons.check, color: Colors.white, size: 16.r)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWithdrawButton(BuildContext context, FinanceState state) {
    return ElevatedButton(
      onPressed: state is WithdrawalInProgress
          ? null
          : () {
              context.read<FinanceCubit>().withdrawFunds();
            },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0D2C54),
        minimumSize: Size(double.infinity, 56.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        elevation: 0,
      ),
      child: state is WithdrawalInProgress
          ? const CircularProgressIndicator(color: Colors.white)
          : Text(
              context.local.withdrawNow,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF061B3B),
      ),
    );
  }
}

class _NetworkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.0;

    // Draw some random lines to simulate a network
    canvas.drawLine(Offset(0, size.height * 0.2),
        Offset(size.width * 0.3, size.height * 0.8), paint);
    canvas.drawLine(Offset(size.width * 0.1, size.height * 0.5),
        Offset(size.width * 0.6, size.height * 0.2), paint);
    canvas.drawLine(Offset(size.width * 0.4, size.height * 0.7),
        Offset(size.width * 0.9, size.height * 0.4), paint);
    canvas.drawLine(Offset(size.width, size.height * 0.1),
        Offset(size.width * 0.7, size.height * 0.9), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

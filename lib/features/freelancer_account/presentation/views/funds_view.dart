import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/finance_cubit.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/finance_state.dart';

class FundsView extends StatefulWidget {
  const FundsView({super.key});

  @override
  State<FundsView> createState() => _FundsViewState();
}

class _FundsViewState extends State<FundsView> {
  int _selectedMethodIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinanceCubit, FinanceState>(
      builder: (context, state) {
        if (state is FinanceLoading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        return Scaffold(
          backgroundColor: context.colorScheme.surface,
          appBar: AppBar(
            backgroundColor: context.colorScheme.surface,
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            centerTitle: true,
            title: Text(
              context.local.withdrawFunds,
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAmountCard(context),
                SizedBox(height: 32.h),
                _buildSectionHeader(context.local.paymentMethods),
                SizedBox(height: 16.h),
                _buildPaymentMethodsList(),
                SizedBox(height: 48.h),
                _buildWithdrawButton(context, state),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAmountCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0D2C54), Color(0xFF1E4B8A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0D2C54).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.local.amount,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '\$4,250.00',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            context.local.availableBalance,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _buildPaymentMethodsList() {
    return Column(
      children: [
        _buildPaymentMethodItem(
          index: 0,
          title: context.local.instaPay,
          subtitle: 'sarahahmed18@instapay',
          icon: Icons.flash_on_rounded,
          iconColor: Colors.purple,
        ),
        SizedBox(height: 16.h),
        _buildPaymentMethodItem(
          index: 1,
          title: context.local.bankTransfer,
          subtitle: '****4568',
          icon: Icons.credit_card_rounded,
          iconColor: Colors.blue,
        ),
        SizedBox(height: 16.h),
        _buildPaymentMethodItem(
          index: 2,
          title: context.local.payPal,
          subtitle: 'sarahahmed18@paypal.com',
          icon: Icons.payment_rounded,
          iconColor: Colors.indigo,
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
            color: isSelected ? AppColors.primary700 : context.colorScheme.onSurface.withOpacity(0.1),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: context.colorScheme.onSurface.withOpacity(0.05)),
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
                    style: context.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
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
                  color: isSelected ? AppColors.primary700 : Colors.grey.withOpacity(0.5),
                  width: 2,
                ),
                color: isSelected ? AppColors.primary700 : Colors.transparent,
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
        backgroundColor: AppColors.primary700,
        minimumSize: Size(double.infinity, 56.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 0,
      ),
      child: state is WithdrawalInProgress
          ? const CircularProgressIndicator(color: Colors.white)
          : Text(
              context.local.withdrawNow,
              style: context.textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
    );
  }
}

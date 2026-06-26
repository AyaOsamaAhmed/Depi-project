import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/finance_cubit.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/finance_state.dart';
import 'package:dipe_freelance/core/di/injection.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:go_router/go_router.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<FinanceCubit>(),
      child: BlocBuilder<FinanceCubit, FinanceState>(
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
                context.local.earnings,
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
                  _buildBalanceCard(context),
                  SizedBox(height: 32.h),
                  _buildSectionHeader(context.local.transactions),
                  SizedBox(height: 16.h),
                  _buildTransactionsList(context),
                  SizedBox(height: 48.h),
                  _buildWithdrawButton(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBalanceCard(BuildContext context) {
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
            context.local.availableBalance,
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
            '${context.local.pending} \$120.00',
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

  Widget _buildTransactionsList(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildTransactionItem(
            context,
            'Mobile App Design',
            'May 25, 2026',
            '\$1,500',
          ),
          _buildDivider(),
          _buildTransactionItem(
            context,
            'Mobile App Design',
            'May 25, 2026',
            '\$1,500',
          ),
          _buildDivider(),
          _buildTransactionItem(
            context,
            'Website Development',
            'May 25, 2026',
            '\$750',
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(
    BuildContext context,
    String title,
    String date,
    String amount,
  ) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE5D0),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.grid_view_rounded,
              color: const Color(0xFFE67E22),
              size: 28.r,
            ),
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
                  date,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Divider(height: 1, color: Colors.grey.withOpacity(0.1)),
    );
  }

  Widget _buildWithdrawButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.push(AppRoutes.funds);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary700,
        minimumSize: Size(double.infinity, 56.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 0,
      ),
      child: Text(
        context.local.withdrawFunds,
        style: context.textTheme.titleMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
      ),
    );
  }
}
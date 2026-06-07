import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/features/client/present/states/contract_cubit.dart';
import 'package:dipe_freelance/features/client/present/states/contract_state.dart';
import 'package:dipe_freelance/features/client/present/widgets/shared_blue_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ReleasePaymentScreen extends StatelessWidget {
  const ReleasePaymentScreen({super.key});

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
          'Release Payment',
          style: context.textTheme.titleLarge?.copyWith(
            color: context.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ContractCubit, ContractState>(
        builder: (context, state) {
          if (state is PaymentReleased) {
            return _buildContent(context, state);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, PaymentReleased state) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24.w),
            child: Column(
              children: [
                SizedBox(height: 32.h),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: 130.w,
                      height: 130.h,
                      decoration: BoxDecoration(
                        color: context.colorScheme.primary.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.account_balance_wallet,
                        size: 70.sp,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    Container(
                      width: 36.w,
                      height: 36.h,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Text(
                  'Payment Released!',
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  '\$${state.amount.toInt()} has been released to ${state.freelancerName}',
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 32.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Payment Summary',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                _buildSummaryRow(context, 'Milestone', state.milestoneTitle),
                _buildSummaryRow(
                  context,
                  'Amount',
                  '\$${state.amount.toInt()}',
                ),
                _buildSummaryRow(context, 'Date', state.date),
                _buildSummaryRow(
                  context,
                  'Transaction ID',
                  state.transactionId,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.w),
          child: SharedBlueButton(
            text: 'Get Started',
            onPressed: () => context.go(AppRoutes.userDashboard),
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(BuildContext context, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colorScheme.onSurface,
            ),
          ),
          Text(
            value,
            style: context.textTheme.bodyMedium?.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

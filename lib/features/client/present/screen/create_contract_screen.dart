import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/features/client/domain/entities/contract_entity.dart';
import 'package:dipe_freelance/features/client/present/states/contract_cubit.dart';
import 'package:dipe_freelance/features/client/present/states/contract_state.dart';
import 'package:dipe_freelance/features/client/present/widgets/shared_blue_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CreateContractScreen extends StatelessWidget {
  const CreateContractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ContractCubit()..loadContract(),
      child: const _CreateContractView(),
    );
  }
}

class _CreateContractView extends StatelessWidget {
  const _CreateContractView();

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
          'Create Contract',
          style: context.textTheme.titleLarge?.copyWith(
            color: context.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ContractCubit, ContractState>(
        builder: (context, state) {
          if (state is ContractLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ContractLoaded) {
            return _buildContent(context, state.contract);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, ContractEntity contract) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Project Summary',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        contract.projectTitle,
                        style: context.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE0CC),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          contract.projectType,
                          style: const TextStyle(color: Color(0xFFE07B3A)),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Budget',
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '\$${contract.budget.toInt()}',
                                style: context.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 40.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Duration',
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '${contract.durationDays} Days',
                                style: context.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  'Milestones',
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 12.h),
                Container(
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: contract.milestones.length,
                    separatorBuilder: (_, __) => Divider(height: 1.h),
                    itemBuilder: (context, index) {
                      final milestone = contract.milestones[index];
                      return ListTile(
                        contentPadding: EdgeInsets.all(16.w),
                        leading: Container(
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE0CC),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                color: const Color(0xFFE07B3A),
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          milestone.title,
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          milestone.dueDate,
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 12,
                          ),
                        ),
                        trailing: Text(
                          '\$${milestone.amount.toInt()}',
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.w),
          child: SharedBlueButton(
            text: 'Create Contract',
            onPressed: () => context.push(AppRoutes.projectProgress),
          ),
        ),
      ],
    );
  }
}

import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/jobs_cubit.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/jobs_state.dart';
import 'package:dipe_freelance/core/di/injection.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/proposal_send_view.dart';
import 'package:file_picker/file_picker.dart';

class SubmitProposalView extends StatefulWidget {
  const SubmitProposalView({super.key});

  @override
  State<SubmitProposalView> createState() => _SubmitProposalViewState();
}

class _SubmitProposalViewState extends State<SubmitProposalView> {
  late final TextEditingController _proposalController;
  late final TextEditingController _amountController;
  late final TextEditingController _timeController;
  String _selectedTimeUnit = 'Day';

  @override
  void initState() {
    super.initState();
    _proposalController = TextEditingController();
    _amountController = TextEditingController(text: '7');
    _timeController = TextEditingController(text: '7');
    _proposalController.addListener(() => setState(() {}));
    _amountController.addListener(() => setState(() {}));
    _timeController.addListener(() => setState(() {}));
  }

  bool get _isFormValid =>
      _proposalController.text.trim().isNotEmpty &&
      _amountController.text.trim().isNotEmpty &&
      _timeController.text.trim().isNotEmpty;

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        // You can handle the picked file here
        // For now, we'll just print the name
        debugPrint('Picked file: ${result.files.single.name}');
      }
    } catch (e) {
      debugPrint('Error picking file: $e');
    }
  }

  @override
  void dispose() {
    _proposalController.dispose();
    _amountController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<JobsCubit>(),
      child: BlocListener<JobsCubit, JobsState>(
        listener: (context, state) {
          if (state is ProposalSubmitSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProposalSendView()),
            );
          }
        },
        child: Scaffold(
          backgroundColor: context.colorScheme.surface,
          appBar: AppBar(
            backgroundColor: context.colorScheme.surface,
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            title: Text(
              context.local.submitProposal,
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionHeader(context.local.yourProposal),
                SizedBox(height: 12.h),
                _buildProposalField(),
                SizedBox(height: 24.h),
                _buildSectionHeader(context.local.bidAmount),
                SizedBox(height: 12.h),
                _buildSimpleTextField(_amountController),
                SizedBox(height: 24.h),
                _buildSectionHeader(context.local.deliveryTime),
                SizedBox(height: 12.h),
                _buildDeliveryTimeField(),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    _buildSectionHeader(context.local.attachments),
                    SizedBox(width: 8.w),
                    Text(
                      '(${context.local.optional})',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onSurface.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                _buildAttachments(),
                SizedBox(height: 48.h),
                BlocBuilder<JobsCubit, JobsState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: (state is ProposalSubmitting || !_isFormValid)
                          ? null
                          : () {
                              context.read<JobsCubit>().submitProposal();
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary700,
                        disabledBackgroundColor: AppColors.primary700.withOpacity(0.5),
                        minimumSize: Size(double.infinity, 56.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 0,
                      ),
                      child: state is ProposalSubmitting
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                              context.local.submitProposal,
                              style: context.textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: context.colorScheme.onSurface.withOpacity(0.8),
      ),
    );
  }

  Widget _buildProposalField() {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: context.colorScheme.onSurface.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _proposalController,
            maxLines: 5,
            maxLength: 200,
            decoration: InputDecoration(
              hintText: context.local.writeProposalHint,
              hintStyle: TextStyle(
                fontSize: 12.sp,
                color: context.colorScheme.onSurface.withOpacity(0.4),
              ),
              contentPadding: EdgeInsets.all(16.r),
              border: InputBorder.none,
              counterText: '', // Hide default counter
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '${_proposalController.text.length}/200',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: context.colorScheme.onSurface.withOpacity(0.4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: context.colorScheme.onSurface.withOpacity(0.2),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: context.colorScheme.onSurface.withOpacity(0.2),
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveryTimeField() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: TextField(
            controller: _timeController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: context.colorScheme.onSurface.withOpacity(0.2),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: context.colorScheme.onSurface.withOpacity(0.2),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          flex: 2,
          child: Container(
            height: 54.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: context.colorScheme.onSurface.withOpacity(0.2),
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedTimeUnit,
                isExpanded: true,
                items: ['Day', 'Week', 'Month']
                    .map(
                      (item) =>
                          DropdownMenuItem(value: item, child: Text(item)),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedTimeUnit = value!;
                  });
                },
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: context.colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAttachments() {
    return GestureDetector(
      onTap: _pickFile,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: context.colorScheme.onSurface.withOpacity(0.03),
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(
            color: context.colorScheme.onSurface.withOpacity(0.1),
          ),
        ),
        child: Text(
          context.local.file,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: context.colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}

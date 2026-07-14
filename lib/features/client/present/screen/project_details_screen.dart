import 'dart:io';
import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/features/client/present/widgets/input_text_field.dart';
import 'package:dipe_freelance/features/client/present/widgets/shared_blue_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class ProjectDetailsPage extends StatefulWidget {
  const ProjectDetailsPage({super.key});

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  final TextEditingController _requirementsController = TextEditingController();
  final List<File> _attachments = [];
  int _charCount = 0;

  // text field selections
  String? _selectedCategory = 'Web Development';
  String? _selectedProjectType = 'Fixed Price';
  String? _selectedBudget = r'$2000-$3000';

  @override
  void initState() {
    super.initState();
    _requirementsController.addListener(() {
      setState(() {
        _charCount = _requirementsController.text.length;
      });
    });
  }

  @override
  void dispose() {
    _requirementsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          context.local.projectDetails,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category
                  _buildLabel(context.local.category),
                  const SizedBox(height: 8),
                  textFieldWidget(hintText: _selectedCategory ?? ''),
                  const SizedBox(height: 20),

                  // Project Type
                  _buildLabel(context.local.projectType),
                  const SizedBox(height: 8),
                  textFieldWidget(hintText: _selectedProjectType ?? ''),
                  const SizedBox(height: 20),

                  // Project Title
                  _buildLabel(context.local.projectTitle),
                  const SizedBox(height: 8),
                  textFieldWidget(hintText: 'E-commerce Website'),
                  const SizedBox(height: 20),

                  // Budget
                  _buildLabel(context.local.budget),
                  const SizedBox(height: 8),
                  textFieldWidget(hintText: _selectedBudget ?? ''),
                  const SizedBox(height: 20),

                  // Recent Requirements
                  _buildLabel(context.local.recentRequirements),
                  const SizedBox(height: 8),
                  _buildRequirementsField(),
                  const SizedBox(height: 20),

                  // Attachments
                  _buildAttachmentsSection(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),

          // Bottom CTA Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: SharedBlueButton(
              text: context.local.getAIPrediction,
              onPressed: () {
                context.push(AppRoutes.priceBreakdown);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildRequirementsField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Stack(
        children: [
          TextField(
            controller: _requirementsController,
            maxLines: 5,
            maxLength: 1000,
            buildCounter:
                (_, {required currentLength, required isFocused, maxLength}) =>
                    null,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
            decoration: const InputDecoration(
              hintText: 'Describe your requirements...',
              hintStyle: TextStyle(color: Colors.black38, fontSize: 14),
              contentPadding: EdgeInsets.fromLTRB(14, 14, 14, 32),
              border: InputBorder.none,
            ),
          ),
          Positioned(
            bottom: 10,
            right: 12,
            child: Text(
              '$_charCount/1000',
              style: const TextStyle(fontSize: 11, color: Colors.black38),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttachmentsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Attachments',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              TextSpan(
                text: '  (Optional)',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black45,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            // Add file button
            GestureDetector(
              onTap: _pickFile,
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFD4B8A8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 22),
              ),
            ),
            const SizedBox(width: 10),
            // File label
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
              child: const Text(
                'File',
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _pickFile() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('File picker not yet integrated.')),
    );
  }
}

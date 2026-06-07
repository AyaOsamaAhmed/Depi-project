import 'dart:io';
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

  // Dropdown selections
  String? _selectedCategory = 'Web Development';
  String? _selectedProjectType = 'Fixed Price';
  String? _selectedBudget = r'$2000-$3000';

  final List<String> _categories = [
    'Web Development',
    'Mobile Development',
    'UI/UX Design',
    'Data Science',
    'DevOps',
    'Other',
  ];

  final List<String> _projectTypes = [
    'Fixed Price',
    'Hourly Rate',
    'Milestone Based',
  ];

  final List<String> _budgets = [
    r'$500-$1000',
    r'$1000-$2000',
    r'$2000-$3000',
    r'$3000-$5000',
    r'$5000+',
  ];

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
      backgroundColor: const Color(0xFFF5F0EE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F0EE),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text(
          'Project Details',
          style: TextStyle(
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
                  _buildLabel('Category'),
                  const SizedBox(height: 8),
                  _buildDropdown(
                    value: _selectedCategory,
                    items: _categories,
                    onChanged: (val) => setState(() => _selectedCategory = val),
                  ),
                  const SizedBox(height: 20),

                  // Project Type
                  _buildLabel('Project Type'),
                  const SizedBox(height: 8),
                  _buildDropdown(
                    value: _selectedProjectType,
                    items: _projectTypes,
                    onChanged: (val) =>
                        setState(() => _selectedProjectType = val),
                  ),
                  const SizedBox(height: 20),

                  // Project Title
                  _buildLabel('Project Title'),
                  const SizedBox(height: 8),
                  _buildTextField(hintText: 'E-commerce Website'),
                  const SizedBox(height: 20),

                  // Budget
                  _buildLabel('Budget'),
                  const SizedBox(height: 8),
                  _buildDropdown(
                    value: _selectedBudget,
                    items: _budgets,
                    onChanged: (val) => setState(() => _selectedBudget = val),
                  ),
                  const SizedBox(height: 20),

                  // Recent Requirements
                  _buildLabel('Recent Requirements'),
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
          _buildBottomButton(),
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

  Widget _buildTextField({
    required String hintText,
    TextEditingController? controller,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 14, color: Colors.black87),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black54, fontSize: 14),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 14,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
          style: const TextStyle(fontSize: 14, color: Colors.black87),
          onChanged: onChanged,
          items: items
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
        ),
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

  Widget _buildBottomButton() {
    return Container(
      color: const Color(0xFFF5F0EE),
      padding: EdgeInsets.fromLTRB(
        20,
        12,
        20,
        MediaQuery.of(context).padding.bottom + 16,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          onPressed: _onGetPricePrediction,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1C1C2E),
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: const Text(
            'Get AI price prediction',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ),
    );
  }

  void _pickFile() {
    // TODO: integrate file_picker package
    // Example:
    // final result = await FilePicker.platform.pickFiles();
    // if (result != null) {
    //   setState(() => _attachments.add(File(result.files.single.path!)));
    // }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('File picker not yet integrated.')),
    );
  }

  void _onGetPricePrediction() {
    // TODO: call your AI pricing API here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Fetching AI price prediction...')),
    );
  }
}

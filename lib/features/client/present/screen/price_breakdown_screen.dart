import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/features/client/present/widgets/shared_blue_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PriceBreakdownScreen extends StatelessWidget {
  const PriceBreakdownScreen({super.key});

  static const List<PriceBreakdownItem> _breakdownItems = [
    PriceBreakdownItem(label: 'Project Management', range: '\$600 – \$800'),
    PriceBreakdownItem(label: 'Design', range: '\$600 – \$800'),
    PriceBreakdownItem(label: 'Development', range: '\$700 – \$1,000'),
    PriceBreakdownItem(label: 'Testing', range: '\$600 – \$900'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F7FB),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF111111)),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: Text(
          context.local.aiPricePrediction,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Color(0xFF111111),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _BudgetCard(),
                    const SizedBox(height: 28),
                    _BreakdownSection(items: _breakdownItems),
                    const SizedBox(height: 20),
                    _NoteBox(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: SharedBlueButton(
                text: context.local.publishProject,
                onPressed: () {
                  context.push(AppRoutes.projectPublish);
                },
              ),
            ),

            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}

class _BudgetCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF2FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.local.aiEstimatedBudget,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xFF3A5BCF),
              letterSpacing: 0.8,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '\$2,500 – \$3,500',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111111),
              letterSpacing: -0.5,
            ),
          ),
          SizedBox(height: 6),
          Text(
            context.local.basedOnProjectRequirementsAndMarketData,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF888888),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class _BreakdownSection extends StatelessWidget {
  final List<PriceBreakdownItem> items;

  const _BreakdownSection({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.local.priceBreakdown,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Color(0xFF111111),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFE8E5E0), width: 0.5),
          ),
          child: Column(
            children: items.asMap().entries.map((entry) {
              final isLast = entry.key == items.length - 1;
              return _BreakdownRow(item: entry.value, showDivider: !isLast);
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _BreakdownRow extends StatelessWidget {
  final PriceBreakdownItem item;
  final bool showDivider;

  const _BreakdownRow({required this.item, required this.showDivider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.label,
                style: const TextStyle(fontSize: 14, color: Color(0xFF444444)),
              ),
              Text(
                item.range,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF111111),
                ),
              ),
            ],
          ),
        ),
        if (showDivider)
          const Divider(
            height: 0.5,
            thickness: 0.5,
            color: Color(0xFFF0F0F4),
            indent: 16,
            endIndent: 16,
          ),
      ],
    );
  }
}

class _NoteBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF2FA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.auto_awesome, size: 18, color: Color(0xFF3A5BCF)),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              context.local.basedOnProjectRequirementsAndMarketData,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF555555),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PublishButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF112244),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          context.local.publishProject,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),
      ),
    );
  }
}

class PriceBreakdownItem {
  final String label;
  final String range;

  const PriceBreakdownItem({required this.label, required this.range});
}

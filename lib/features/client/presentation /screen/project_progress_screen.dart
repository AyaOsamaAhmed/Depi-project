import 'package:dipe_freelance/features/client/domain/entities/contract_entity.dart';
import 'package:dipe_freelance/features/client/domain/entities/milestone_entity.dart';
import 'package:dipe_freelance/features/client/presentation%20/states/contract_cubit.dart';
import 'package:dipe_freelance/features/client/presentation%20/states/contract_state.dart';
import 'package:dipe_freelance/features/client/presentation%20/screen/milestone_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocBuilder, BlocProvider, ReadContext;

class ProjectProgressScreen extends StatelessWidget {
  const ProjectProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F6FA),
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Project Progress',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ContractCubit, ContractState>(
        builder: (context, state) {
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
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Overall Progress
                const Text(
                  'Overall Progress',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${(contract.overallProgress * 100).toInt()}%',
                      style: const TextStyle(
                        color: Color(0xFF1A2340),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${(contract.overallProgress * 100).toInt()}%',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                LinearProgressIndicator(
                  value: contract.overallProgress,
                  backgroundColor: Colors.grey[300],
                  color: const Color(0xFF1A2340),
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(4),
                ),
                const SizedBox(height: 24),
                // Current Milestone
                const Text(
                  'Current Milestones',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                _buildCurrentMilestone(contract.milestones[1]),
                const SizedBox(height: 24),
                // All Milestones
                const Text(
                  'Milestones',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 12),
                ...contract.milestones.map(
                  (m) => _buildMilestoneItem(context, m),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A2340),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: context.read<ContractCubit>(),
                      child: const MilestoneReviewScreen(),
                    ),
                  ),
                );
              },
              child: const Text(
                'Message Freelancer',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCurrentMilestone(MilestoneEntity milestone) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          milestone.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'In Progress\nDue In 5 days',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            Text(
              '${(milestone.progress * 100).toInt()}%',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 6),
        LinearProgressIndicator(
          value: milestone.progress,
          backgroundColor: Colors.grey[300],
          color: const Color(0xFF1A2340),
          minHeight: 8,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }

  Widget _buildMilestoneItem(BuildContext context, MilestoneEntity milestone) {
    final isCompleted = milestone.status == 3;
    final color = isCompleted ? Colors.green : const Color(0xFF1A2340);

    return GestureDetector(
      onTap: () {
        if (!isCompleted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: context.read<ContractCubit>(),
                child: MilestoneReviewScreen(milestone: milestone),
              ),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: color,
              child: const Icon(Icons.check, color: Colors.white, size: 16),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    milestone.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    isCompleted ? 'Completed' : 'In Progress',
                    style: TextStyle(
                      color: isCompleted ? Colors.green : Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: milestone.progress,
                    backgroundColor: Colors.grey[300],
                    color: isCompleted ? Colors.green : const Color(0xFF1A2340),
                    minHeight: 6,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '${(milestone.progress * 100).toInt()}%',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

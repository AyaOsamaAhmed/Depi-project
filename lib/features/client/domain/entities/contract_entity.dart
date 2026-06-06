import 'milestone_entity.dart';

class ContractEntity {
  final String id;
  final String projectTitle;
  final String projectType;
  final double budget;
  final int durationDays;
  final double overallProgress;
  final String freelancerName;
  final List<MilestoneEntity> milestones;

  const ContractEntity({
    required this.id,
    required this.projectTitle,
    required this.projectType,
    required this.budget,
    required this.durationDays,
    required this.overallProgress,
    required this.freelancerName,
    required this.milestones,
  });
}

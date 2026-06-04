class MilestoneEntity {
  final String id;
  final String title;
  final double amount;
  final String dueDate;
  final int status; // 1=Pending, 2=InProgress, 3=Completed
  final double progress;
  final String? deliverables;

  const MilestoneEntity({
    required this.id,
    required this.title,
    required this.amount,
    required this.dueDate,
    required this.status,
    required this.progress,
    this.deliverables,
  });
}

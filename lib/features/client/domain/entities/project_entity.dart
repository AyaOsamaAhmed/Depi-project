class ProjectEntity {
  final String id;
  final String title;
  final double budget;
  final String status; // 'In Progress', 'Completed', 'Pending'
  final String category;

  const ProjectEntity({
    required this.id,
    required this.title,
    required this.budget,
    required this.status,
    required this.category,
  });
}

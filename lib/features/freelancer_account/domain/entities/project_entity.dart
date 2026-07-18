class ProjectEntity {
  final String id;
  final String title;
  final String description;
  final double budgetMin;
  final double budgetMax;
  final int type;
  final int status;
  final int requiredLevel;
  final String createdAt;
  final String ownerName;
  final String? categoryName;
  final String? skills;

  const ProjectEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.budgetMin,
    required this.budgetMax,
    required this.type,
    required this.status,
    required this.requiredLevel,
    required this.createdAt,
    required this.ownerName,
    this.categoryName,
    this.skills,
  });

  String get experienceLevel {
    switch (requiredLevel) {
      case 1:
        return 'Entry';
      case 2:
        return 'Intermediate';
      case 3:
        return 'Expert';
      default:
        return 'Any';
    }
  }

  String get priceRange => '\$${budgetMin.toInt()} - \$${budgetMax.toInt()}';
}

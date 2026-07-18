import '../../domain/entities/project_entity.dart';

class ProjectApiModel extends ProjectEntity {
  const ProjectApiModel({
    required super.id,
    required super.title,
    required super.description,
    required super.budgetMin,
    required super.budgetMax,
    required super.type,
    required super.status,
    required super.requiredLevel,
    required super.createdAt,
    required super.ownerName,
    super.categoryName,
    super.skills,
  });

  factory ProjectApiModel.fromJson(Map<String, dynamic> json) =>
      ProjectApiModel(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        budgetMin: (json['budgetMin'] ?? 0).toDouble(),
        budgetMax: (json['budgetMax'] ?? 0).toDouble(),
        type: json['type'] ?? 1,
        status: json['status'] ?? 1,
        requiredLevel: json['requiredLevel'] ?? 1,
        createdAt: json['createdAt'] ?? '',
        ownerName: json['ownerName'] ?? '',
        categoryName: json['categoryName'],
        skills: json['skills'],
      );
}

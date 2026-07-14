import 'package:equatable/equatable.dart';

abstract class ProjectHistoryState extends Equatable {
  const ProjectHistoryState();

  @override
  List<Object?> get props => [];
}

class ProjectHistoryInitial extends ProjectHistoryState {}

class ProjectHistoryLoading extends ProjectHistoryState {}

class ProjectHistoryLoaded extends ProjectHistoryState {
  final List<ProjectHistoryModel> projects;

  const ProjectHistoryLoaded(this.projects);

  @override
  List<Object?> get props => [projects];
}

class ProjectHistoryError extends ProjectHistoryState {
  final String message;

  const ProjectHistoryError(this.message);

  @override
  List<Object?> get props => [message];
}

class ProjectHistoryModel {
  final String title;
  final String clientName;
  final String proposedDate;
  final String budget;
  final String lastUpdate;
  final String status; // 'In Progress', 'Rejected', 'Accepted', 'Invited'
  final String iconPath;

  const ProjectHistoryModel({
    required this.title,
    required this.clientName,
    required this.proposedDate,
    required this.budget,
    required this.lastUpdate,
    required this.status,
    required this.iconPath,
  });

  ProjectHistoryModel copyWith({
    String? title,
    String? clientName,
    String? proposedDate,
    String? budget,
    String? lastUpdate,
    String? status,
    String? iconPath,
  }) {
    return ProjectHistoryModel(
      title: title ?? this.title,
      clientName: clientName ?? this.clientName,
      proposedDate: proposedDate ?? this.proposedDate,
      budget: budget ?? this.budget,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      status: status ?? this.status,
      iconPath: iconPath ?? this.iconPath,
    );
  }
}

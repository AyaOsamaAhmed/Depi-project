import 'package:dipe_freelance/features/freelancer_account/domain/entities/category_entity.dart';
import 'package:dipe_freelance/features/freelancer_account/domain/entities/project_entity.dart';

abstract class JobsState {}

class JobsInitial extends JobsState {}

class JobsLoading extends JobsState {}

class JobsLoaded extends JobsState {
  final List<ProjectEntity> projects;
  final List<CategoryEntity> categories;
  final String? selectedCategory;

  JobsLoaded({
    required this.projects,
    required this.categories,
    this.selectedCategory,
  });
}

class JobsError extends JobsState {
  final String message;
  JobsError(this.message);
}

class ProposalSubmitting extends JobsState {}

class ProposalSubmitSuccess extends JobsState {}

class ProposalSubmitFailure extends JobsState {
  final String error;
  ProposalSubmitFailure(this.error);
}

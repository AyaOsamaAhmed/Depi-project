import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/project_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit() : super(ProjectInitial());

  Future<void> fetchProjects() async {
    emit(ProjectLoading());
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    emit(ProjectLoaded());
  }

  Future<void> submitWork() async {
    emit(WorkSubmitting());
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    emit(WorkSubmitSuccess());
  }

  Future<void> submitRating(int rating) async {
    emit(RatingInProgress());
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    emit(RatingSuccess());
  }
}

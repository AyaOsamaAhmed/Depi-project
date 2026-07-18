import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_jobs_usecase.dart';
import '../../domain/usecases/get_categories_usecase.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/jobs_state.dart';

@injectable
class JobsCubit extends Cubit<JobsState> {
  final GetJobsUseCase _getJobsUseCase;
  final GetCategoriesUseCase _getCategoriesUseCase;

  JobsCubit(this._getJobsUseCase, this._getCategoriesUseCase)
    : super(JobsInitial());

  Future<void> loadJobs({String? search}) async {
    emit(JobsLoading());

    final jobsResult = await _getJobsUseCase(search: search);
    final categoriesResult = await _getCategoriesUseCase();

    jobsResult.fold((failure) => emit(JobsError(failure.message)), (projects) {
      categoriesResult.fold(
        (failure) => emit(JobsLoaded(projects: projects, categories: [])),
        (categories) =>
            emit(JobsLoaded(projects: projects, categories: categories)),
      );
    });
  }

  Future<void> searchJobs(String query) async {
    await loadJobs(search: query.isEmpty ? null : query);
  }

  fetchJobDetails(String s) {}

  void submitProposal() {}
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/jobs_state.dart';

class JobsCubit extends Cubit<JobsState> {
  JobsCubit() : super(JobsInitial());

  Future<void> fetchJobDetails(String jobId) async {
    emit(JobsLoading());
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    emit(JobsLoaded());
  }

  Future<void> submitProposal() async {
    emit(ProposalSubmitting());
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    emit(ProposalSubmitSuccess());
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/freelancer_state.dart';

class FreelancerCubit extends Cubit<FreelancerState> {
  FreelancerCubit() : super(FreelancerInitial());

  Future<void> fetchDashboardData() async {
    emit(FreelancerLoading());
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    emit(FreelancerSuccess());
  }

  Future<void> fetchAnalytics() async {
    emit(AnalyticsLoading());
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    emit(AnalyticsLoaded());
  }

  Future<void> saveProfile() async {
    emit(FreelancerLoading());
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    emit(FreelancerSuccess());
  }
}

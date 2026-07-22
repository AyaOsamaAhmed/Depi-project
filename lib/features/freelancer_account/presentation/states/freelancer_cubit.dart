import 'package:dipe_freelance/core/di/injection.dart';
import 'package:dipe_freelance/core/errors/failures.dart';
import 'package:dipe_freelance/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:dipe_freelance/features/auth/domain/usecases/refresh_token.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/freelancer_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class FreelancerCubit extends Cubit<FreelancerState> {
  final AuthLocalDataSource _authLocalDataSource;

  FreelancerCubit(this._authLocalDataSource) : super(FreelancerInitial());

  Future<void> logout() async {
    await _authLocalDataSource.clearAuthData();
  }

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

  @override
  void emit(FreelancerState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}

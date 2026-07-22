import 'package:dipe_freelance/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'client_profile_state.dart';

@injectable
class ClientProfileCubit extends Cubit<ClientProfileState> {
  final AuthLocalDataSource _authLocalDataSource;
  ClientProfileCubit(this._authLocalDataSource) : super(ClientProfileInitial());

  Future<void> logout() async {
    await _authLocalDataSource.clearAuthData();
  }

  Future<void> loadProfile() async {
    emit(ClientProfileLoading());
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 400));
    emit(
      ClientProfileSuccess(
        name: 'Aya Ahmed',
        company: 'Startup Hub Ltd.',
        email: 'ayaClient@gmail.com',
        location: 'Cairo, Egypt',
        phone: '+20 123 456 7890',
        balance: 4250.00,
      ),
    );
  }

  Future<void> updateProfile({
    required String name,
    required String company,
    required String email,
    required String location,
    required String phone,
  }) async {
    if (state is ClientProfileSuccess) {
      final current = state as ClientProfileSuccess;
      emit(ClientProfileLoading());
      await Future.delayed(const Duration(milliseconds: 500));
      emit(
        current.copyWith(
          name: name,
          company: company,
          email: email,
          location: location,
          phone: phone,
        ),
      );
    }
  }

  @override
  void emit(ClientProfileState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}

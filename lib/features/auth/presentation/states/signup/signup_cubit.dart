import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecases/register_usecase.dart';
import 'signup_state.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  final RegisterUseCase _registerUseCase;

  // بيانات مؤقتة
  String? _email;
  String? _password;
  String? _firstName;
  String? _lastName;

  SignupCubit(this._registerUseCase) : super(SignupInitial());

  // Step 1 — تخزين الداتا من شاشة الـ signup
  void collectData({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) {
    _email = email;
    _password = password;
    _firstName = firstName;
    _lastName = lastName;
    emit(SignupDataCollected());
  }

  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required int userType,
  }) async {
    emit(SignupLoading());

    final result = await _registerUseCase.call(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      userType: userType,
      gender: 0,
      dateOfBirth: '2000-01-01',
      phoneNumber: '',
      countryId: 1,
    );

    result.fold(
      (failure) => emit(SignupFailure(failure.message)),
      (auth) => emit(SignupSuccess()),
    );
  }
}

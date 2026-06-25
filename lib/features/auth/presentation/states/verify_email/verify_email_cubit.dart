import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecases/resend_verify_email_usecase.dart';
import 'verify_email_state.dart';

@injectable
class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final ResendVerifyEmailUseCase _resendVerifyEmailUseCase;

  VerifyEmailCubit(this._resendVerifyEmailUseCase)
    : super(VerifyEmailInitial());

  Future<void> resendEmail(String email) async {
    emit(VerifyEmailLoading());

    final result = await _resendVerifyEmailUseCase(email);

    result.fold(
      (failure) => emit(VerifyEmailFailure(failure.message)),
      (_) => emit(VerifyEmailResendSuccess('تم إرسال رابط التحقق مرة أخرى')),
    );
  }
}

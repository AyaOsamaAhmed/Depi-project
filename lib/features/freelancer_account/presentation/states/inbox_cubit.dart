import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/inbox_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class InboxCubit extends Cubit<InboxState> {
  InboxCubit() : super(InboxInitial());

  Future<void> fetchMessages() async {
    emit(InboxLoading());
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    emit(InboxLoaded());
  }

  Future<void> sendMessage(String text) async {
    // Logic for sending message
    emit(MessageSending());
    await Future.delayed(const Duration(milliseconds: 500));
    emit(MessageSent());
  }
}

abstract class InboxState {}

class InboxInitial extends InboxState {}

class InboxLoading extends InboxState {}

class InboxLoaded extends InboxState {}

class InboxError extends InboxState {
  final String message;
  InboxError(this.message);
}

class MessageSending extends InboxState {}

class MessageSent extends InboxState {}

class MessageFailure extends InboxState {
  final String error;
  MessageFailure(this.error);
}

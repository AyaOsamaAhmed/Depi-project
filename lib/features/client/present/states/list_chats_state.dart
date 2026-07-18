import 'package:equatable/equatable.dart';

abstract class ListChatsState extends Equatable {
  const ListChatsState();

  @override
  List<Object> get props => [];
}

class ListChatsInitial extends ListChatsState {}

class ListChatsLoading extends ListChatsState {}

class ListChatsSuccess extends ListChatsState {
  final List<Map<String, String>> chats;

  const ListChatsSuccess(this.chats);

  @override
  List<Object> get props => [chats];
}

class ListChatsError extends ListChatsState {
  final String message;

  const ListChatsError(this.message);

  @override
  List<Object> get props => [message];
}

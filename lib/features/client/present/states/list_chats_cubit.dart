import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:dipe_freelance/features/client/present/states/list_chats_state.dart';

@injectable
class ListChatsCubit extends Cubit<ListChatsState> {
  ListChatsCubit() : super(ListChatsInitial());

  Future<void> fetchMessages() async {
    emit(ListChatsLoading());
    // Simulate API call and mock data
    await Future.delayed(const Duration(milliseconds: 800));
    final mockChats = [
      {
        'name': 'Sarah Ahmed',
        'lastMessage': 'Can i help you?',
        'time': '11.30 pm',
        'imageUrl':
            'https://img.freepik.com/free-photo/portrait-young-businesswoman-standing-modern-office-holding-digital-tablet_231208-10651.jpg',
      },
      {
        'name': 'Sarah Ahmed',
        'lastMessage': 'Can i help you?',
        'time': '11.30 pm',
        'imageUrl':
            'https://img.freepik.com/free-photo/portrait-young-businesswoman-standing-modern-office-holding-digital-tablet_231208-10651.jpg',
      },
      {
        'name': 'Sarah Ahmed',
        'lastMessage': 'Can i help you?',
        'time': '11.30 pm',
        'imageUrl':
            'https://img.freepik.com/free-photo/portrait-young-businesswoman-standing-modern-office-holding-digital-tablet_231208-10651.jpg',
      },
      {
        'name': 'Sarah Ahmed',
        'lastMessage': 'Can i help you?',
        'time': '11.30 pm',
        'imageUrl':
            'https://img.freepik.com/free-photo/portrait-young-businesswoman-standing-modern-office-holding-digital-tablet_231208-10651.jpg',
      },
      {
        'name': 'Sarah Ahmed',
        'lastMessage': 'Can i help you?',
        'time': '11.30 pm',
        'imageUrl':
            'https://img.freepik.com/free-photo/portrait-young-businesswoman-standing-modern-office-holding-digital-tablet_231208-10651.jpg',
      },
    ];
    emit(ListChatsSuccess(mockChats));
  }

  @override
  void emit(ListChatsState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}

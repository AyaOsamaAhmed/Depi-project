import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/notifications_state.dart';

@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());

  Future<void> fetchNotifications() async {
    emit(NotificationsLoading());
    // Simulate API call and mock data
    await Future.delayed(const Duration(milliseconds: 800));
    final mockNotifications = [
      {
        'title': 'New job match for UI/UX designer',
        'time': '3h ago',
      },
      {
        'title': 'Your proposal was viewed',
        'time': '3h ago',
      },
      {
        'title': 'Payment of \$400 received',
        'time': '3h ago',
      },
      {
        'title': 'Your proposal was viewed',
        'time': '3h ago',
      },
    ];
    emit(NotificationsSuccess(mockNotifications));
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'user_dashboard_state.dart';

@injectable
class UserDashboardCubit extends Cubit<UserDashboardState> {
  UserDashboardCubit() : super(UserDashboardInitial());
}

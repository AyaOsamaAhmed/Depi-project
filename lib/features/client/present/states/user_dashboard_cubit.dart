import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:dipe_freelance/features/client/domain/entities/project_entity.dart';
import 'user_dashboard_state.dart';

@injectable
class UserDashboardCubit extends Cubit<UserDashboardState> {
  UserDashboardCubit() : super(UserDashboardInitial());

  void loadDashboard() {
    emit(UserDashboardLoading());
    emit(
      UserDashboardSuccess(
        userName: 'Aya',
        totalSpent: 4250.00,
        monthlyChange: 12,
        inProgress: 3,
        completed: 4,
        pending: 1,
        recentProjects: [
          ProjectEntity(
            id: '1',
            title: 'Mobile App Design',
            budget: 1500,
            status: 'In Progress',
            category: 'design',
          ),
          ProjectEntity(
            id: '2',
            title: 'Mobile App Design',
            budget: 1500,
            status: 'In Progress',
            category: 'design',
          ),
          ProjectEntity(
            id: '3',
            title: 'Website Development',
            budget: 750,
            status: 'Pending',
            category: 'development',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/project_history_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProjectHistoryCubit extends Cubit<ProjectHistoryState> {
  ProjectHistoryCubit() : super(ProjectHistoryInitial());

  List<ProjectHistoryModel> _projects = [];

  Future<void> fetchHistory() async {
    emit(ProjectHistoryLoading());
    await Future.delayed(const Duration(seconds: 1));
    
    _projects = [
      const ProjectHistoryModel(
        title: 'E-commerce Website',
        clientName: 'Startup Hub',
        proposedDate: 'May 10, 2026',
        budget: '\$1,202',
        lastUpdate: '4 days ago',
        status: 'In Progress',
        iconPath: 'assets/images/e_commerce_icon.png',
      ),
      const ProjectHistoryModel(
        title: 'Mobile App design',
        clientName: 'Startup Hub',
        proposedDate: 'May 10, 2026',
        budget: '\$1,202',
        lastUpdate: '4 days ago',
        status: 'Rejected',
        iconPath: 'assets/images/mobile_app_icon.png',
      ),
      const ProjectHistoryModel(
        title: 'Dashboard UI/UX design',
        clientName: 'Startup Hub',
        proposedDate: 'May 10, 2026',
        budget: '\$1,202',
        lastUpdate: '4 days ago',
        status: 'Accepted',
        iconPath: 'assets/images/dashboard_icon.png',
      ),
      const ProjectHistoryModel(
        title: 'E-commerce Website',
        clientName: 'Startup Hub',
        proposedDate: 'May 10, 2026',
        budget: '\$1,202',
        lastUpdate: '4 days ago',
        status: 'In Progress',
        iconPath: 'assets/images/e_commerce_icon.png',
      ),
      const ProjectHistoryModel(
        title: 'Dashboard UI/UX design',
        clientName: 'Startup Hub',
        proposedDate: 'May 10, 2026',
        budget: '\$1,202',
        lastUpdate: '4 days ago',
        status: 'Invited',
        iconPath: 'assets/images/dashboard_icon.png',
      ),
    ];

    emit(ProjectHistoryLoaded(_projects));
  }

  void declineInvite(String projectTitle) {
    if (state is ProjectHistoryLoaded) {
      _projects = _projects.map((p) {
        if (p.title == projectTitle && p.status == 'Invited') {
          return p.copyWith(status: 'Declined');
        }
        return p;
      }).toList();
      emit(ProjectHistoryLoaded(_projects));
    }
  }

  void acceptInvite(String projectTitle) {
    if (state is ProjectHistoryLoaded) {
      _projects = _projects.map((p) {
        if (p.title == projectTitle && p.status == 'Invited') {
          return p.copyWith(status: 'Accepted');
        }
        return p;
      }).toList();
      emit(ProjectHistoryLoaded(_projects));
    }
  }

  @override
  void emit(ProjectHistoryState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}

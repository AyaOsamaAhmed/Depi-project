import 'package:dipe_freelance/features/client/presentation/states/freelance_dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class FreelanceDashboardCubit extends Cubit<FreelanceDashboardState> {
  FreelanceDashboardCubit() : super(FreelanceDashboardInitial());
}

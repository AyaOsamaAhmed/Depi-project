import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'freelance_dashboard_state.dart';

@injectable
class FreelanceDashboardCubit extends Cubit<FreelanceDashboardState> {
  FreelanceDashboardCubit() : super(FreelanceDashboardInitial());
}

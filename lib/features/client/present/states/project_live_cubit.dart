import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'project_live_state.dart';

@injectable
class ProjectLiveCubit extends Cubit<ProjectLiveState> {
  ProjectLiveCubit() : super(ProjectLiveInitial());
}

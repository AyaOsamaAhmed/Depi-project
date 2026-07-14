import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'project_publish_state.dart';

@injectable
class ProjectPublishCubit extends Cubit<ProjectPublishState> {
  ProjectPublishCubit() : super(ProjectPublishInitial());
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:dipe_freelance/features/auth/presentation/states/verify_email/verify_email_cubit.dart'
    as _i1036;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/datasources/auth_local_datasource.dart'
    as _i992;
import '../../features/auth/data/datasources/auth_remote_datasource.dart'
    as _i161;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/forgot_password_usecase.dart'
    as _i560;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/register_usecase.dart' as _i941;
import '../../features/auth/domain/usecases/resend_verify_email_usecase.dart'
    as _i821;
import '../../features/auth/presentation/states/forgot_password/forgot_password_cubit.dart'
    as _i568;
import '../../features/auth/presentation/states/login/login_cubit.dart'
    as _i911;
import '../../features/auth/presentation/states/signup/signup_cubit.dart'
    as _i748;
import '../../features/client/present/states/freelance_dashboard_cubit.dart'
    as _i249;
import '../../features/client/present/states/project_live_cubit.dart' as _i213;

import '../../features/freelancer_account/presentation/states/finance_cubit.dart'
    as _i548;
import '../../features/freelancer_account/presentation/states/freelancer_cubit.dart'
    as _i245;
import '../../features/freelancer_account/presentation/states/inbox_cubit.dart'
    as _i512;
import '../../features/freelancer_account/presentation/states/jobs_cubit.dart'
    as _i354;
import '../../features/freelancer_account/presentation/states/messages_cubit.dart'
    as _i866;
import '../../features/freelancer_account/presentation/states/notifications_cubit.dart'
    as _i493;
import '../../features/freelancer_account/presentation/states/project_cubit.dart'
    as _i105;
import '../../features/freelancer_account/presentation/states/project_history_cubit.dart'
    as _i992;
import '../network/api_consumer.dart' as _i931;
import '../network/dio_consumer.dart' as _i802;
import 'network_module.dart' as _i567;
import 'storage_module.dart' as _i371;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    final storageModule = _$StorageModule();
    gh.factory<_i249.FreelanceDashboardCubit>(
      () => _i249.FreelanceDashboardCubit(),
    );
    gh.factory<_i213.ProjectLiveCubit>(() => _i213.ProjectLiveCubit());
    gh.factory<_i245.FreelancerCubit>(() => _i245.FreelancerCubit());
    gh.factory<_i512.InboxCubit>(() => _i512.InboxCubit());
    gh.factory<_i354.JobsCubit>(() => _i354.JobsCubit());
    gh.factory<_i866.MessagesCubit>(() => _i866.MessagesCubit());
    gh.factory<_i493.NotificationsCubit>(() => _i493.NotificationsCubit());
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i558.FlutterSecureStorage>(() => storageModule.storage);
    gh.lazySingleton<_i548.FinanceCubit>(() => _i548.FinanceCubit());
    gh.lazySingleton<_i105.ProjectCubit>(() => _i105.ProjectCubit());
    gh.lazySingleton<_i992.ProjectHistoryCubit>(
      () => _i992.ProjectHistoryCubit(),
    );
    gh.lazySingleton<_i992.AuthLocalDataSource>(
      () => _i992.AuthLocalDataSourceImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i161.AuthRemoteDataSource>(
      () => _i161.AuthRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i931.ApiConsumer>(
      () => _i802.DioConsumer(client: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        remoteDataSource: gh<_i161.AuthRemoteDataSource>(),
        localDataSource: gh<_i992.AuthLocalDataSource>(),
      ),
    );
    gh.factory<_i560.ForgotPasswordUseCase>(
      () => _i560.ForgotPasswordUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i188.LoginUseCase>(
      () => _i188.LoginUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i941.RegisterUseCase>(
      () => _i941.RegisterUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i821.ResendVerifyEmailUseCase>(
      () => _i821.ResendVerifyEmailUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i911.LoginCubit>(
      () => _i911.LoginCubit(gh<_i188.LoginUseCase>()),
    );
    gh.factory<_i1036.VerifyEmailCubit>(
      () => _i1036.VerifyEmailCubit(gh<_i821.ResendVerifyEmailUseCase>()),
    );
    gh.factory<_i568.ForgotPasswordCubit>(
      () => _i568.ForgotPasswordCubit(gh<_i560.ForgotPasswordUseCase>()),
    );
    gh.factory<_i748.SignupCubit>(
      () => _i748.SignupCubit(gh<_i941.RegisterUseCase>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i567.NetworkModule {}

class _$StorageModule extends _i371.StorageModule {}

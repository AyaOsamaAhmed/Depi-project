import 'package:dipe_freelance/features/client/present/screen/list_projects_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/message_view.dart';
import 'package:flutter/material.dart';
import 'package:dipe_freelance/core/router/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dipe_freelance/core/localization/l10n/app_localizations.dart';
import 'package:dipe_freelance/core/di/injection.dart';
import 'package:dipe_freelance/core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Dipe Freelance',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          // Start App Using GoRouter
          // routerConfig: AppRouter.router,
          home:
              const ListProjectsView(), // اكتب اسم الصفحة اللي عايز تجربها هنا
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('en'),
        );
      },
    );
  }
}

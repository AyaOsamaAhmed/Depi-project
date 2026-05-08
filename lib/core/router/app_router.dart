import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.initial,
    routes: [
      GoRoute(
        path: AppRoutes.initial,
        builder: (context, state) => Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("h1", style: context.textTheme.headlineMedium),
                Text("h2", style: context.textTheme.headlineMedium),
                Text("h3", style: context.textTheme.headlineMedium),
                Text("h4", style: context.textTheme.headlineMedium),
                Text("bodyL", style: context.textTheme.bodyLarge),
                Text("bodyM", style: context.textTheme.bodyMedium),
                Text("bodyS", style: context.textTheme.bodySmall),
                Text("label", style: context.textTheme.labelLarge),
                Text("smallLabel", style: context.textTheme.labelMedium),
                Text("buttonL", style: context.textTheme.labelLarge),
                Text("buttonS", style: context.textTheme.labelMedium),

                ElevatedButton(
                  onPressed: () {},
                  child: Text(context.local.helloWorld),
                ),
                FilledButton(
                  onPressed: () {},
                  child: Text(context.local.helloWorld),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(context.local.helloWorld),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

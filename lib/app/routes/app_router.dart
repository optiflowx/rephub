import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rephub/app/routes/app_routes.dart';
import 'package:rephub/features/home/home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppRouter {
  AppRouter._();

  static String initialLocation() {
    final session = Supabase.instance.client.auth.currentSession;

    return switch (session?.user.id) {
      null => AppRoutes.home, // TODO(Prince): Change to login
      _ => AppRoutes.home,
    };
  }

  static List<RouteBase> routes() {
    return [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
    ];
  }

  static final router = GoRouter(
    errorBuilder: (context, state) {
      return const Placeholder();
    },
    routes: routes(),
  );
}

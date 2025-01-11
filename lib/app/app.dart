import 'package:flutter/material.dart';
import 'package:rephub/app/routes/app_router.dart';
import 'package:rephub/app/services/system_ui_service.dart';
import 'package:rephub/app/theme/theme.dart';
import 'package:rephub/main.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    SystemUIService.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      // showPerformanceOverlay: true,
      // showSemanticsDebugger: true,
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
      title: 'RepHub - Medical Representative App',
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
    );
  }
}

import 'package:clean_architecture_rest_api_template/common/routes/main_router.dart';
import 'package:clean_architecture_rest_api_template/dependencies/authenticated_dependency_provider.dart';
import 'package:clean_architecture_rest_api_template/dependencies/dependency_manager.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final router = sl.get<MainRouter>();
    return AuthenticatedDependencyProvider(
      child: Navigator(
        key: router.key,
        observers: [HeroController()],
        initialRoute: MainRouter.base,
        onGenerateRoute: router.getRoute,
      ),
    );
  }
}

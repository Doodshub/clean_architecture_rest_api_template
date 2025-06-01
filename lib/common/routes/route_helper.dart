import 'package:clean_architecture_rest_api_template/common/routes/main_router.dart';
import 'package:clean_architecture_rest_api_template/common/routes/onboarding_router.dart';
import 'package:clean_architecture_rest_api_template/common/routes/root_router.dart';
import 'package:clean_architecture_rest_api_template/dependencies/dependency_manager.dart';
import 'package:flutter/material.dart';

typedef RouteBuilder = Route<dynamic> Function({RouteSettings? settings});

abstract class AppRouter {
  String get name;
}

/// The class which oversees every route states and it serves as helper to any
/// UI components that need it.
class RouteHelper {
  @protected
  RootRouter get rootRouter => sl<RootRouter>();

  @protected
  MainRouter get mainRouter => sl<MainRouter>();

  @protected
  OnboardingRouter get onboardingRouter => sl<OnboardingRouter>();

  /// ROOT routes
  /// ************************************************************

  /// MAIN routes
  /// ************************************************************
  void navigateToBaseScreen() {
    mainRouter.key.currentState?.pushReplacementNamed(MainRouter.base);
  }

  void showHomeScreen() {
    mainRouter.key.currentState?.pushNamed(MainRouter.home);
  }

  void popToPreviousPage({dynamic result}) {
    if (mainRouter.key.currentState?.canPop() ?? false) {
      mainRouter.key.currentState?.pop(result);
    }
  }

  // defaults
  void popMainToRoot() {
    mainRouter.key.currentState?.popUntil((route) => route.isFirst);
  }

  /// ONBOARDING routes
  /// ************************************************************
  ///

  void showLoginScreen() {
    onboardingRouter.key.currentState?.pushNamed(OnboardingRouter.login);
  }

  void showRegisterScreen() {
    onboardingRouter.key.currentState?.pushNamed(OnboardingRouter.register);
  }
}

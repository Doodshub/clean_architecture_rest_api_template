import 'package:clean_architecture_template/clean_architecture_template.dart';
import 'package:flutter/material.dart';

typedef RouteBuilder = Route<dynamic> Function({RouteSettings? settings});

abstract class AppRouter {
  String get name;

  /// Add a new route to this router.
  /// Override this method in your router implementation.
  void addRoute(String routeName, RouteBuilder builder);
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

  /// Navigate to any registered route in the MainRouter
  ///
  /// Example:
  /// ```dart
  /// sl<RouteHelper>().navigate(AppRoutes.bibleReader);
  /// sl<RouteHelper>().navigate('/profile', arguments: user);
  /// ```
  void navigate(String routeName, {Object? arguments}) {
    mainRouter.key.currentState?.pushNamed(routeName, arguments: arguments);
  }

  /// Navigate and replace the current route
  ///
  /// Example:
  /// ```dart
  /// sl<RouteHelper>().navigateAndReplace(AppRoutes.home);
  /// ```
  void navigateAndReplace(String routeName, {Object? arguments}) {
    mainRouter.key.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
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
}

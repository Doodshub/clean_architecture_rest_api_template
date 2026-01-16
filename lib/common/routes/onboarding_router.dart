import 'dart:collection';

import 'package:clean_architecture_template/clean_architecture_template.dart';
import 'package:flutter/cupertino.dart';

/// Router for unauthenticated (onboarding) routes
///
/// Consumers should register their authentication flow routes via addRoute().
class OnboardingRouter implements AppRouter {
  @override
  String get name => "onboarding";

  final GlobalKey<NavigatorState> key = GlobalKey();

  // Routes are empty by default - consumers must register routes
  final LinkedHashMap<String, RouteBuilder> routes =
      LinkedHashMap<String, RouteBuilder>();

  /// Add a custom route to this router.
  @override
  void addRoute(String routeName, RouteBuilder builder) {
    routes[routeName] = builder;
  }

  /// The route being passed in [Navigator]'s onGenerateRoute
  Route getRoute(RouteSettings settings) {
    final route = routes[settings.name];
    assert(
      route != null,
      "Route '${settings.name}' is not declared in OnboardingRouter",
    );
    return route!(settings: settings);
  }

  static Route<T> _buildRoute<T>(
    Widget child, {
    required RouteSettings? settings,
    bool fullScreenDialog = false,
  }) {
    return CupertinoPageRoute<T>(
      settings: settings,
      fullscreenDialog: fullScreenDialog,
      builder: (context) {
        return child;
      },
    );
  }
}

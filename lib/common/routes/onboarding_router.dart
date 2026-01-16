import 'dart:collection';

import 'package:clean_architecture_template/common/routes/route_helper.dart';
import 'package:flutter/cupertino.dart';

class OnboardingRouter implements AppRouter {
  @override
  String get name => "onboarding";

  final GlobalKey<NavigatorState> key = GlobalKey();

  static const String login = 'login';
  static const String register = 'register';
  static const String flashCardPreference = 'flashCardPreference';

  final LinkedHashMap<String, RouteBuilder>
  routes = LinkedHashMap.from(<String, RouteBuilder>{
    login: ({settings}) => _buildRoute(const SizedBox(), settings: settings),
    register: ({settings}) => _buildRoute(const SizedBox(), settings: settings),
  });

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
      "Route '\${settings.name}' is not declared in OnboardingRouter",
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

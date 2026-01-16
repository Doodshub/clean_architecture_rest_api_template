import 'package:clean_architecture_template/clean_architecture_template.dart';
import 'package:flutter/material.dart';

typedef RouteBuilder = Route<dynamic> Function({RouteSettings? settings});

/// Abstract base class for all routers in the application.
///
/// Extend this class to create custom routers in your consuming app.
///
/// Example:
/// ```dart
/// class ProductRouter implements AppRouter {
///   @override
///   String get name => "product";
///
///   final GlobalKey<NavigatorState> key = GlobalKey();
///   static const String list = 'list';
///   static const String detail = 'detail';
///
///   final LinkedHashMap<String, RouteBuilder> routes = LinkedHashMap.from({
///     list: ({settings}) => CupertinoPageRoute(builder: (_) => ProductListScreen()),
///     detail: ({settings}) => CupertinoPageRoute(builder: (_) => ProductDetailScreen()),
///   });
///
///   void addRoute(String name, RouteBuilder builder) {
///     routes[name] = builder;
///   }
///
///   Route getRoute(RouteSettings settings) {
///     final route = routes[settings.name];
///     assert(route != null, "Route $name is not declared in ${this.name}");
///     return route!(settings: settings);
///   }
/// }
/// ```
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

import 'dart:collection';

import 'package:clean_architecture_rest_api_template/common/routes/route_helper.dart';
import 'package:flutter/material.dart';

class RootRouter implements AppRouter {
  @override
  String get name => "root";

  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  // Indicate route endpoints here
  static const String root = '/';

  late LinkedHashMap<String, RouteBuilder> routes = LinkedHashMap();

  Route getRoute(RouteSettings settings) {
    final route = routes[settings.name];
    assert(route != null, "Route is not declared");
    return route!(settings: settings);
  }
}

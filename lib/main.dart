import 'dart:async';
import 'dart:developer';

import 'package:clean_architecture_template/main_app.dart';
import 'package:clean_architecture_template/dependencies/dependency_manager.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // Initialize depedency injection
      final DependencyManager dependencyManager;

      dependencyManager = DependencyManager();

      await dependencyManager.init().onError((error, stackTrace) {
        debugPrint("DEPENDENCY MANAGEMENT ERROR: $error $stackTrace");
      });

      runApp(MainApp(dependencyManager: dependencyManager));
    },
    (error, stack) async {
      log(error.toString());
    },
  );
}

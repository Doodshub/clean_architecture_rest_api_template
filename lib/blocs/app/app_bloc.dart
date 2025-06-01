import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture_rest_api_template/common/const/preference_keys.dart';
import 'package:clean_architecture_rest_api_template/dependencies/dependency_manager.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBloc extends Cubit<AppState> {
  AppBloc() : super(AppState());

  Future<void> initializeApp(DependencyManager dependencyManager) async {
    emit(
      state.copyWith(initialized: false, error: null, showSplashScreen: true),
    );

    // Fake splash screen
    await Future.delayed(const Duration(seconds: 2));

    // to make sure dependencies were initialized well
    // before we proceed to the next screen
    // this is to avoid any errors that might occur
    if (dependencyManager.initialized == true) {
      await onColdStart();
      emit(state.copyWith(initialized: true, showSplashScreen: false));
      return;
    }

    try {
      await dependencyManager.init();
      await onColdStart();
      emit(state.copyWith(initialized: true, showSplashScreen: false));
    } catch (e, stackTrace) {
      Logger().e(
        "DEPENDENCY ERROR WENT HERE",
        error: e,
        stackTrace: stackTrace,
      );
      emit(state.copyWith(error: e, showSplashScreen: false));
    }
  }

  /// Verify if the app is a fresh install
  Future<void> verifyFreshInstall() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final isFreshInstall =
        sharedPreferences.getBool(PreferenceKeys.isFreshInstall) ?? true;

    if (isFreshInstall) {
      sl<Logger>().i("Fresh install");
      await sharedPreferences.setBool(PreferenceKeys.isFreshInstall, true);
      emit(state.copyWith(isFreshInstall: true));
    }
  }

  Future<void> setFreshInstall(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(PreferenceKeys.isFreshInstall, value);
    emit(state.copyWith(isFreshInstall: value));
  }

  /// Verify if the app is a fresh install
  Future<void> verifyAllUserPreferences() async {}

  Future<void> onColdStart() async {
    // Verify fresh install
    await verifyFreshInstall();
    await verifyAllUserPreferences();
  }
}

class AppState {
  final bool initialized;
  final dynamic error;
  final bool? showSplashScreen;
  final bool? isSavingUserPreference;
  final bool? isFreshInstall;

  AppState({
    this.initialized = false,
    this.showSplashScreen = false,
    this.error,
    this.isSavingUserPreference,
    this.isFreshInstall,
  });

  AppState copyWith({
    bool? initialized,
    dynamic error,
    bool? showSplashScreen,
    bool? isSavingUserPreference,
    bool? isFreshInstall,
  }) {
    return AppState(
      initialized: initialized ?? this.initialized,
      error: error ?? this.error,
      showSplashScreen: showSplashScreen ?? this.showSplashScreen,
      isSavingUserPreference:
          isSavingUserPreference ?? this.isSavingUserPreference,
      isFreshInstall: isFreshInstall ?? this.isFreshInstall,
    );
  }
}

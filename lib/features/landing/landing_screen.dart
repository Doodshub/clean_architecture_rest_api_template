import 'package:clean_architecture_template/blocs/app/app_bloc.dart';
import 'package:clean_architecture_template/blocs/authentication/authentication_bloc.dart';
import 'package:clean_architecture_template/dependencies/dependency_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

/// Landing screen that handles app initialization and authentication flow.
///
/// This screen manages the transition between splash screen, authentication,
/// and the main app. Consuming apps must provide builders for authenticated
/// and unauthenticated states.
///
/// Example:
/// ```dart
/// LandingScreen(
///   dependencyManager: dependencyManager,
///   splashScreenBuilder: (context) => MySplashScreen(),
///   authenticatedBuilder: (context, authState) => MainScreen(),
///   unauthenticatedBuilder: (context) => OnboardingScreen(),
/// )
/// ```
class LandingScreen extends StatefulWidget {
  final DependencyManager dependencyManager;

  /// Builder for the splash screen shown during app initialization.
  /// If null, shows an empty SizedBox.
  final Widget Function(BuildContext)? splashScreenBuilder;

  /// Builder for the authenticated state.
  /// Receives the current AuthenticationState.
  /// Required - apps must provide their main authenticated UI.
  final Widget Function(BuildContext, AuthenticationState) authenticatedBuilder;

  /// Builder for the unauthenticated state.
  /// Required - apps must provide their onboarding/login UI.
  final Widget Function(BuildContext) unauthenticatedBuilder;

  const LandingScreen({
    super.key,
    required this.dependencyManager,
    required this.authenticatedBuilder,
    required this.unauthenticatedBuilder,
    this.splashScreenBuilder,
  });

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    context.read<AppBloc>().initializeApp(widget.dependencyManager);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 275),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.fastOutSlowIn,
            child: _buildLandingScreen(),
          ),
          // Add busy indicator if necessary
          // const FullScreenBusyIndicator(),
        ],
      ),
    );
  }

  Widget _buildLandingScreen() {
    return BlocConsumer<AppBloc, AppState>(
      listenWhen:
          (previous, current) => previous.initialized != current.initialized,
      listener: (context, appState) {
        if (appState.initialized) {
          context.read<AuthenticationBloc>().init();
        }
      },
      builder: (context, appState) {
        if (appState.showSplashScreen ?? false) {
          return widget.splashScreenBuilder?.call(context) ?? const SizedBox();
        }
        return BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listenWhen: (previous, current) => previous != current,
          listener: (context, state) {
            if (sl.isRegistered<Logger>()) {
              sl<Logger>().i(
                'Authentication state changed: user=${state.user?.id}',
              );
            }
          },
          builder: (context, state) {
            // Check if user is authenticated
            if (state.user == null || !(state.user?.isAuthenticated ?? false)) {
              return widget.unauthenticatedBuilder(context);
            }

            return widget.authenticatedBuilder(context, state);
          },
        );
      },
    );
  }
}

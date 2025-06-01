import 'package:clean_architecture_rest_api_template/blocs/app/app_bloc.dart';
import 'package:clean_architecture_rest_api_template/blocs/authentication/authentication_bloc.dart';
import 'package:clean_architecture_rest_api_template/dependencies/dependency_manager.dart';
import 'package:clean_architecture_rest_api_template/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class LandingScreen extends StatefulWidget {
  final DependencyManager dependencyManager;
  const LandingScreen({super.key, required this.dependencyManager});

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
          return const SizedBox();
        }
        return BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listenWhen: (previous, current) => previous != current,
          listener: (context, state) {
            sl<Logger>().i('AuthenticationBloc state: ${state.user}');
            if (state.user != null) {
              return;
            }
          },
          builder: (context, state) {
            // if (state.user == null || !(state.user?.isAuthenticated ?? false)) {
            //   return const OnboardingScreen();
            // }

            return const HomeScreen();
          },
        );
      },
    );
  }
}

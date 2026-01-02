import 'package:clean_architecture_template/blocs/app/app_bloc.dart';
import 'package:clean_architecture_template/blocs/app/base_cubit.dart';
import 'package:clean_architecture_template/blocs/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

/// Provides context-based and disposable dependencies such as providers and
/// widget type services. This is mainly used to wrap high tree level widgets in
/// this case.
///
/// Disposable dependencies are dependencies that can only live in a certain
/// widget's lifespan.
///
/// For example: If we're going to provide a store which we know it will only
/// live while the [UserAccount] is authenticated, we must provide it
/// immediately higher tree level of the tabbed navigator. This way, when we
/// logout, the provided stores which in some cases needed disposal will
/// be disposed as the mentioned screen is intended to be disposed as well.
/// Check [AuthenticatedDependencyProvider]
///
/// To add custom BlocProviders from your consuming app:
/// ```dart
/// AppDependencyProvider(
///   additionalProviders: [
///     BlocProvider(create: (_) => MyCustomBloc()),
///     BlocProvider(create: (_) => AnotherBloc()),
///   ],
///   child: MyApp(),
/// )
/// ```
class AppDependencyProvider extends StatelessWidget {
  const AppDependencyProvider({
    required this.child,
    this.additionalProviders = const [],
    super.key,
  });

  final Widget child;

  /// Additional BlocProviders to be injected alongside the core template providers.
  /// Use this to add your app-specific blocs.
  final List<BlocProvider> additionalProviders;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Core template providers
        BlocProvider(lazy: true, create: (_) => AppBloc()),
        BlocProvider<BaseCubit>(lazy: true, create: (_) => BaseCubit()),
        BlocProvider<AuthenticationBloc>(
          lazy: true,
          create: (_) => AuthenticationBloc(),
        ),
        // App-specific providers
        ...additionalProviders,
      ],
      child: child,
    );
  }
}

import 'package:clean_architecture_rest_api_template/blocs/app/app_bloc.dart';
import 'package:clean_architecture_rest_api_template/blocs/app/base_cubit.dart';
import 'package:clean_architecture_rest_api_template/blocs/authentication/authentication_bloc.dart';
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
class AppDependencyProvider extends StatelessWidget {
  const AppDependencyProvider({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(lazy: true, create: (_) => AppBloc()),
        BlocProvider<BaseCubit>(lazy: true, create: (_) => BaseCubit()),
        BlocProvider<AuthenticationBloc>(
          lazy: true,
          create: (_) => AuthenticationBloc(),
        ),
      ],
      child: child,
    );
  }
}

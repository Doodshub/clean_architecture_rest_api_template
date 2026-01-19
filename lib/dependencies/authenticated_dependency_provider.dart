import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

/// Provides context-based and disposable dependencies such as providers and
/// widget type services. This is mainly used to wrap high tree level widgets in
/// this case, [MainScreen].
///
/// A higher level (application) dependency provider similar to this is defined.
/// Check [AppDependencyProvider].
///
/// Use this to provide blocs/providers that should only exist when user is authenticated.
/// These will be automatically disposed when the user logs out.
///
/// Example:
/// ```dart
/// AuthenticatedDependencyProvider(
///   additionalProviders: [
///     BlocProvider(create: (_) => UserProfileBloc()),
///     BlocProvider(create: (_) => NotificationsBloc()),
///   ],
///   child: BaseScreen(),
/// )
/// ```
class AuthenticatedDependencyProvider extends StatelessWidget {
  const AuthenticatedDependencyProvider({
    required this.child,
    this.additionalProviders = const [],
    super.key,
  });

  final Widget child;

  /// Additional providers that should only exist in authenticated context.
  /// These will be disposed when user logs out.
  final List<BlocProvider> additionalProviders;

  @override
  Widget build(BuildContext context) {
    // If no additional providers, just return the child directly
    if (additionalProviders.isEmpty) {
      return child;
    }

    return MultiProvider(
      providers: [
        /// Add any providers that are needed for the authenticated part of the app.
        /// For example, you might want to add a UserProvider or AuthProvider here.
        // Provider<UserProvider>(create: (_) => UserProvider()),
        // Provider<AuthProvider>(create: (_) => AuthProvider()),
        ...additionalProviders,
      ],
      child: child,
    );
  }
}

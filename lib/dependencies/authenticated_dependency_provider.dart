import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Provides context-based and disposable dependencies such as providers and
/// widget type services. This is mainly used to wrap high tree level widgets in
/// this case, [MainScreen].
///
/// A higher level (application) dependency provider similar to this is defined.
/// Check [AuthenticatedDependencyProvider].
class AuthenticatedDependencyProvider extends StatelessWidget {
  const AuthenticatedDependencyProvider({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /// Add any providers that are needed for the authenticated part of the app.
        /// For example, you might want to add a UserProvider or AuthProvider here.
        // Provider<UserProvider>(create: (_) => UserProvider()),
        // Provider<AuthProvider>(create: (_) => AuthProvider()),
      ],
      child: child,
    );
  }
}

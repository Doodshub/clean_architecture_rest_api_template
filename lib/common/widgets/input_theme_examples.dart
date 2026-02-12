// Example usage of Input Decoration Themes and Icon Themes
// This file demonstrates how to use the themed input fields in your app
//
// DO NOT INCLUDE THIS FILE IN PRODUCTION - IT'S FOR REFERENCE ONLY

import 'package:flutter/material.dart';
import 'package:clean_architecture_template/common/widgets/elevated_input_field.dart';
import 'package:clean_architecture_template/common/styles/input_decoration_themes.dart';
import 'package:clean_architecture_template/common/styles/icon_themes.dart';

class InputThemeExamples extends StatefulWidget {
  const InputThemeExamples({super.key});

  @override
  State<InputThemeExamples> createState() => _InputThemeExamplesState();
}

class _InputThemeExamplesState extends State<InputThemeExamples> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input Theme Examples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // EXAMPLE 1: Elevated Email Field (Recommended)
            const Text(
              '1. Elevated Email Field',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ElevatedEmailField(
              controller: _emailController,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Email is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),

            // EXAMPLE 2: Elevated Password Field (Recommended)
            const Text(
              '2. Elevated Password Field',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ElevatedPasswordField(
              controller: _passwordController,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Password is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),

            // EXAMPLE 3: Elevated Search Field
            const Text(
              '3. Elevated Search Field',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ElevatedSearchField(
              controller: _searchController,
              hintText: 'Search businesses...',
              onChanged: (value) {
                // Handle search
              },
            ),
            const SizedBox(height: 32),

            // EXAMPLE 4: Custom Elevated Input Field
            const Text(
              '4. Custom Elevated Input Field',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ElevatedInputField(
              labelText: 'PHONE NUMBER',
              hintText: '+1 (555) 123-4567',
              prefixIcon: const Icon(Icons.phone_outlined),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 32),

            // EXAMPLE 5: Standard TextFormField with theme decoration
            const Text(
              '5. Standard TextFormField',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            TextFormField(decoration: InputDecorationThemes.emailDecoration()),
            const SizedBox(height: 32),

            // EXAMPLE 6: Multi-line Input
            const Text(
              '6. Multi-line Input',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ElevatedInputField(
              labelText: 'MESSAGE',
              hintText: 'Enter your message...',
              prefixIcon: const Icon(Icons.message_outlined),
              maxLines: 4,
              minLines: 3,
            ),
            const SizedBox(height: 32),

            // EXAMPLE 7: Different Icon Sizes
            const Text(
              '7. Icon Theme Examples',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                IconTheme(
                  data: IconThemes.small,
                  child: const Icon(Icons.star),
                ),
                const SizedBox(width: 16),
                IconTheme(
                  data: IconThemes.medium,
                  child: const Icon(Icons.star),
                ),
                const SizedBox(width: 16),
                IconTheme(
                  data: IconThemes.large,
                  child: const Icon(Icons.star),
                ),
                const SizedBox(width: 16),
                IconTheme(
                  data: IconThemes.xLarge,
                  child: const Icon(Icons.star),
                ),
                const SizedBox(width: 16),
                IconTheme(
                  data: IconThemes.xxLarge,
                  child: const Icon(Icons.star),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // EXAMPLE 8: Icon Color Variants
            const Text(
              '8. Icon Color Variants',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                IconTheme(
                  data: IconThemes.defaultStyle,
                  child: const Icon(Icons.favorite),
                ),
                const SizedBox(width: 16),
                IconTheme(
                  data: IconThemes.primary,
                  child: const Icon(Icons.favorite),
                ),
                const SizedBox(width: 16),
                IconTheme(
                  data: IconThemes.error,
                  child: const Icon(Icons.favorite),
                ),
                const SizedBox(width: 16),
                IconTheme(
                  data: IconThemes.success,
                  child: const Icon(Icons.favorite),
                ),
                const SizedBox(width: 16),
                IconTheme(
                  data: IconThemes.warning,
                  child: const Icon(Icons.favorite),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

/// Example: Login Form using Elevated Input Fields
class LoginFormExample extends StatefulWidget {
  const LoginFormExample({super.key});

  @override
  State<LoginFormExample> createState() => _LoginFormExampleState();
}

class _LoginFormExampleState extends State<LoginFormExample> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      // Handle login
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo/Title
                const Text(
                  'Easier, Safer, Faster.\nThat\'s Trackify.',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 48),

                // Email Field
                ElevatedEmailField(
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Email is required';
                    }
                    if (!value!.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Password Field
                ElevatedPasswordField(
                  controller: _passwordController,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _handleLogin(),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Password is required';
                    }
                    if (value!.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // Login Button
                ElevatedButton(
                  onPressed: _handleLogin,
                  child: const Text('Log In'),
                ),
                const SizedBox(height: 16),

                // Forgot Password Link
                TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

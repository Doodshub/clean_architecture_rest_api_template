import 'package:clean_architecture_rest_api_template/blocs/app/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: Row(children: [Expanded(child: _buildScreen(currentIndex))]),
        );
      },
    );
  }

  Widget _buildScreen(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const SizedBox();

      default:
        return const SizedBox();
    }
  }
}

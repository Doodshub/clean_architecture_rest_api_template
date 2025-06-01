import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class AnalyticBlocObserver extends BlocObserver {
  AnalyticBlocObserver({
    required this.logger,
  });

  final Logger logger;

  @override
  void onEvent(Bloc bloc, Object? event) {
    logger.i("$bloc: $event");
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.e(error);
  }

  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    logger.d(transition);

    super.onTransition(bloc, transition);
  }
}

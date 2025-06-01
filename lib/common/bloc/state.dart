import 'package:equatable/equatable.dart';

/// Flutter bloc's base state representation. Must not be confused with
/// Flutter's [State<Widget>].
abstract class BlocState extends Equatable {
  const BlocState();

  @override
  bool get stringify => true;
}

import 'package:equatable/equatable.dart';

abstract class BlocEvent extends Equatable {
  const BlocEvent();

  @override
  bool get stringify => true;
}

import 'package:equatable/equatable.dart';

abstract class Model extends Equatable {
  const Model();

  @override
  bool? get stringify => true;
}

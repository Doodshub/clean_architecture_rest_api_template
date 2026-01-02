import 'package:clean_architecture_template/common/models/model.dart';

/// Abstract base user class that all user models should extend.
///
/// Consuming apps should create their own concrete user model extending this class.
///
/// Example:
/// ```dart
/// @freezed
/// class AppUser extends BaseUser with _$AppUser {
///   const factory AppUser({
///     required int id,
///     required String name,
///     required bool isAuthenticated,
///     String? email,  // Additional fields
///     String? photoUrl,
///   }) = _AppUser;
///
///   factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);
///
///   const AppUser._();
/// }
/// ```
abstract class BaseUser extends Model {
  const BaseUser();

  /// Unique identifier for the user
  int? get id;

  /// User's display name
  String? get name;

  /// Whether the user is currently authenticated
  bool? get isAuthenticated;

  /// Create a user from JSON
  /// Subclasses must implement this factory
  factory BaseUser.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError(
      'BaseUser.fromJson must be implemented by concrete user class. '
      'This is typically handled by freezed code generation.',
    );
  }

  /// Convert user to JSON
  /// Subclasses should implement this via freezed or manually
  Map<String, dynamic> toJson() {
    throw UnimplementedError(
      'toJson must be implemented by concrete user class. '
      'This is typically handled by freezed code generation.',
    );
  }

  @override
  List<Object?> get props => [id, name, isAuthenticated];
}

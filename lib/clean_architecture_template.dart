/// Clean Architecture Template Library
///
/// {@category Core}
library;

// Architecture
export 'common/architecture/base_repository.dart';

// BLoC
export 'common/bloc/event.dart';
export 'common/bloc/state.dart';
export 'common/bloc/bloc_delegate.dart';

// Models
export 'common/models/model.dart';
export 'common/models/user/user.dart';
export 'common/models/session_token/session_token.dart';

// Authentication
export 'blocs/authentication/authentication_bloc.dart';
export 'blocs/app/app_bloc.dart';
export 'blocs/app/base_cubit.dart';

// Dependency Injection
export 'app/di/dependency_manager.dart';
export 'dependencies/dependency_manager.dart';
export 'dependencies/app_dependency_provider.dart';
export 'dependencies/authenticated_dependency_provider.dart';

// Routing
export 'common/routes/root_router.dart';
export 'common/routes/authenticated_router.dart';
export 'common/routes/main_router.dart';
export 'common/routes/unauthenticated_router.dart';
export 'common/routes/onboarding_router.dart';
export 'common/routes/navigation_service.dart';
export 'common/routes/route_helper.dart';
export 'common/routes/route_configuration.dart';

// Database
export 'data/database/database_service.dart';
export 'data/database/databases.dart';

// Services
export 'common/services/user_service.dart';
export 'common/services/modal_service.dart';
export 'services/token_service.dart';

// Widgets
export 'common/widgets/app_dialog.dart';
export 'common/widgets/buttons/primary_button_widget.dart';
export 'common/widgets/buttons/circle_shape_button_widget.dart';
export 'common/widgets/buttons/square_shape_button_widget.dart';
export 'common/widgets/scaled_theme_provider.dart';
export 'common/widgets/responsive_content_wrapper.dart';

// Scaling
export 'common/scaling/design_tokens.dart';
export 'common/scaling/scale_calculator.dart';
export 'common/scaling/scaled_theme_builder.dart';

// Styles
export 'common/styles/app_colors.dart';
export 'common/styles/app_text_styles.dart';
export 'common/styles/tokens/tokens.dart';
export 'common/styles/app_spacing.dart';
export 'common/styles/app_themes.dart';
export 'common/styles/container_tokens.dart';
export 'common/styles/shadow_tokens.dart';
export 'common/styles/app_bar_themes.dart';
export 'common/styles/button_styles.dart';
export 'common/styles/color_schemes.dart';
export 'common/styles/divider_themes.dart';
export 'common/styles/dropdown_theme.dart';
export 'common/styles/elevated_button_themes.dart';
export 'common/styles/floating_action_button_themes.dart';
export 'common/styles/icon_themes.dart';
export 'common/styles/input_decoration_themes.dart';
export 'common/styles/list_tile_themes.dart';
export 'common/styles/text_themes.dart';

// Utilities
export 'common/utils/context_utils.dart';
export 'common/utils/app_logger.dart';

// Extensions
export 'common/extensions/responsive_extension.dart';
export 'common/extensions/text_extension.dart';
export 'common/extensions/theme_extension.dart';

// Constants
export 'common/const/preference_keys.dart';

// Environment
export 'models/app_environment.dart';

// Features
export 'features/landing/landing_config.dart';
export 'features/landing/landing_screen.dart';

// Main app setup
export 'main_app.dart';

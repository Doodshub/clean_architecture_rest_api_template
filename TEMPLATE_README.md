# Clean Architecture Template

A comprehensive Flutter template library providing clean architecture patterns, authentication scaffolding, dependency injection, routing, and styling utilities for REST API applications.

## Features

- ✅ **Clean Architecture**: Separation of concerns with repositories, services, and BLoC patterns
- ✅ **Authentication System**: Ready-to-use authentication bloc with user management
- ✅ **BaseUser Pattern**: Extensible abstract user model for type safety
- ✅ **Dependency Injection**: GetIt-based DI with easy extension points
- ✅ **Dynamic Routing**: Flexible navigation system with route registration
- ✅ **Database Layer**: Sembast-based local storage with reactive streams
- ✅ **Styling System**: Comprehensive theme system with customizable components
- ✅ **Environment Config**: Envied-based environment variable management
- ✅ **Modal Service**: Global modal/dialog management
- ✅ **Token Management**: Secure storage for authentication tokens

## Installation

### 1. Add as dependency

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  clean_architecture_template:
    path: ../clean_architecture_rest_api_template # or your path
```

### 2. Run code generation

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

## Quick Start

### 1. Create Your User Model

Extend `BaseUser` with your app-specific user fields:

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:clean_architecture_template/clean_architecture_template.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser extends BaseUser with _$AppUser {
  const factory AppUser({
    required int id,
    required String name,
    required bool isAuthenticated,
    String? email,
    String? photoUrl,
    DateTime? lastLogin,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

  const AppUser._();
}
```

### 2. Configure Environment

Create a `.env` file in your project root (copy from `.env.template`):

```env
BASE_URL=https://your-api-url.com/api/v1
DATABASE_NAME=my_app_database.db
```

Create your environment configuration:

```dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _Env.baseUrl;

  @EnviedField(varName: 'DATABASE_NAME')
  static const String databaseName = _Env.databaseName;
}
```

### 3. Setup Dependencies

```dart
import 'package:clean_architecture_template/clean_architecture_template.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dependencyManager = DependencyManager();

  // Register your custom repositories
  dependencyManager.registerRepository<ProductRepository>(
    () => ProductRepository(dio: sl<Dio>()),
  );

  // Register your custom services
  dependencyManager.registerService<NotificationService>(
    () => NotificationService(database: sl<DatabaseService>()),
  );

  // Register your custom blocs
  dependencyManager.registerBloc<ProductBloc>(
    () => ProductBloc(repository: sl<ProductRepository>()),
  );

  await dependencyManager.init();

  runApp(MyApp(dependencyManager: dependencyManager));
}
```

### 4. Setup Your App

```dart
class MyApp extends StatelessWidget {
  final DependencyManager dependencyManager;

  const MyApp({required this.dependencyManager, super.key});

  @override
  Widget build(BuildContext context) {
    return AppDependencyProvider(
      additionalProviders: [
        BlocProvider(create: (_) => sl<ProductBloc>()),
        BlocProvider(create: (_) => ProfileBloc()),
      ],
      child: MaterialApp(
        title: 'My App',
        theme: defaultStyle,
        home: LandingScreen(
          dependencyManager: dependencyManager,
          splashScreenBuilder: (context) => MySplashScreen(),
          authenticatedBuilder: (context, authState) => MainScreen(),
          unauthenticatedBuilder: (context) => OnboardingScreen(),
        ),
      ),
    );
  }
}
```

### 5. Add Custom Routes

```dart
// In your initialization
final mainRouter = sl<MainRouter>();
mainRouter.addRoute(
  'product-detail',
  ({settings}) => CupertinoPageRoute(
    builder: (_) => ProductDetailScreen(id: settings?.arguments as String),
    settings: settings,
  ),
);

// Navigate to your custom route
sl<RouteHelper>().mainRouter.key.currentState?.pushNamed(
  'product-detail',
  arguments: productId,
);
```

### 6. Extend Authentication Repository

Override the default endpoints:

```dart
class AppAuthenticationRepository extends AuthenticationRepository {
  AppAuthenticationRepository({required super.dio});

  @override
  String get loginEndpoint => '/auth/login';

  @override
  String get registerEndpoint => '/auth/register';

  @override
  String get getMeEndpoint => '/users/me';
}

// Register it in DependencyManager
dependencyManager.registerRepository<AuthenticationRepository>(
  () => AppAuthenticationRepository(dio: sl<Dio>()),
);
```

## Architecture Overview

### Layers

```
lib/
├── blocs/              # State management (BLoC pattern)
├── common/
│   ├── architecture/   # Base classes (BaseRepository, etc.)
│   ├── bloc/          # BLoC utilities (Event, State, Observer)
│   ├── models/        # Shared models (BaseUser, SessionToken)
│   ├── routes/        # Routing system
│   ├── services/      # Business logic services
│   ├── styles/        # Theme and styling
│   ├── widgets/       # Reusable widgets
│   └── utils/         # Helper utilities
├── data/
│   ├── database/      # Database layer (Sembast)
│   └── repositories/  # Data repositories
├── dependencies/      # Dependency injection
├── features/          # Feature modules
│   ├── base/         # Base navigation structure
│   ├── landing/      # App initialization screen
│   └── main/         # Main screen wrapper
└── services/         # Global services (Token, etc.)
```

### Key Patterns

- **Repository Pattern**: Data access abstraction
- **BLoC Pattern**: State management
- **Dependency Injection**: GetIt for service location
- **Clean Architecture**: Clear separation of concerns

## Customization Guide

### Adding Custom BLoCs

```dart
// In your app's dependency provider
AppDependencyProvider(
  additionalProviders: [
    BlocProvider(create: (_) => MyCustomBloc()),
  ],
  child: yourApp,
)
```

### Adding Authenticated-Only BLoCs

```dart
AuthenticatedDependencyProvider(
  additionalProviders: [
    BlocProvider(create: (_) => UserProfileBloc()),
  ],
  child: BaseScreen(),
)
```

### Customizing Styles

```dart
// Create your own theme based on the template
final myTheme = defaultStyle.copyWith(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  textTheme: TextTheme(
    // Your text styles
  ),
);
```

### Database Operations

```dart
// Access database service
final db = sl<DatabaseService>();

// Save data
await db.save('my_table', {'id': 1, 'name': 'John'});

// Get all data
final data = await db.getAll('my_table');

// Listen to changes
db.multipleListen('my_table').listen((items) {
  // Handle updates
});
```

## Code Generation

This template uses code generation for:

- **Freezed**: Immutable models
- **json_serializable**: JSON serialization
- **Envied**: Environment variables

### Run code generation:

```bash
# One-time generation
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode (auto-regenerates on file changes)
flutter pub run build_runner watch --delete-conflicting-outputs
```

### Important Notes:

1. **Generated files are NOT committed** - Each consuming app must run `build_runner`
2. After pulling template updates, run `build_runner` again
3. Generated files: `*.freezed.dart`, `*.g.dart`

## API Integration

### Configure Dio Base URL

The template uses your environment's `BASE_URL`:

```dart
// In DependencyManager
void provideDIO() {
  sl.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.options.baseUrl = EnvValues.baseUrl;  // From your .env
    // Add interceptors, etc.
    return dio;
  });
}
```

### Creating Repositories

```dart
class ProductRepository extends BaseRepository {
  ProductRepository({required super.dio});

  Future<List<Product>> getProducts() async {
    try {
      final response = await dio.get('/products');
      return (response.data as List)
          .map((json) => Product.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch products: ${e.message}');
    }
  }
}
```

## Testing

The template is designed to be testable:

```dart
// Example bloc test
testWidgets('AuthenticationBloc login test', (tester) async {
  final mockRepo = MockAuthenticationRepository();
  final bloc = AuthenticationBloc(repository: mockRepo);

  bloc.add(LoginUser(email: 'test@test.com', password: 'password'));

  await expectLater(
    bloc.stream,
    emitsInOrder([
      isA<AuthenticationState>().having((s) => s.isLoggingIn, 'isLoggingIn', true),
      isA<AuthenticationState>().having((s) => s.user, 'user', isNotNull),
    ]),
  );
});
```

## Migration from Template

When you update the template package:

1. Pull latest changes from template
2. Run `flutter pub get`
3. Run `flutter pub run build_runner build --delete-conflicting-outputs`
4. Check for breaking changes in CHANGELOG.md
5. Update your code accordingly

## Examples

See the `example/` folder for a complete sample application demonstrating:

- Custom user model implementation
- Additional routes registration
- Custom repository and service integration
- Authentication flow
- Database operations

## Contributing

This is a private template. For updates:

1. Create feature branches for each project customization
2. Keep template updates in `main` branch
3. Merge template updates into feature branches as needed

## License

Private - All rights reserved

## Support

For issues or questions, contact the development team.

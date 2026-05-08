# 🔌 State Management & Networking

This document outlines the standard patterns for handling application state and external API communication.

## 🧠 State Management (Bloc/Cubit)

We use `flutter_bloc` with **Cubit** as the default.

### Standard State Pattern
All states should follow this naming convention and structure:

```dart
abstract class FeatureState {}

class FeatureInitial extends FeatureState {}
class FeatureLoading extends FeatureState {}
class FeatureSuccess extends FeatureState {
  final List<Data> data;
  FeatureSuccess(this.data);
}
class FeatureFailure extends FeatureState {
  final String message;
  FeatureFailure(this.message);
}
```

### Rules:
- **No Logic in UI:** Widgets should only trigger events or call Cubit methods.
- **Small Scope:** Keep Cubits focused on specific feature components.
- **Async Safety:** Always use `try-catch` or the **Result** pattern within Cubits to emit `Failure` states.

---

## 🌐 Networking (Dio)

All network requests must use the `dio` package.

### Architecture:
1.  **Data Source:** Define a class (e.g., `AuthRemoteDataSource`) that uses a `Dio` instance to make HTTP calls.
2.  **Models:** Remote data should be parsed into Models in the Data Source.
3.  **Error Mapping:** Map HTTP status codes (404, 500, etc.) to project-specific `Failure` objects.

### Forbidden:
- Do NOT use the `http` package.
- Do NOT use raw JSON keys in Repositories or UseCases; always use Models.
- Do NOT make network calls directly from the Presentation layer.

---

## 💉 Dependency Injection (DI)

We use `get_it` for DI.

- Register your services in `lib/core/di/injection.dart`.
- Example registration:
  ```dart
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  ```
- Example usage in UI:
  ```dart
  final cubit = sl<AuthCubit>();
  ```

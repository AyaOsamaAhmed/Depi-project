# 🏗️ Architecture & Logic

This project follows **Clean Architecture** with a **Feature-based** structure. This separation ensures that business logic remains independent of the UI and external services.

## 📂 Folder Structure

Each feature is organized into three main layers:

```
lib/features/[feature_name]/
  ├── domain/         # Business Logic & Contracts (Pure Dart)
  │   ├── entities/   # Plain Data Classes
  │   ├── repositories/ # Abstract Interfaces
  │   └── usecases/   # Specific Business Actions (Optional)
  ├── data/           # Infrastructure & Implementation
  │   ├── models/     # DTOs (fromJson/toJson)
  │   ├── repositories/ # Implementation of Domain Interfaces
  │   ├── datasources/ # API (Remote) & Database (Local)
  │   └── mappers/    # Converting Models <-> Entities
  └── presentation/   # UI & State Management
      ├── views/      # Full Screens
      ├── widgets/    # Reusable Components
      └── states/     # Bloc/Cubit implementations
```

---

## ⚖️ The Dependency Rule

Dependencies must only point **inwards**:
- `Presentation` ➡️ `Domain`
- `Data` ➡️ `Domain`
- **Domain** ➡️ **Nothing** (No Flutter, No Packages)

---

## 🛡️ Best Practices

### 1. Error Handling (Result Pattern)
We use the **Result/Either** pattern for all asynchronous operations.
- Define failures in `lib/core/errors/failures.dart`.
- All Repositories and UseCases should return a `Future<Result<T>>` or `Future<Either<Failure, T>>`.

### 2. Dependency Injection
We use `get_it` for service location.
- Setup lives in `lib/core/di/injection.dart`.
- Initialize DI before `runApp()` in `main.dart`.

### 3. Separation of Models and Entities
- **Entities:** Live in `domain`. They are immutable and contain only business data.
- **Models:** Live in `data`. They handle serialization (JSON) and are mapped to Entities before reaching the Domain layer.

---

## 📖 Further Reading
For a detailed explanation in Arabic, see: [Clean Architecture Guide (Arabic)](./clean_arch_docs.md)

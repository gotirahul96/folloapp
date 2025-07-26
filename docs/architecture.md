# Application Architecture

This document refines the proposed Clean Architecture and SOLID design for the job seeker application.

## Folder Structure Diagram

```
lib/
├── core/                  # shared utilities, constants, use cases
├── features/
│   ├── authentication/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── jobs/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── dashboard/
│   ├── calendar/
│   ├── notifications/
│   └── analytics/
└── main.dart
```

Each feature contains `data`, `domain`, and `presentation` layers. The `core` directory hosts base classes and utilities shared across features.

## Layer Separation

- **Domain**: Pure Dart code only. Contains entities, repository **interfaces**, and use cases. Has no dependency on Flutter or external packages.
- **Data**: Implements the repository interfaces. Handles data sources such as encrypted local storage or the Gmail API. Can swap implementations (e.g., Hive vs Sqflite) without affecting other layers.
- **Presentation**: Flutter UI and state management (e.g., Riverpod). Communicates with the domain layer through use cases.

## Applying SOLID Principles

1. **Single Responsibility** – Each class has one reason to change: `JobRepositoryImpl` deals only with job persistence, `AuthController` only with authentication flow, etc.
2. **Open/Closed** – New features or data sources are added via new implementations without modifying existing abstractions. For example, adding Sqflite storage requires a new `JobSqfliteDataSource` implementing the existing `JobLocalDataSource` interface.
3. **Liskov Substitution** – All implementations of an interface (e.g., different local data sources) are substitutable without breaking the system.
4. **Interface Segregation** – Repositories expose only the operations needed by the domain layer. Large interfaces are broken into focused contracts.
5. **Dependency Inversion** – Presentation and data layers depend on abstractions defined in the domain layer. Concrete implementations are injected at runtime.

## Swappable Repositories

Repository interfaces in the domain layer allow storage implementations to be exchanged. Example:

```dart
abstract class JobRepository {
  Future<void> saveJobApplication(JobApplication application);
  Future<List<JobApplication>> fetchApplications();
}
```

`JobRepositoryImpl` can use a Hive data source today and a Sqflite source tomorrow without changing the domain or presentation code.

## Recommended Dependencies

- **Secure Storage**: `flutter_secure_storage` for storing encryption keys or tokens.
- **Local Database**: `hive` or `sqflite_sqlcipher` for encrypted data persistence.
- **Authentication**: `local_auth` for biometric checks and `pin_code_fields` for PIN entry.
- **Animations**: `flutter_animate` or the built‑in `AnimationController`/`Animated` widgets.

## Sample Dependency Injection with Riverpod

Below is a simplified provider setup. In practice, each provider would live in its own file under `lib/di/` or `lib/features/<feature>/presentation/providers/`.

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

final jobLocalDataSourceProvider = Provider<JobLocalDataSource>((ref) {
  // Return Hive or Sqflite implementation
  return JobHiveDataSource();
});

final gmailRemoteDataSourceProvider = Provider<GmailRemoteDataSource>((ref) {
  return GmailRemoteDataSource();
});

final jobRepositoryProvider = Provider<JobRepository>((ref) {
  return JobRepositoryImpl(
    localDataSource: ref.read(jobLocalDataSourceProvider),
    remoteDataSource: ref.read(gmailRemoteDataSourceProvider),
  );
});
```

This configuration injects concrete classes via Riverpod while exposing only abstractions to the rest of the app.

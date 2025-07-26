# FolloApp Architecture

This document describes the high level structure of the project following **Clean Architecture** and **SOLID** principles.

## Folder Structure
```
lib/
├── core/                 # common utilities and base classes
│   ├── error/
│   ├── usecases/
│   └── utils/
├── features/
│   ├── authentication/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   ├── models/
│   │   │   └── repositories/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   └── presentation/
│   │       ├── bloc/
│   │       ├── pages/
│   │       └── widgets/
│   ├── job_tracker/       # job application CRUD
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── dashboard/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── calendar/
│   │   └── ...
│   ├── notifications/
│   │   └── ...
│   └── analytics/
│       └── ...
└── main.dart
```
Each feature contains `data`, `domain` and `presentation` layers. The **domain** layer defines entities, repositories (abstract interfaces) and use cases. The **data** layer contains concrete implementations such as Hive datasources, Gmail API adapters, etc. The **presentation** layer uses BLoC for state management.

## Data Flow Diagram
```
UI Widgets
    │
    ▼ (events)
Bloc  <-----------------------
    │           ▲ use cases
    ▼ states    │
UseCase -------> Repository (abstract)
                 │  ▲ implements
                 ▼  │
          DataSource/Services
```
The UI dispatches events to BLoC. BLoC calls use cases from the domain layer. Use cases depend on abstract repositories, which are implemented in the data layer using local storage (Hive/Sqflite) or remote services (Gmail API). BLoC emits states back to the UI.

## Security Considerations
- **Encrypted Storage**: Hive is configured with an AES encryption key stored in `flutter_secure_storage` to protect PIN codes, Gmail tokens and job data.
- **Authentication**: Login requires a 4‑digit PIN and optionally biometric verification using `local_auth` for FaceID/TouchID.
- **Gmail Integration**: OAuth2 flow via `google_sign_in`/`googleapis` is used. Access tokens are securely stored and refreshed locally.
- **Data Privacy**: No job data leaves the device except when interacting with Gmail APIs. Network requests use HTTPS.

## State Management
All features expose BLoC classes inside `presentation/bloc`. BLoC handles events and yields states to the UI. Repositories and use cases are injected to keep layers decoupled and easily testable.

## Initial Dependencies
Dependencies defined in `pubspec.yaml` include:
- `flutter_bloc` + `equatable` for BLoC state management
- `hive` + `hive_flutter` + `flutter_secure_storage` for encrypted local persistence
- `local_auth` for biometrics
- `google_sign_in`, `googleapis`, `http` for Gmail integration
- `flutter_local_notifications` for reminders
- `table_calendar` and `fl_chart` for calendar and analytics views
- `animations` for Material 3 animated transitions

# Base Flutter Clean GetX App

A Flutter Base Project using:
 - Clean Architecture
 - GetX State Manager
 - freezed
 - Dependency Injection
 - Dio
 - Intl App Localization
 - Shared Preferences
 - Get Storage

## Getting Started

- Download and Clone the Repository
- Clean the project files and folders:
```
flutter clean
```

- Get pubspec Updated for all available and used packages:
```
flutter pub get
```

- Build runner Command:
```
dart pub run build_runner build --delete-conflicting-outputs
```

--> or run this instead all above:
```
.\builder
```

- for web output:
```
flutter build web --web-renderer canvaskit --release
```
```
(--web-renderer html/canvaskit) for different renderers
```
- ...


## Others
### Launcher Icon
- For any possible change in Launcher Icon
- first change the file in assets : <<assets/logos/app_logo.png>> (Please replace the file)
- then run:
```
dart run flutter_launcher_icons -f flutter_launcher_icons.yaml
```

# How to start

### lib/admin
Everything that you need for Administration that mostly would be separated from the App, 

### lib/app

### lib/core

### lib/data

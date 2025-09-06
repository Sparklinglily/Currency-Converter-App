# Currency Converter

****A clean and simple currency converter app built with Flutter, following Clean Architecture principles and MVVM pattern.

## Tech Stack

- **Flutter SDK**: Latest stable version  
- **State Management**: Riverpod  
- **HTTP Client**: dart:http  
- **Architecture**: Clean Architecture + MVVM  
- **Design Principles**: DRY, KISS and SOLID  


## Features

**Real-time currency conversion using ExchangeRate-API
**170+ currencies listed
**Swap currencies with one tap
**Clean, intuitive UI 
**Fast and responsive with minimal dependencies

## Project Structure

lib/
├── main.dart
├── core/
│   ├── constants/        # API constants
│   ├── errors/          # Error handling
│   └── utils/           # Extensions & utilities
├── data/
│   ├── models/          # Data models (API mapping)
│   ├── repositories/    # Repository implementations
│   └── datasources/     # Remote data sources
├── domain/
│   ├── entities/        # Business objects
│   ├── repositories/    # Repository contracts
│   └── usecases/        # Business logic
└── presentation/
    ├── pages/           # UI screens
    ├── widgets/         # Reusable components
    ├── viewmodels/      # State management
    └── providers/       # Riverpod providers

    ## Getting Started

### Prerequisites
- Flutter SDK (latest stable)  
- Dart SDK  
- IDE (VS Code / Android Studio)  


### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/currency_converter.git
   cd currency_converter  

  ```bash
flutter pub get
  ```

  ```bash
flutter run
```
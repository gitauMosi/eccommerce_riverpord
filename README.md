# eccommerce_riverpord

A new Flutter project.

## Getting Started

## Projetc Structure
lib/
 ├── main.dart
 ├── core/                
 │   ├── utils/           # Utilities
 │   ├── constants.dart   # App constants
 │   ├── network.dart     # API services
 ├── features/
 │   ├── weather/
 │   │   ├── data/        # Data layer
 │   │   │   ├── models/  # Data models
 │   │   │   ├── repositories/
 │   │   ├── domain/      # Business logic (UseCases)
 │   │   │   ├── entities/  # Core entities
 │   │   │   ├── usecases/  # Business logic
 │   │   ├── presentation/  # UI and ViewModel
 │   │   │   ├── view/
 │   │   │   ├── viewmodel/
 ├── widgets/             # Reusable widgets

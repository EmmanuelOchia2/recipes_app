
# 🍽️ Flutter Meals App

A Flutter application that showcases meals using [TheMealDB](https://www.themealdb.com/api.php) API. It implements a clean architecture with BLoC state management and layered responsibilities.

---

## 🚀 Features

- Browse meals by area (e.g., Canadian dishes)
- View full meal details including ingredients and instructions
- Search meals by name
- Pagination support (infinite scroll)
- Custom reusable widgets
- BLoC pattern for scalable state management

---

## 🗂️ Project Structure

```
lib/
├── features/
│   ├── core/
│   │   ├── services/              # API client service
│   │   └── theme/                 # App-wide theming
│   └── home/
│       ├── data/
│       │   ├── model/             # API response models
│       │   └── meals_repository.dart
│       ├── domain/
│       │   └── usecases/          # Business logic (GetMeal, SearchMeal, etc.)
│       └── presentation/
│           ├── bloc/              # BLoC: state, events, and logic
│           ├── widgets/           # Reusable widgets
│           ├── home_screen.dart
│           ├── meal_details_screen.dart
│           └── search_results_screen.dart
├── main.dart                      # Entry point
```

---

## 🧱 Architecture

This app uses **Clean Architecture** with the following layers:

- **Presentation Layer:** UI + BLoC pattern
- **Domain Layer:** Use cases, business logic
- **Data Layer:** Repositories + API models
- **Core Layer:** Common services (e.g., `ApiClient`) and theme

---

## 🔧 Getting Started

### Prerequisites

- Flutter 3.10.0 or higher
- Dart SDK
- Internet connection (for API access)

### Installation

```bash
git clone https://github.com/your-username/flutter-meals-app.git
cd flutter-meals-app
flutter pub get
flutter run
```

---

## 📡 API

This project uses the public test key from [TheMealDB](https://www.themealdb.com/api.php):

```
Base URL: https://www.themealdb.com/api/json/v1/1/
```

Endpoints used:
- `/filter.php?a=Canadian`
- `/lookup.php?i={id}`
- `/search.php?s={name}`

No authentication required for public access.

---

## 📸 Screens

- ✅ Home Screen with a list of meals
- 🔍 Search Results
- 📄 Meal Details with instructions and ingredients

---

## 📁 Key Files

| File | Description |
|------|-------------|
| `meals_repository.dart` | Interfaces with API client |
| `recipes_bloc.dart`     | Central logic controller for recipes |
| `meal_detail_response.dart` | Model for detailed meal info |
| `scrollable_widget.dart` | Custom infinite scrolling widget |
| `get_meals_usecase.dart` | Retrieves meal list by area |
| `search_meal_by_name_usecase.dart` | Search logic |

---

## 🧪 Testing

Add your widget and unit tests under `test/` following the same folder structure.

---

## 🤝 Contributing

Contributions are welcome! Please fork the repo and open a pull request.

---

## 📄 License

MIT License. See `LICENSE` for details.

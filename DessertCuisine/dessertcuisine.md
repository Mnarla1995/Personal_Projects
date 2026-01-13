# DessertCuisine 🍰

DessertCuisine is an iOS application built with **SwiftUI** that allows users to browse dessert meals and view detailed information for each item.  
The project follows the **MVVM (Model–View–ViewModel)** architecture to ensure clean separation of concerns and scalable code.

---

## Features
- Display a list of dessert meals
- Navigate to a detailed view for each meal
- SwiftUI-based UI with reusable views
- MVVM architecture for maintainability
- Centralized constants and assets
- SwiftUI preview support

---

## Architecture

This project is structured using **MVVM**:

### Model
- `CategoryMeals.swift`  
  Defines dessert categories and meal summary data.

- `DetailMeals.swift`  
  Represents detailed meal information.

---

### ViewModel
- `DessertViewModel.swift`  
  Manages dessert list data and business logic.

- `MealDetailsViewModel.swift`  
  Handles state and logic for the meal detail screen.

---

### Views
- `DessertListView.swift`  
  Displays the list of dessert meals.

- `MealView.swift`  
  Shows detailed information for a selected meal.

---

### App & Utilities
- `DessertCuisineApp.swift`  
  Application entry point.

- `Constant.swift`  
  Centralized constants used throughout the app.

---

## Assets
- App icons and accent colors are managed via `Assets.xcassets`
- Preview assets are included for SwiftUI previews

---

## Project Structure

```text
DessertCuisine/
├── DessertCuisine/
│   ├── Assets.xcassets/
│   ├── Model/
│   │   ├── CategoryMeals.swift
│   │   └── DetailMeals.swift
│   ├── ViewModel/
│   │   ├── DessertViewModel.swift
│   │   └── MealDetailsViewModel.swift
│   ├── Views/
│   │   ├── DessertListView.swift
│   │   └── MealView.swift
│   ├── Constant.swift
│   └── DessertCuisineApp.swift
├── DessertCuisine.xcodeproj
└── README.md

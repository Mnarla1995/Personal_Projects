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
# DessertCuisine — Detailed Project Overview

DessertCuisine is a lightweight iOS app implemented with **SwiftUI** that lets users browse dessert meals and inspect detailed information for each selection. The codebase follows the **MVVM (Model–View–ViewModel)** pattern to keep UI, state, and data responsibilities separated and testable.

---

## Quick Features
- Browse a list of dessert meals with images and brief metadata.
- Tap an item to view rich details (ingredients, instructions, images).
- Built with reusable SwiftUI views and preview support.
- Organized around MVVM for clarity and scalability.

---

## Architecture & Data Flow

High level flow:

View (SwiftUI) ↔ ViewModel (state, business logic) ↔ Model (data structures)

- Views are lightweight and declarative. They observe view model state and render accordingly.
- ViewModels encapsulate fetching/parsing logic, transformation for display, and local state.
- Models are plain Swift structs representing API payloads or local data.

This separation makes it straightforward to add features such as caching, offline mode, or unit tests for logic without touching UI code.

---

## File Map and Responsibilities

- App entry: [DessertCuisine/DessertCuisine/DessertCuisineApp.swift](DessertCuisine/DessertCuisine/DessertCuisineApp.swift)
- Global constants: [DessertCuisine/DessertCuisine/Constant.swift](DessertCuisine/DessertCuisine/Constant.swift)

- Models:
  - [DessertCuisine/DessertCuisine/Model/CategoryMeals.swift](DessertCuisine/DessertCuisine/Model/CategoryMeals.swift) — data types representing meal summaries (list items, category metadata).
  - [DessertCuisine/DessertCuisine/Model/DetailMeals.swift](DessertCuisine/DessertCuisine/Model/DetailMeals.swift) — full meal details shown on the detail screen (ingredients, instructions, image URLs).

- ViewModels:
  - [DessertCuisine/DessertCuisine/ViewModel/DessertViewModel.swift](DessertCuisine/DessertCuisine/ViewModel/DessertViewModel.swift) — loads the list of desserts, exposes an array of models or cell view models, handles refresh/state (loading, error).
  - [DessertCuisine/DessertCuisine/ViewModel/MealDetailsViewModel.swift](DessertCuisine/DessertCuisine/ViewModel/MealDetailsViewModel.swift) — loads/holds a single meal's detailed data and any presentation logic for the detail view.

- Views:
  - [DessertCuisine/DessertCuisine/Views/DessertListView.swift](DessertCuisine/DessertCuisine/Views/DessertListView.swift) — top-level list view that binds to `DessertViewModel` and displays rows.
  - [DessertCuisine/DessertCuisine/Views/MealView.swift](DessertCuisine/DessertCuisine/Views/MealView.swift) — detail screen for a selected meal, binds to `MealDetailsViewModel`.

- Assets & previews:
  - [DessertCuisine/DessertCuisine/Assets.xcassets](DessertCuisine/DessertCuisine/Assets.xcassets) — app icons and accent colors.
  - [DessertCuisine/DessertCuisine/Preview Content/Preview Assets.xcassets](DessertCuisine/DessertCuisine/Preview%20Content/Preview%20Assets.xcassets) — assets for SwiftUI previews.

---

## Models — What to expect

- `CategoryMeals` is typically a compact representation used for list rows: id, title, thumbnail URL, short description.
- `DetailMeals` contains expanded properties: steps/instructions, ingredient list, measurements, full-size image URLs, and any additional metadata (area, category, tags).

Design tip: Keep decoding logic inside the models (via `Codable` extensions) or in small parsing helpers within the view models so tests can focus on transformation behavior.

---

## ViewModels — Responsibilities

- `DessertViewModel`:
  - Fetches list data from a data source (remote API, local JSON, or mock data for previews).
  - Converts raw models into display-ready values (e.g., formatted titles, image URLs).
  - Exposes state: `isLoading`, `error`, and `[CategoryMeals]`.

- `MealDetailsViewModel`:
  - Fetches and holds a `DetailMeals` instance.
  - Provides derived properties: ingredient arrays, formatted instructions, or shareable text.

Keep view models small and focused; prefer composition (small helpers) over large monolithic classes.

---

## Views — UI Composition

- `DessertListView` displays a `List` or `LazyVStack` of cells. Each cell should be a small view that accepts a single model (or cell view model) and renders image, title, and subtitle.
- `MealView` shows the full details: image, title, tags, ingredients as a list, and instructions. Use `ScrollView` for flexible vertical content.

Tips for SwiftUI:
- Use `@StateObject` for view model ownership, `@ObservedObject` for passing view models into child views.
- Provide a `PreviewProvider` that injects mock view models for fast UI iteration.

---

## Building & Running

1. Open the workspace in Xcode: open the Xcode project at [DessertCuisine/DessertCuisine.xcodeproj](DessertCuisine/DessertCuisine.xcodeproj).
2. Select a simulator or device, then build and run (Xcode 14+ recommended).
3. Use SwiftUI previews for quick UI checks (the project includes preview assets).

---

## Minimal requirements:
- macOS with Xcode installed (no command-line build included in this repo).

---




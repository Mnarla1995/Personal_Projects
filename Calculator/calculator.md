# Calculator (SwiftUI)

## Overview

This is a simple calculator app implemented using SwiftUI and the MVVM (Model-View-ViewModel) pattern. It demonstrates a clean separation of concerns: UI is declared in SwiftUI views, business logic and state are handled in the view model, and computation lives in the model layer.

## Key Features

- Basic arithmetic: addition, subtraction, multiplication, division
- Clear and responsive touch-friendly UI
- Reusable button component with centralized styling
- MVVM architecture for testability and maintainability

## Project Structure

The project uses a straightforward folder layout. Important files and their responsibilities:

- `CalculatorApp.swift` — App entry point that configures the SwiftUI environment and launches the root view.
- `Model/ButtonType.swift` — Defines the types of buttons (digit, operation, command) and metadata used for rendering and behavior.
- `Model/Calculator.swift` — Encapsulates the core calculation logic and state transitions for operations and results.
- `Model/CalculatorButtonStyle.swift` — Centralized styling for buttons (shapes, colors, pressed states).
- `View/ContentView.swift` — The main view that arranges the display and button grid.
- `View/CalculatorButton.swift` — Reusable button component wired to `ButtonType` and the styling from the model.
- `ViewModel/CalculatorViewModel.swift` — Bridges the views and the model: receives user actions from the UI, updates model state, and exposes view-ready state (display text, enabled/disabled states).
- `Assets.xcassets` — App icon and accent color sets used by the UI.

## Architecture and Design Notes

- Pattern: MVVM — keeps UI declarative and stateless while the view model manages user-driven state.
- Single-responsibility: model focuses on arithmetic rules, view model on input handling, views on layout.
- Styling: button styling is centralized to ensure consistent appearance and easy theming.
- Extensibility: the `ButtonType` enum centralizes button metadata so adding new buttons (percent, ±, memory) is straightforward.

## How to Run (local)

1. Open the Xcode project at `Calculator/Calculator.xcodeproj`.
2. Select the `Calculator` target and choose a simulator or device.
3. Build and run (Cmd+R).

Requirements:

- Xcode 14+ (prefer Xcode 15 if using iOS 17 APIs)
- Swift 5.7+ (project may use newer Swift features depending on SDK)

## User Interaction / UI Behavior

- Tap digit buttons to build the current operand.
- Tap an operation (÷, ×, −, +) to queue an operation; subsequent digit input forms the second operand.
- Tap `=` to evaluate the queued operation.
- Tap `C` (clear) to reset the current input/state.
- Button press states and sizing are handled by `CalculatorButtonStyle.swift` and the `CalculatorButton` view.

## Tests & Validation

- Unit tests can be added around `Model/Calculator.swift` to validate operator precedence, repeated equals behavior, and edge cases (division by zero, large numbers, decimal precision).
- View model tests should assert correct display output for typical input sequences.

## Extension Ideas

- Add decimal point support and format the display for thousands separators.
- Add a history view to show previous calculations.
- Implement scientific functions (sin, cos, power) behind a secondary layout.
- Add keyboard input support for Mac Catalyst or iPad using hardware keyboards.

## Contributing / Notes for Maintainers

- Keep business logic in `Model/Calculator.swift`; avoid placing arithmetic rules inside views.
- When adding new button types, update `ButtonType.swift` and ensure the `CalculatorViewModel` maps new actions correctly.
- Use the centralized styling in `CalculatorButtonStyle.swift` to maintain consistent visuals across platforms.

---

If you'd like, I can also:

- add unit tests for the calculator model,
- expand documentation with code-level examples from specific files, or
- generate a small developer README with run/test commands.



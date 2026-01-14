**PresidentList — Project Overview**

- **Purpose:**: A small Swift/SwiftUI iOS app that displays a list of U.S. presidents (or a curated list) backed by a local property list resource. It demonstrates a lightweight data-driven SwiftUI layout and a simple data-loading manager.

--- 

**Project Structure**

- **Model:**: `President` — [PresidentList/President.swift](PresidentList/President.swift)
- **Data:**: `PresidentList.plist` — the local data source that holds the list of presidents ([PresidentList/PresidentList.plist](PresidentList/PresidentList.plist)).
- **Manager:**: `PresidentListManager.swift` — loads and parses `PresidentList.plist` into `President` model instances ([PresidentList/PresidentListManager.swift](PresidentList/PresidentListManager.swift)).
- **View / UI:**: `PresidentListView.swift` — the SwiftUI view that renders the list and handles navigation or selection ([PresidentList/PresidentListView.swift](PresidentList/PresidentListView.swift)).
- **App entry:**: `PresidentListApp.swift` — SwiftUI app lifecycle and scene setup ([PresidentList/PresidentListApp.swift](PresidentList/PresidentListApp.swift)).
- **Helpers:**: `Constants.swift` for app-wide constants ([PresidentList/Constants.swift](PresidentList/Constants.swift)), and `WebView.swift` for embedded web content if the app shows external pages ([PresidentList/WebView.swift](PresidentList/WebView.swift)).
- **Assets:**: App icons and colors live under [PresidentList/Assets.xcassets](PresidentList/Assets.xcassets).

--- 

**How the app works (data flow)**

- **Local data source:**: The app ships with `PresidentList.plist`. This plist contains an array/dictionary representation of the presidents used by the app.
- **Loading:**: `PresidentListManager` reads the plist from the app bundle, decodes each entry into `President` model instances, and exposes them to the view layer. Typical implementations either use `PropertyListSerialization` or `Codable` with `PropertyListDecoder`.
- **Presentation:**: `PresidentListView` observes the loaded collection and displays each `President` in a list. Tapping an item can present a detail view or open a web page via `WebView` when a URL is provided.

---

**Key types & responsibilities**

- **`President` (model):**: Holds the president's properties (name, dates, short bio or URL). Keep it immutable where practical; conform to `Identifiable` for SwiftUI lists.
- **`PresidentListManager`:**: Responsible for safe loading, error handling (missing file, malformed entries), and providing a simple API to the UI (synchronous array or async/published property).
- **`PresidentListView`:**: Declarative UI layer. Use `List` / `NavigationView` (or `NavigationStack`) to render rows and navigate to detail views.

---

**Run & debug**

- **Open project:**: Open `PresidentList.xcodeproj` in Xcode.
- **Select target:**: Choose a simulator or device, then Build & Run (Cmd+R).
- **Common runtime checks:**: If the list is empty, verify `PresidentList.plist` is included in the app target resources and that `PresidentListManager` is reading the correct bundle path.

---

**How to modify the data**

- **Edit entries:**: Update [PresidentList/PresidentList.plist](PresidentList/PresidentList.plist) directly in Xcode (Property List editor) or edit the file as XML/plist text. Maintain the same keys the model expects (e.g., `name`, `birthDate`, `bio`, `url`).
- **Add fields:**: When adding new keys, update `President.swift` to include the new properties and adjust decoding/loading logic accordingly.

---

**Suggested improvements & extension ideas**

- **Search & filtering:**: Add a `SearchBar` and filter the list by name, year, or party.
- **Sorting options:**: Allow sort by name, birth year, or presidency order.
- **Detail view:**: Implement a richer detail view with images, timelines, and citations.
- **Remote sync:**: Replace or complement the plist with a remote JSON endpoint for updates without app releases.
- **Unit/UI tests:**: Add tests for `PresidentListManager` parsing and basic SwiftUI view snapshot tests.
- **Accessibility & localization:**: Ensure VoiceOver labels and localize strings to support additional languages.

---

**Notes for contributors**

- **Coding style:**: Favor small, testable components. Use `Codable` for parsing and `@Published` + `ObservableObject` for the manager if you want automatic view updates.
- **Assets:**: Keep image asset names consistent and use SF Symbols when possible to reduce asset bundle size.

---

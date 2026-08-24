# Qt Number Guessing Game

A responsive Number Guessing Game built with **Qt Quick, QML, and C++** to explore responsive UI design, QML state management, user interaction, C++/QML integration, and game logic.

The player tries to guess a randomly generated number within a limited number of attempts. The application provides feedback indicating whether the entered number is too high, too low, or correct, while dynamically narrowing the valid guessing range.

The user interface is implemented using QML, while the core game logic is handled by a C++ `GameController` exposed to QML using Qt's `Q_PROPERTY`, signals, slots, and context property mechanisms.

---

## 🎯 Project Goals

This project is being developed to strengthen practical knowledge of:

- Qt Quick
- QML
- C++
- Responsive UI design
- QML properties and property bindings
- `Q_PROPERTY`
- Signals and slots
- Context properties
- C++ and QML integration
- User interaction
- Game state management
- Random number generation
- Dynamic UI updates
- Separation of UI and application logic

---

## ✨ Features

- 🎲 Random secret number generation
- 🔢 User number input
- ✅ Input validation
- 📉 Too-high feedback
- 📈 Too-low feedback
- 🎯 Dynamic guessing range
- ⏳ Maximum attempt limit
- 🔢 Remaining attempt counter
- 🎉 Win detection
- 💥 Game-over detection
- 🔄 Restart / new game functionality
- 💬 Dynamic feedback messages
- 📱 Responsive UI layout
- 🔗 C++ backend with QML frontend
- ⚡ Reactive UI updates using Qt signals and properties

---

## 🛠️ Technologies Used

- **C++**
- **Qt 6**
- **Qt Quick**
- **QML**
- **CMake**

---

## 📂 Project Structure

```text
QtNumberGuessingGame/
│
├── CMakeLists.txt
├── main.cpp
├── gamecontroller.h
├── gamecontroller.cpp
├── Main.qml
├── README.md
└── .gitignore


The user interface and game-related QML logic are currently written in the single `main.qml` file. C++ is used for the application entry point and Qt integration.

🎮 How the Game Works
- The application starts a new game.
- A random target number is generated between 1 and 100.
- The player enters a number.
- The input is validated.
- The application compares the entered number with the target number.
- The player receives feedback:
- Too High — the guessed number is greater than the target.
- Too Low — the guessed number is smaller than the target.
- Correct — the player has found the target number.
- Each valid incorrect guess decreases the remaining attempts.
- The valid guessing range is dynamically narrowed after each incorrect guess.
- The player wins by finding the target number.
- The game ends when all attempts are exhausted.
- The player can start a new game using the reset functionality.

## 📱 Responsive UI

The UI is designed with responsive sizing and layouts so that the application can adapt to different window sizes.

The project explores techniques such as:

```qml
Math.min()
Math.max()
anchors
Layout
Layout.preferredWidth
Layout.preferredHeight
Layout.fillWidth
Layout.fillHeight
```

This helps maintain usable proportions across different screen sizes instead of relying entirely on fixed dimensions.

## 🧠 Qt/QML Concepts Practiced

This project provides practical experience with:

* `Window`
* `Rectangle`
* `Text`
* `TextField`
* `Button`
* `ColumnLayout`
* `RowLayout`
* Properties
* Property bindings
* Signals
* Signal handlers
* Slots
* JavaScript functions in QML
* Dynamic UI updates
* Responsive sizing
* Writing the complete interface in one QML file
* Rectangle
* Q_PROPERTY
* Context properties
* ListModel
* ListView
* C++/QML integration
* C++ game state management
* Random number generation

## 🚀 Future Improvements

Planned improvements include:

* Move more game logic into C++
* Expose a C++ game controller to QML
* Add difficulty levels
* Add maximum attempt limits
* Add score calculation
* Add timer-based gameplay
* Add game history
* Add a high-score system
* Add animations and transitions
* Add sound effects
* Add a light / dark theme
* Improve responsive design
* Refactor the QML interface into separate components when the project becomes larger

## 🔧 Build and Run

### Requirements

* Qt 6
* Qt Creator
* CMake
* C++ compiler

### Build

Clone the repository:

```bash
git clone https://github.com/<your-username>/QtNumberGuessingGame.git
```

Navigate into the project:

```bash
cd QtNumberGuessingGame
```

Create a build directory:

```bash
mkdir build
cd build
```

Configure the project:

```bash
cmake ..
```

Build the application:

```bash
cmake --build .
```

You can also open the project directly in **Qt Creator** and build and run it using the Qt Creator interface.

## 📸 Screenshots

<img width="1920" height="987" alt="image" src="https://github.com/user-attachments/assets/4a387cf9-ff9c-4c11-91b4-f2cc4554dc78" />
<img width="1920" height="987" alt="image" src="https://github.com/user-attachments/assets/d81f4218-c82e-48ca-bc8a-73f0e54053af" />
<img width="1920" height="987" alt="image" src="https://github.com/user-attachments/assets/f5faf75a-b666-4511-88e9-01770ef91ace" />



## 📚 Learning Focus

This project is part of my practical learning journey with Qt, QML, and C++, with a focus on building responsive user interfaces, managing application state, implementing game logic in C++, handling user interaction, and connecting QML with a C++ backend.

The project initially started with the UI and game interaction implemented primarily in QML and is being progressively refactored toward a cleaner separation between the presentation layer and application logic.

Through this project, I am gaining practical experience with how a C++ backend can expose application state and behavior to a QML frontend using Qt's object model, properties, signals, slots, and context properties.

## 👨‍💻 Author
** Addanki Adinarayana Anand Swaroop **

---

⭐ If you find this project useful, feel free to explore the source code and follow the development journey.

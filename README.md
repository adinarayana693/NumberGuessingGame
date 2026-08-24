# Qt Number Guessing Game

A responsive Number Guessing Game built with **Qt Quick, QML, and C++** to explore responsive UI design, QML state management, user interaction, and game logic.

The player tries to guess a randomly generated number, and the application provides feedback indicating whether the entered number is too high, too low, or correct.

The user interface is currently written in a single `main.qml` file, while C++ is used for the application setup and integration with Qt.

## 🎯 Project Goals

This project is being developed to strengthen practical knowledge of:

* Qt Quick
* QML
* Responsive UI design
* QML properties and state management
* Signals and slots
* User interaction
* Game logic
* Qt and C++ integration
* Building a complete interface in a single QML file

## ✨ Features

* Random number generation
* User number input
* Guess validation
* Higher / lower feedback
* Attempt counter
* Game completion detection
* Restart game functionality
* Responsive UI layout
* Clean and interactive interface

## 🛠️ Technologies Used

* **C++**
* **Qt 6**
* **Qt Quick**
* **QML**
* **CMake**

## 📂 Project Structure

```text
QtNumberGuessingGame/
│
├── CMakeLists.txt
├── main.cpp
├── main.qml
├── README.md
└── .gitignore
```

The user interface and game-related QML logic are currently written in the single `main.qml` file. C++ is used for the application entry point and Qt integration.

## 🎮 How the Game Works

1. The application generates a random target number.
2. The player enters a number.
3. The player clicks the **Guess** button.
4. The application compares the entered number with the target number.
5. The player receives feedback:

   * **Too High** — the guessed number is greater than the target.
   * **Too Low** — the guessed number is smaller than the target.
   * **Correct** — the player has found the target number.
6. The number of attempts is updated after each valid guess.
7. Once the correct number is found, the player can restart the game.

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
* JavaScript functions in QML
* Dynamic UI updates
* Responsive sizing
* Writing the complete interface in one QML file
* Connecting QML with C++

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

Screenshots will be added as the UI development progresses.

## 📚 Learning Focus

This project is part of my practical learning journey with **Qt, QML, and C++**, with a focus on building a responsive user interface, managing application state, handling user interaction, and connecting QML with C++.

The current version intentionally keeps the interface in a single `main.qml` file to focus on learning the fundamentals of Qt Quick and QML before introducing separate reusable components.

## 👨‍💻 Author

**AnandSwaroop**

GitHub: `https://github.com/anand`

---

⭐ If you find this project useful, feel free to explore the source code and follow the development journey.

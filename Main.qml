import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
//import "NumberGuess"

Window{
    id: root
    height: 680
    width: 920
    minimumHeight: 580
    minimumWidth: 780

    visible: true
    title: qsTr("Number Guessing Application")
    color: "#0a051b"


    //Background color with Gradient

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {position: 0.0; color:"#0f0728" }
            GradientStop {position: 0.0; color:"#0f0728"}
            GradientStop {position: 0.0; color:"#090317" }
        }
    }

    // Dynamic Circles both top left and bottom right

    Rectangle {
        width: 450; height: 450
        radius: 225
        color: "#7c3aed"
        opacity: 0.15
        x: -110; y: -110

        SequentialAnimation on opacity {
            loops: Animation.Infinite
            NumberAnimation { to: 0.25; duration: 4000; easing.type: Easing.InOutQuad }
            NumberAnimation { to: 0.10; duration: 4000; easing.type: Easing.InOutQuad }
        }
    }

    Rectangle {
        width: 450; height: 450
        radius: 225
        color: "#7c3aed"
        opacity: 0.15
        x: root.width -250; y: root.height - 250

        SequentialAnimation on opacity {
            loops: Animation.Infinite
            NumberAnimation { to: 0.25; duration: 4000; easing.type: Easing.InOutQuad }
            NumberAnimation { to: 0.10; duration: 4000; easing.type: Easing.InOutQuad }
        }
    }
    // Main Layout Container

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 24
        spacing: 20

        // TOP HEADER BAR

        RowLayout {
            Layout.fillWidth: true
            spacing: 16

            ColumnLayout {
                spacing: 4
                Text {
                    text: qsTr("Guess The Number")
                    color: "#ffffff"
                    font.pixelSize: 28
                    font.weight: Font.Black
                    font.letterSpacing: 1
                }
                Text {
                    text: qsTr("Desktop Masterclass Edition • Pure QML Interface")
                    color: "#a78bfa"
                    font.pixelSize: 13
                    font.weight: Font.Medium
                }
            }

            Item { Layout.fillWidth: true } // Spacer

            // Stat Badges
            RowLayout {
                spacing: 12

                // Attempts Pill
                Rectangle {
                    height: 38
                    width: attemptsLayout.implicitWidth + 24
                    radius: 19
                    color: "#1e1142"
                    border.color: attemptsRemaining <= 2 ? "#f43f5e" : "#6d28d9"
                    border.width: 1.5

                    Behavior on border.color { ColorAnimation { duration: 300 } }

                    RowLayout {
                        id: attemptsLayout
                        anchors.centerIn: parent
                        spacing: 8

                        Text {
                            text: "🎯 Attempts:"
                            color: "#c4b5fd"
                            font.pixelSize: 12
                            font.weight: Font.Bold
                        }
                        Text {
                            text: gameController.attemptsRemaining + " / " + gameController.maxAttempts
                            color: gameController.attemptsRemaining <= 2 ? "#fb7185" : "#a7f3d0"
                            font.pixelSize: 13
                            font.weight: Font.Black
                        }
                    }
                }

                // Range Pill
                Rectangle {
                    height: 38
                    width: rangeLayout.implicitWidth + 24
                    radius: 19
                    color: "#1e1142"
                    border.color: "#6d28d9"
                    border.width: 1.5

                    RowLayout {
                        id: rangeLayout
                        anchors.centerIn: parent
                        spacing: 8

                        Text {
                            text: "🔍 Range:"
                            color: "#c4b5fd"
                            font.pixelSize: 12
                            font.weight: Font.Bold
                        }
                        Text {
                            text: gameController.currentMinRange + " – " + gameController.currentMaxRange
                            color: "#38bdf8"
                            font.pixelSize: 13
                            font.weight: Font.Black
                        }
                    }
                }

                // Status Badge
                Rectangle {
                    height: 38
                    width: statusText.implicitWidth + 28
                    radius: 19
                    color: gameController.gameState === "WON" ? "#065f46" : (gameController.gameState === "LOST" ? "#881337" : "#4c1d95")
                    border.color: gameController.gameState === "WON" ? "#10b981" : (gameController.gameState === "LOST" ? "#f43f5e" : "#8b5cf6")
                    border.width: 1.5

                    Text {
                        id: statusText
                        anchors.centerIn: parent
                        text: gameController.gameState === "WON" ? "VICTORY 🏆" : (gameController.gameState === "LOST" ? "DEFEAT 💀" : "ACTIVE 🎮")
                        color: "#ffffff"
                        font.pixelSize: 12
                        font.weight: Font.Bold
                    }
                }
            }
        }

        // MAIN CONTENT AREA (Split into Card and History Panel)

        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 20

            // LEFT CARD: GAMEPLAY BOARD

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: 60
                radius: 24
                color: "#140b2d"
                border.color: "#3b1d70"
                border.width: 1.5

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 24
                    spacing: 16

                    // Character Illustration Container
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredHeight: 220
                        radius: 18
                        color: "#1d0f42"
                        border.color: "#2e1663"
                        border.width: 1

                        Image {
                            id: charIllustration
                            anchors.centerIn: parent
                            width: Math.min(parent.width * 0.7, 240)
                            height: Math.min(parent.height * 0.85, 200)
                            fillMode: Image.PreserveAspectFit
                            smooth: true

                            // Dynamic source resolving relative or qrc path cleanly
                            source: gameController.gameState === "WON" ? "Resources/Happy.svg" : (gameController.gameState === "LOST" ? "Resources/fail.svg" : "Resources/Normal.svg")

                            // Floating motion animation
                            SequentialAnimation on anchors.verticalCenterOffset {
                                loops: Animation.Infinite
                                NumberAnimation { to: -8; duration: 2500; easing.type: Easing.InOutSine }
                                NumberAnimation { to: 8; duration: 2500; easing.type: Easing.InOutSine }
                            }
                        }
                    }

                    // Dynamic Feedback Banner Box
                    Rectangle {
                        Layout.fillWidth: true
                        height: 54
                        radius: 14
                        color: gameController.feedbackType === "WIN" ? "#064e3b" :
                               (gameController.feedbackType === "FAIL" ? "#450a0a" :
                               (gameController.feedbackType === "TOO_HIGH" ? "#881337" :
                               (gameController.feedbackType === "TOO_LOW" ? "#083344" : "#2e1065")))
                        border.color: gameController.feedbackType === "WIN" ? "#10b981" :
                                      (gameController.feedbackType === "FAIL" ? "#f43f5e" :
                                      (gameController.feedbackType === "TOO_HIGH" ? "#fb7185" :
                                      (gameController.feedbackType === "TOO_LOW" ? "#38bdf8" : "#8b5cf6")))
                        border.width: 1.5

                        Behavior on color { ColorAnimation { duration: 300 } }
                        Behavior on border.color { ColorAnimation { duration: 300 } }

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 20
                            anchors.rightMargin: 20
                            spacing: 12

                            Text {
                                Layout.fillWidth: true
                                text: gameController.feedbackText
                                color: "#ffffff"
                                font.pixelSize: 15
                                font.weight: Font.DemiBold
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                            }
                        }
                    }

                    // Input Controls Row
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 12

                        // Number Input TextField
                        Rectangle {
                            Layout.fillWidth: true
                            height: 52
                            radius: 14
                            color: "#0f0728"
                            border.color: guessInput.activeFocus ? "#a855f7" : "#3b1d70"
                            border.width: guessInput.activeFocus ? 2 : 1.5

                            Behavior on border.color { ColorAnimation { duration: 200 } }

                            TextField {
                                id: guessInput
                                anchors.fill: parent
                                anchors.leftMargin: 16
                                anchors.rightMargin: 16
                                placeholderText: qsTr("Enter guess (1 - 100)...")
                                placeholderTextColor: "#6b7280"
                                color: "#ffffff"
                                font.pixelSize: 16
                                font.weight: Font.Bold
                                verticalAlignment: Text.AlignVCenter
                                background: null
                                enabled: gameController.gameState === "PLAYING"

                                validator: IntValidator {
                                    bottom: gameController.currentMinRange
                                    top: gameController.currentMaxRange
                                }
                                Keys.onReturnPressed: gameController.processGuess(text)
                                Keys.onEnterPressed: gameController.processGuess(text)
                            }
                        }

                        // Submit Button
                        Rectangle {
                            id: submitBtn
                            width: 130
                            height: 52
                            radius: 14
                            enabled: gameController.gameState === "PLAYING" && guessInput.text.length > 0
                            opacity: enabled ? 1.0 : 0.5

                            gradient: Gradient {
                                GradientStop { position: 0.0; color: submitMouse.containsPress ? "#6d28d9" : (submitMouse.containsMouse ? "#a855f7" : "#8b5cf6") }
                                GradientStop { position: 1.0; color: submitMouse.containsPress ? "#4c1d95" : (submitMouse.containsMouse ? "#7c3aed" : "#6d28d9") }
                            }

                            Text {
                                anchors.centerIn: parent
                                text: qsTr("GUESS")
                                color: "#ffffff"
                                font.pixelSize: 15
                                font.weight: Font.Black
                                font.letterSpacing: 1
                            }

                            MouseArea {
                                id: submitMouse
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: parent.enabled ? Qt.PointingHandCursor : Qt.ArrowCursor
                                onClicked: gameController.processGuess(guessInput.text)
                            }

                            scale: submitMouse.containsPress ? 0.96 : (submitMouse.containsMouse ? 1.03 : 1.0)
                            Behavior on scale { NumberAnimation { duration: 150; easing.type: Easing.OutCubic } }
                        }

                        // Reset Button
                        Rectangle {
                            id: resetBtn
                            width: 120
                            height: 52
                            radius: 14
                            color: resetMouse.containsPress ? "#2e1663" : (resetMouse.containsMouse ? "#3b1d70" : "#1e1142")
                            border.color: "#6d28d9"
                            border.width: 1.5

                            RowLayout {
                                anchors.centerIn: parent
                                spacing: 6
                                Text {
                                    text: "🔄"
                                    font.pixelSize: 14
                                }
                                Text {
                                    text: qsTr("RESET")
                                    color: "#c4b5fd"
                                    font.pixelSize: 14
                                    font.weight: Font.Bold
                                }
                            }

                            MouseArea {
                                id: resetMouse
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: gameController.resetGame()
                            }

                            scale: resetMouse.containsPress ? 0.96 : (resetMouse.containsMouse ? 1.03 : 1.0)
                            Behavior on scale { NumberAnimation { duration: 150; easing.type: Easing.OutCubic } }
                        }
                    }

                    // Visual Range Visualizer Track
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 6

                        RowLayout {
                            Layout.fillWidth: true
                            Text {
                                text: "1"
                                color: "#6b7280"
                                font.pixelSize: 11
                                font.weight: Font.Bold
                            }
                            Item { Layout.fillWidth: true }
                            Text {
                                text: "Active Bounds: " + gameController.currentMinRange + " to " + gameController.currentMaxRange
                                color: "#a78bfa"
                                font.pixelSize: 11
                                font.weight: Font.DemiBold
                            }
                            Item { Layout.fillWidth: true }
                            Text {
                                text: "100"
                                color: "#6b7280"
                                font.pixelSize: 11
                                font.weight: Font.Bold
                            }
                        }

                        // Progress Gauge Bar
                        Rectangle {
                            Layout.fillWidth: true
                            height: 8
                            radius: 4
                            color: "#0f0728"
                            border.color: "#2e1663"
                            border.width: 1

                            // Active Range highlight
                            Rectangle {
                                x: ((gameController.currentMinRange - 1) / 99.0) * parent.width
                                width: Math.max(8, ((gameController.currentMaxRange - gameController.currentMinRange + 1) / 99.0) * parent.width)
                                height: parent.height
                                radius: 4
                                color: "#38bdf8"

                                Behavior on x { NumberAnimation { duration: 300; easing.type: Easing.OutCubic } }
                                Behavior on width { NumberAnimation { duration: 300; easing.type: Easing.OutCubic } }
                            }
                        }
                    }
                }
            }

            // RIGHT PANEL: HISTORY & LOGS
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: 40
                radius: 24
                color: "#140b2d"
                border.color: "#3b1d70"
                border.width: 1.5

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 20
                    spacing: 14

                    RowLayout {
                        Layout.fillWidth: true
                        Text {
                            text: qsTr("Attempt History")
                            color: "#ffffff"
                            font.pixelSize: 17
                            font.weight: Font.Bold
                        }
                        Item { Layout.fillWidth: true }
                        Text {
                            text: historyModel.count + " attempts"
                            color: "#a78bfa"
                            font.pixelSize: 12
                            font.weight: Font.Medium
                        }
                    }

                    // Divider line
                    Rectangle {
                        Layout.fillWidth: true
                        height: 1
                        color: "#2e1663"
                    }

                    // Empty state label
                    Text {
                        visible: historyModel.count === 0
                        Layout.alignment: Qt.AlignHCenter
                        Layout.topMargin: 40
                        text: qsTr("No guesses submitted yet.\nTake your first shot!")
                        color: "#6b7280"
                        font.pixelSize: 13
                        horizontalAlignment: Text.AlignHCenter
                        lineHeight: 1.3
                    }

                    // History ListView
                    ListView {
                        id: historyListView
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        clip: true
                        model: historyModel
                        spacing: 10

                        delegate: Rectangle {
                            width: historyListView.width
                            height: 48
                            radius: 12
                            color: model.resultType === "WIN" ? "#064e3b" : "#1e1142"
                            border.color: model.resultType === "WIN" ? "#10b981" :
                                          (model.resultType === "TOO_HIGH" ? "#f43f5e" : "#06b6d4")
                            border.width: 1

                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 14
                                anchors.rightMargin: 14
                                spacing: 10

                                Rectangle {
                                    width: 26; height: 26
                                    radius: 13
                                    color: "#2e1065"
                                    Text {
                                        anchors.centerIn: parent
                                        text: "#" + model.attemptNum
                                        color: "#c4b5fd"
                                        font.pixelSize: 11
                                        font.weight: Font.Bold
                                    }
                                }

                                Text {
                                    text: qsTr("Guess: ") + model.guessValue
                                    color: "#ffffff"
                                    font.pixelSize: 14
                                    font.weight: Font.Bold
                                }

                                Item { Layout.fillWidth: true }

                                Rectangle {
                                    height: 26
                                    width: resultLabel.implicitWidth + 16
                                    radius: 13
                                    color: model.resultType === "WIN" ? "#10b981" :
                                           (model.resultType === "TOO_HIGH" ? "#881337" : "#083344")

                                    Text {
                                        id: resultLabel
                                        anchors.centerIn: parent
                                        text: model.resultText
                                        color: "#ffffff"
                                        font.pixelSize: 11
                                        font.weight: Font.Bold
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

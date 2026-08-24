import QtQuick
import QtQuick.Controls

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
}

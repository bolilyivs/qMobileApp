/*
Плитка меню

*/

import QtQuick 2.11
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0

Rectangle{
    id: root
    property alias textColor: lbl.color
    property alias text: lbl.text
    property alias font: lbl.font
    property color bgColor: "#CCFFFFFF"
    radius: 10
    signal clicked()
    clip: true

    color: bgColor

    CLabel{
        id: lbl
        anchors.fill: parent
        anchors.margins: dp(10)
        color: "#BB000000"
        font.pixelSize: dp(16)
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    }

    MouseArea{
        anchors.fill: parent
        onClicked:{
            timer.start()
            root.state = "clicked"
        }
        z:10
    }

    Behavior on color{
        ColorAnimation{
            duration: 200
        }
    }

    states: [
        State {
            name: "pas"
            PropertyChanges {
                target: root
                color: bgColor
            }
        },
        State {
            name: "clicked"
            PropertyChanges {
                target: root
                color: "#90FF0000"
            }
        }
    ]

    Timer{
        id: timer
        interval: 200
        onTriggered: {
            root.clicked()
            root.state = "pas"
        }
    }
}

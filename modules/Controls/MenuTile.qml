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
    property color bgColor: "#90000000"
    signal clicked()

    color: bgColor

    layer.enabled: true
    layer.effect: DropShadow {
        horizontalOffset: 0
        verticalOffset: 0
        radius: 5
        samples: 6
    }

    CLabel{
        id: lbl
        anchors.fill: parent
        anchors.margins: dp(10)
        color: "white"
        font.pixelSize: dp(25)
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    }

    MouseArea{
        anchors.fill: parent
        onClicked:{
            timer.start()
            root.state = "clicked"
        }
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
        interval: 1000
        onTriggered: {
            root.clicked()
            root.state = "pas"
        }
    }
}

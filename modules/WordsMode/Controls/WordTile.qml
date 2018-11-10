/*
 Плитка со словом

*/

import QtQuick 2.11
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0
import "../../Controls"

Rectangle{
    id: root
    property alias textColor: lbl.color
    property alias text: lbl.text
    property alias font: lbl.font
    signal clicked()
    radius: dp(20)
    color: "#CCFFFFFF"

    CLabel{
        id: lbl
        anchors.fill: parent
        anchors.margins: dp(10)
        text: modelData
        color: "#BB000000"
        font.pixelSize: dp(20)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    }

    MouseArea{
        anchors.fill: parent
        onClicked:{
            root.clicked()
        }
    }

    Behavior on color{
        ColorAnimation{
            duration: 200
        }
    }

    states: [
        State {
            name: "normal"
            PropertyChanges {
                target: root
                color: "#CCFFFFFF"
            }
        },
        State {
            name: "wrong"
            PropertyChanges {
                target: root
                color: "#90FF0000"
            }
        },
        State {
            name: "correct"
            PropertyChanges {
                target: root
                color: "#9000FF00"
            }
        }
    ]

    onStateChanged: {
        timer.start()
    }

    Timer{
        id: timer
        interval: 500;
        property bool isNext: false
        onTriggered: {
            root.state = "normal"
        }
    }
}

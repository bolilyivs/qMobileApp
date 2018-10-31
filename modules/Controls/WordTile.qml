import QtQuick 2.11
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0

Rectangle{
    id: root
    property alias textColor: lbl.color
    property alias text: lbl.text
    property alias font: lbl.font
    signal clicked()
    radius: dp(20)
    color: "#90000000"


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
        text: modelData
        color: "white"
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
            name: "pas"
            PropertyChanges {
                target: root
                color: "#90000000"
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
}

/*
Панель заголовка режжима

*/

import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0
import "../Controls"

RowLayout{
    height: dp(80)
    property alias text: htlbl.text

    Rectangle{
        Layout.fillHeight: true
        color: "Transparent"
        UiLabel{
            text: "\uf100"
            font.pixelSize: dp(40)
            anchors.fill: parent
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
        }
        width: 50
    }



    Rectangle{
        id: headerText
        Layout.fillWidth: true
        Layout.fillHeight: true
        color: "Transparent"
        CLabel{
            id: htlbl
            anchors.fill: parent
            anchors.margins: dp(10)
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "white"
            font.pixelSize: dp(40)
            font.weight: Font.Bold
            layer.enabled: true
            layer.effect: DropShadow {
                horizontalOffset: 0
                verticalOffset: 0
                radius: 8.0
                samples: 8
            }
        }
    }
    Rectangle{
        Layout.fillHeight: true
        color: "Transparent"
        UiLabel{
            text: "\uf101"
            font.pixelSize: dp(40)
            anchors.fill: parent
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            Component.onCompleted: {
                console.log(font.family)
            }
        }
        width: 50
    }

}

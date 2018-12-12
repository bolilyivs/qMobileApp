import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import "../../Controls"

Rectangle {
    id: root
    property alias text: lbl.text
    property bool isMove: false

    signal clicked(var part)

    radius: height / 2
    color: "#BBFFFFFF"
    height: 50
    width: 50
    CLabel {
        id: lbl
        color: "#BB000000"
        fontSizeMode: Text.Fit
        anchors.fill: parent
        anchors.margins: 5
        minimumPixelSize: 10
        font.pixelSize: 72
        horizontalAlignment: Text.AlignHCenter
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            isMove = (!isMove) ? true : false
            root.clicked(root)
        }
    }
}

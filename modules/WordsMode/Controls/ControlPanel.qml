import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import "../../Controls"

Item {
    id: root
    width: parent.width
    height: 120

    signal clicked

    Image {
        id: panel
        source: "qrc:/images/bottom.svg"
        anchors.fill: parent
    }

    Button {
        anchors.bottom: panel.bottom
        anchors.horizontalCenter: panel.horizontalCenter
        width: parent.width
        font.pixelSize: 30
        anchors.bottomMargin: 20
        text: "Next"
        onClicked: root.clicked()
        background: Rectangle {
            color: "transparent"
        }
        contentItem: Text {
            text: parent.text
            font: parent.font
            opacity: enabled ? 1.0 : 0.3
            color: parent.down ? "#BB000000" : "#BBFFFFFF"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
    }
}

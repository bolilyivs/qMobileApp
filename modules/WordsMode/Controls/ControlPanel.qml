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
        anchors.bottomMargin: 20
        text: "Next"
        onClicked: root.clicked()
    }
}

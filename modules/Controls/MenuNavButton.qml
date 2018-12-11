import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Rectangle {
    property alias iconCode: icon.text
    property alias text: lbl.text
    color: "transparent"
    ColumnLayout {
        anchors.fill: parent
        anchors.bottomMargin: 20

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        UiLabel {
            id: icon
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            height: 80
            Layout.fillWidth: true
        }
        CLabel {
            id: lbl
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: icon.font.pixelSize / 2
            height: 20
            Layout.fillWidth: true
        }
    }
}

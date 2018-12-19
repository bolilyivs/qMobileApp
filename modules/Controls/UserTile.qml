import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Rectangle {
    id: root
    color: "transparent"
    RowLayout {
        anchors.fill: parent
        spacing: 30
        Rectangle {
            height: 100
            Layout.fillHeight: true
            width: height

            radius: height / 2
            color: "#BBFFFFFF"
        }
        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true
            CLabel {
                text: app.userName
                font.pixelSize: 40
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignBottom
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
            CLabel {
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }
    }
}

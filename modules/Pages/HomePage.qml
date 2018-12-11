import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import AppManager 1.0
import "../Controls"
import "../Panels"

Item {
    height: childrenRect.height

    ColumnLayout {
        width: parent.width
        spacing: 20
        UserTile {
            height: 100
            Layout.fillWidth: true
        }
        Rectangle {
            color: "#22000000"
            Layout.fillWidth: true
            height: 400
        }
    }
}

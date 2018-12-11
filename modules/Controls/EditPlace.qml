import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4

Rectangle {
    property alias text: ta.text
    color: "#BB000000"
    TextArea {
        id: ta
        anchors.fill: parent
        anchors.margins: 10
        color: "#BBFFFFFF"
        font.pixelSize: 30
    }
}

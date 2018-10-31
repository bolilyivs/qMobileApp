import QtQuick 2.11
import QtQuick.Controls 2.4


ToolButton{
    font.pixelSize: 30
    contentItem: UiLabel {
        text: parent.text
        font: parent.font
        color: "white"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

}

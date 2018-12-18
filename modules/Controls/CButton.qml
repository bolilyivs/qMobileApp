import QtQuick 2.12
import QtQuick.Controls 2.4

Button {
    id: tf
    padding: 10
    font.pixelSize: dp(30)
    background: Rectangle{
        anchors.fill: parent
        color: "#00000000"
        border.color: tf.down ? "#90600000" : "#90000000"
        radius: 6
    }
}

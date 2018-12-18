import QtQuick 2.12
import QtQuick.Controls 2.4

TextField {
    id: tf
    padding: 10
    background: Rectangle{
        anchors.fill: parent
        color: "#00000000"
        border.color: tf.focus ? "#90600000" : "#90000000"
        radius: 6
    }
}

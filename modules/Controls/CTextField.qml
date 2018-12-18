import QtQuick 2.12
import QtQuick.Controls 2.4

TextField {
    id: tf
    padding: 10
    property color bgcolor: "#00000000"
    background: Rectangle{
        anchors.fill: parent
        color: bgcolor
        border.color: tf.focus ? "#90600000" : "#90000000"
        radius: 6
    }
    validator: RegExpValidator{
         regExp: /^[a-zA-Z0-9]+$/
    }
}

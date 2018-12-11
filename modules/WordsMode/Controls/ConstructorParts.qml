import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import "../../Controls"

Rectangle {
    color: "#BB000000"
    property alias parts: gl.children

    GridLayout {
        id: gl
        anchors.fill: parent
        anchors.margins: 10
        rowSpacing: 0
        columnSpacing: 0
    }

    function addPart(obj) {
        obj.parent = gl
    }

    function clear() {
        for (var i in gl.children) {
            gl.children[i].destroy()
        }
    }
}

import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4

Item{
    id: root
    property alias text: lbl.text
    property alias color: bg.color
    property bool isTop: false

    signal moveTop()
    signal moveBottom()

    Rectangle{
        id: bg
        radius: 10
        anchors.fill: parent
        color: "#9000AAFF"
    }

    width: 80
    height: 60

    Label{
        id: lbl
        anchors.fill: parent
        anchors.margins: 5
        font.pixelSize: 30
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        onTextChanged: {
            root.width = text.length * font.pixelSize*2
            Layout.minimumWidth = root.width
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            if(!isTop){
                root.moveTop()
                isTop = true
            }
            else{
                isTop = false
                root.moveBottom()
            }
        }
    }
}

import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4

Item{
    id: root
    property alias text: lbl.text
    property alias color: bg.color
    property bool isTop: false

    Layout.fillWidth: true

    signal moveTop()
    signal moveBottom()

    Rectangle{
        id: bg
        radius: 5
        anchors.fill: parent
        color: "#9000AAFF"
        border.color: "black"
    }


    width: (lbl.implicitWidth > 80 ) ? lbl.implicitWidth + lbl.x*2 : 80
    height: 60

    Label{
        id: lbl
        x: 15
        height: parent.height
        font.pixelSize: 30
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
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

import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4

Rectangle{
    id: root
    property alias text: lbl.text
    property bool isTop: false

    Layout.fillWidth: true

    signal moveTop()
    signal moveBottom()

    radius: 5
    color: "#9000AAFF"
    width: (lbl.implicitWidth > 80 ) ? lbl.implicitWidth + lbl.x*2 : 80
    height: lbl.height
    border.color: "black"
    Label{
        id: lbl
        x: 15
        height: 60
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

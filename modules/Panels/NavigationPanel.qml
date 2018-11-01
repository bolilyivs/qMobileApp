import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0
import "../Controls"


Rectangle{
    height: dp(70)
    color: "#900a87ad"

    layer.enabled: true
    layer.effect: DropShadow {
        horizontalOffset: 0
        verticalOffset: 0
        radius: 5
        samples: 6
    }


    RowLayout{
        anchors.fill: parent

        MTButton{
            text: {
                if(stView>1)
                    visible = true
                if(stView.depth>2)
                    return "\uf060"
                else if(stView.depth>1)
                    return "\uf2f5"
                else{
                    return ""
                }
            }
            onClicked: {
                var obj = stView.pop()
                if(stView.depth>1)
                    obj.destroy(500)
            }
        }

        Rectangle{
            color: "transparent"
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        MTButton{
            text: "\uf085"
        }
    }
}
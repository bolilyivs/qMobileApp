import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import "../../Controls"

Item {
    id: root

    Rectangle{
        id: card
        color: "#BBFFFFFF"
        height: 400
        anchors.fill: parent

        ColumnLayout{
            anchors.fill: parent
            spacing: 0
            Item{
                Layout.fillWidth: true
                height: 80
                CLabel{
                    anchors.fill: parent
                    anchors.margins: 10
                    text: "Правила"
                    font.pixelSize: 40
                    color: "#BB000000"
                    verticalAlignment: Text.AlignBottom
                }
            }
            //Разделитель
            Rectangle{
                height: 2
                Layout.fillWidth: true
                color: "#90000000"
            }

            CLabel{
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "Здесь будут правила"
                font.pixelSize: 20
                color: "#BB000000"
            }
        }
    }
}

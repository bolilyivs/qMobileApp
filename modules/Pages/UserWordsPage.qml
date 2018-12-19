

/*
Страница ввода

*/
import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0
import "../Controls"
import "../Panels"

Rectangle {
    id: root
    color: "#00000000"
    signal search

    Component.onCompleted: {
        app.receiveUserWords()
    }

    ColumnLayout {
        anchors.fill: parent

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 6
            color: "#CCFFFFFF"
            ListView{
                id: lv
                clip: true
                anchors.fill: parent
                model: app.currentData
                delegate: cardsDeleg
                focus: true
            }

        }


    }

    Component {
        id: cardsDeleg
         Rectangle {
            width: root.width;
            height: 80
            color: "#00000000"
            border.color: "#BB000000"
            property int dbId: modelData["id"]
            RowLayout{
                anchors.fill: parent
                ColumnLayout {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    CLabel {
                        color: "#BB000000";
                        text: '<b>Word:</b> ' + modelData["word"]
                        font.pixelSize: 20
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        verticalAlignment: Text.AlignVCenter
                    }
                    CLabel {
                        color: "#BB000000";
                        text: '<b>Translation:</b> ' + modelData["translation"]
                        font.pixelSize: 20
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                MTButton {
                    text: "\uf2ed"
                    Layout.fillHeight: true
                    width: 60
                    onClicked: {
                        app.removeUserWord(dbId)
                        app.receiveUserWords()
                    }
                }
            }


        }
    }
}

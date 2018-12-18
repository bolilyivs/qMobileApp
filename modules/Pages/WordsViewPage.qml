

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
        app.receiveSomethingWords()
    }

    ColumnLayout {
        anchors.fill: parent

        CTextField {
            id: search
            Layout.fillWidth: true
            font.pixelSize: dp(30)
            bgcolor: "#BBFFFFFF"
            color: "#BB000000"
            placeholderText: "Search"
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 6
            color: "#CCFFFFFF"
            ListView{
                clip: true
                anchors.fill: parent
                model: app.currentData
                delegate: cardsDeleg
                focus: true
            }

        }

        Rectangle {
            height: 150
            Layout.fillWidth: true
            color: "#00000000"
            Image {
                id: name
                source: "qrc:/images/bottom.svg"
                anchors.fill: parent
            }

            RowLayout {
                anchors.fill: parent
                anchors.topMargin: 30
                Button {
                    text: "\uf2f6 Поиск"
                    font.family: aweFont.name
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    font.pixelSize: dp(30)
                    onClicked: enter()
                    background: Rectangle {
                        color: "transparent"
                    }
                    contentItem: Text {
                        text: parent.text
                        font: parent.font
                        opacity: enabled ? 1.0 : 0.3
                        color: parent.down ? "#BB000000" : "#BBFFFFFF"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                }
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
            Column {
                anchors.fill: parent
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
            MouseArea{
                anchors.fill: parent
                onClicked: app.addToUserWord(dbId)
            }
        }
    }
}

import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import AppManager 1.0
import "../../Controls"

Item {
    property var card
    property var translations

    property int countCorrect
    property int countCards
    property int currentCard

    signal next

    ColumnLayout {
        anchors.fill: parent
        spacing: 40
        WordCard {
            id: wd
            Layout.fillWidth: true
            height: 230
            countCorrect: root.countCorrect
            countCards: root.countCards
            word: card["word"]
            transcription: app.speechText
        }

        Rectangle {
            height: 230
            Layout.fillWidth: true
            color: "#BB000000"

            CLabel {
                id: cl
                font.pixelSize: 50
                text: card["translation"]
                onTextChanged: {
                    visible = false
                    btn.visible = true
                }
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Button {
                id: btn
                anchors.fill: parent
                width: parent.width
                text: "Показать"
                font.pixelSize: 30

                onClicked: {
                    visible = false
                    cl.visible = true
                }
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    opacity: enabled ? 1 : 0.3
                    color: "transparent"
                    border.color: parent.down ? "#BB000000" : "#BBFFFFFF"
                    border.width: 2
                    radius: 20
                }
                contentItem: CLabel {
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

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        ControlPanel {
            Layout.fillWidth: true
            onClicked: next()
        }
    }
}

import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import AppManager 1.0
import "../../Controls"

Item {
    id: root
    property var card
    property var translations

    property int countCorrect
    property int countCards
    property int currentCard


    onCardChanged: {
        if(ep.placeholderText == "Неверно")
            ep.placeholderText = "Верно!"
    }

    signal next(var text)

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
            isVisibleText: false
        }

        Rectangle{
            height: 80
            color: "transparent"
            Layout.fillWidth: true
            CTextField {
                id: ep
                anchors.fill: parent
                font.pixelSize: 25
                bgcolor: "#BBFFFFFF"
                placeholderText: "Введите слово"
            }
        }



        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        ControlPanel {
            Layout.fillWidth: true
            onClicked:{
                ep.placeholderText = "Неверно"
                next(ep.text)
                ep.text = ""
            }
        }
    }
}

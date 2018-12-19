

/*
 Единица режима слово-перевод
*/
import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import "../../Controls"

Item {
    id: root
    property var card
    property var translations

    property int countCorrect
    property int countCards
    property int currentCard

    signal next(var tile)

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 40
        WordCard {
            id: wd
            Layout.fillWidth: true
            height: 230
            countCorrect: root.countCorrect
            countCards: root.countCards
            word: card["word"]
            //transcription: card["transcription"]
        }

        GridLayout {
            columns: 2

            WordTile {
                id: wt1
                text: translations[0]
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: next(wt1)
            }
            WordTile {
                id: wt2
                text: translations[1]
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: next(wt2)
            }
        }
    }
}

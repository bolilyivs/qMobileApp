

/*
 Единица режима слово-перевод
*/
import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import "../../Controls"

Item {
    id: root
    property var card

    property int countCorrect
    property int countCards
    property int currentCard

    signal next(var text)

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
            word: card["translation"]
            transcription: card["transcription"]
        }

        ConstructorPlace {
            id: cp
            text: root.card["word"]
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        ControlPanel {
            Layout.fillWidth: true
            onClicked: next(cp.getCreatedWord())
        }
    }
}

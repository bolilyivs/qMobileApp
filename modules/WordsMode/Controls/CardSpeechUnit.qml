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
            word: "word"
            transcription: app.speechText
            isVisibleText: false
        }

        EditPlace {
            id: ep
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        ControlPanel {
            Layout.fillWidth: true
            onClicked: next(ep.text)
        }
    }
}

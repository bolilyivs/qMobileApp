/*
 Единица режима слово-перевод
*/

import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import "Controls"

Item {
    id: root
    property var card
    property var translations

    property int countCorrect
    property int countCards
    property int currentCard

    signal next(var tile)

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 10
        spacing: 40
        WordCard{
            id: wd
            Layout.fillWidth: true
            height: 230
            word: speechText
        }

        WordTile{
            id:rec
            text: "Record"
            Layout.fillWidth: true
            height: dp(100)
            onClicked: startRecord()
        }
        WordTile{
            id:stop
            text: "Stop"
            Layout.fillWidth: true
            height: dp(100)
            onClicked: stopRecord()
            visible: false
        }
    }

    function startRecord(){
        rec.visible = false
        stop.visible = true
        app.startRecord()
    }

    function stopRecord(){
        rec.visible = true
        stop.visible = false
        app.stopRecord()
    }

}

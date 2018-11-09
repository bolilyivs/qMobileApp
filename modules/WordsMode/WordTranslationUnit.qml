/*
 Единица режима слово-перевод
*/

import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import "../Controls"

Item {
    id: root
    property alias word : wd.word
    property alias transcription : wd.transcription
    property string correctTranslation
    property var translations
    property bool correct: false
    property int countCorrect
    property int countCards

    signal next()

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 10
        spacing: 40
        WordCard{
            id: wd
            Layout.fillWidth: true
            height: 230
            countCorrect: root.countCorrect
            countCards: root.countCards
        }

        GridLayout{
            columns: 2
            Repeater{
                model: translations

                WordTile{
                    text: modelData
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    onClicked: {
                        if(text === correctTranslation){
                            correct = true
                            state = "correct"
                            app.say("Right!")
                        }else{
                            app.say("Wrong!")
                            state = "wrong"
                        }
                        timer.start()

                    }
                }
            }
        }

        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }

    Timer{
        id: timer
        interval: 1000
        onTriggered: {
            next()
        }
    }
}

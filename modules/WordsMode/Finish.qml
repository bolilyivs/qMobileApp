/*
Результаты

*/


import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import "../Controls"

Item {
    id: root
    property int corrects
    property int countCards

    ColumnLayout{
        id: com
        anchors.fill: parent
        anchors.margins: 20
        Rectangle{
            Layout.fillWidth: true
            height: dp(100)
            UiLabel{
                anchors.fill: parent
                text: "\uf274 Верно: " + corrects
                color: "white"
                font.pixelSize: dp(30)
                anchors.margins: 20
                verticalAlignment: Text.AlignVCenter
            }
            radius: 6
            color: "#90000000"
        }
        Rectangle{
            Layout.fillWidth: true
            height: dp(100)
            UiLabel{
                anchors.fill: parent
                text: "\uf273 Ошибок: " + (countCards - corrects)
                color: "white"
                font.pixelSize: dp(30)
                anchors.margins: 20
                verticalAlignment: Text.AlignVCenter
            }
            color: "#90000000"
            radius: 6
        }
        Rectangle{
            Layout.fillWidth: true
            height: dp(100)
            UiLabel{
                anchors.fill: parent
                text: "\uf641 Всего слов: " + countCards
                color: "white"
                font.pixelSize: dp(30)
                anchors.margins: 20
                verticalAlignment: Text.AlignVCenter
            }
            color: "#90000000"
            radius: 6
        }

        Rectangle{
            Layout.fillWidth: true
            Layout.fillHeight: true
            UiLabel{
                anchors.fill: parent
                text: {
                    var res = corrects/countCards
                    if(res > 0.9){
                        speech.say("Perfect!")
                        return "Perfect\n\uf005\uf005\uf005\uf005\uf005"
                    }else if(res > 0.7){
                        speech.say("Good!")
                        return "Good\n\uf005\uf005\uf005\uf005"
                    }else if(res > 0.5){
                        speech.say("Not bad!")
                        return "Not bad\n\uf005\uf005\uf005"
                    }else if(res > 0.2){
                        speech.say("Bad!")
                        return "Bad\n\uf005\uf005"
                    }else{
                        speech.say("Very bad!")
                        return "Very bad\n\uf005"
                    }
                }

                color: "white"
                font.pixelSize: dp(50)
                anchors.margins: 20
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
            color: "#90000000"
            radius: 6
        }
    }

    function getResults(corrects, countCards){
        root.corrects = corrects
        root.countCards = countCards
    }
}

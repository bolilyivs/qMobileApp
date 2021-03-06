/*
Результаты

*/


import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import AppManager 1.0
import "../Controls"

Item {
    id: root

    ColumnLayout{
        id: com
        anchors.fill: parent
        anchors.margins: 20
        Rectangle{
            Layout.fillWidth: true
            height: dp(100)
            UiLabel{
                anchors.fill: parent
                text: "\uf274 Верно: " + app.resCorrectCards
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
                text: "\uf273 Ошибок: " + (app.resTotalCards - app.resCorrectCards)
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
                text: "\uf641 Всего слов: " + app.resTotalCards
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
                    var res = app.resCorrectCards/app.resTotalCards
                    if(res > 0.9){
                        app.say("Perfect!")
                        return "Perfect\n\uf005\uf005\uf005\uf005\uf005"
                    }else if(res > 0.7){
                        app.say("Good!")
                        return "Good\n\uf005\uf005\uf005\uf005"
                    }else if(res > 0.5){
                        app.say("Not bad!")
                        return "Not bad\n\uf005\uf005\uf005"
                    }else if(res > 0.2){
                        app.say("Bad!")
                        return "Bad\n\uf005\uf005"
                    }else{
                        app.say("Very bad!")
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

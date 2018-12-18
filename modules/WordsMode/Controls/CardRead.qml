/*
Режим слово-перевод

*/

import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import AppManager 1.0
import "../../Controls"

Item {
    id: root
    property int corrects: 0
    property bool isCorrect: true
    property var cards
    property int index: 0

    CardReadUnit{
        id: curCard
        countCorrect: corrects
        countCards: root.cards.length
        currentCard: index+1
        anchors.fill: parent
        onNext: checkAnswer(tile, txt)
    }

    Component.onCompleted: initCard()

    Timer{
        id: timer
        interval: 600;
        property bool isNext: false
        onTriggered: nextCard()
    }


    function initCard(){
        app.receiveUserWords()
        cards = app.currentData
        curCard.card = root.cards[root.index]
    }

    function checkAnswer(tile, txt){
        if(txt.toLowerCase() !== cards[root.index]["word"].toLowerCase()){
            isCorrect = false
            tile.state = "wrong"
            return
        }
        tile.state = "correct"
        if(isCorrect)
            corrects++
        isCorrect = true
        index++
        timer.start()
    }

    function nextCard(){
        if(index === cards.length){
            stView.popDestroy()
            app.setPage(AppManager.Finish)
            app.sendWordModeResults({"correctCards": corrects, "totalCards": cards.length})
            return
        }

        curCard.card = root.cards[index]
        curCard.translations = shuffleTranslations()
    }
}

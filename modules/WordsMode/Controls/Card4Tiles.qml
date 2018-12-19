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
    property var correctCards: []

    function addCorrectCard(){
        correctCards.push(cards[index]["id"])
        console.log(correctCards)
    }

    Card4TilesUnit{
        id: curCard
        countCorrect: corrects
        countCards: root.cards.length
        currentCard: index+1
        translations: root.transitions
        anchors.fill: parent
        onNext: checkAnswer(tile)
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
        curCard.translations = shuffleTranslations()
        console.log(translations)
    }

    function checkAnswer(tile){
        if(tile.text !== cards[root.index]["translation"]){
            isCorrect = false
            tile.state = "wrong"
            return
        }
        tile.state = "correct"
        if(isCorrect){
            corrects++
            addCorrectCard()
        }
        isCorrect = true
        index++
        timer.start()
    }

    function nextCard(){
        if(index === cards.length){
            stView.popDestroy()
            app.sendWordModeResults(correctCards, {"correctCards": corrects, "totalCards": cards.length})
            app.setPage(AppManager.Finish)
            return
        }

        curCard.card = root.cards[index]
        curCard.translations = shuffleTranslations()
    }

    function getTranslations(){
        var tr = []
        for(var i in cards){
            tr.push(cards[i]["translation"])
        }

        return tr
    }

    function shuffleTranslations(){
        var num = 0
        var tr = getTranslations()
        var randtr = []
        randtr.push(cards[index]["translation"])
        tr.splice(tr.indexOf(cards[index]["translation"]), 1)
        for(var i=0; i< 3; i++){
            num = randomRange(0,tr.length)
            console.log(num)
            randtr.push(tr[num])
            tr.splice(num, 1)
        }
        return app.shuffle(randtr)
    }

    function randomRange(min, max){
        return Math.floor(Math.random() * (max - min)) + min
    }
}

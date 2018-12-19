import QtQuick 2.12
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


    Component.onCompleted: initCard()

    ConstructorUnit {
        id: curCard
        anchors.fill: parent
        countCorrect: corrects
        countCards: root.cards.length
        currentCard: index + 1
        onNext: checkWord(text)
    }

    function checkWord(text) {
        console.log(text, curCard.card["word"])
        if (text === curCard.card["word"]) {
            addCorrectCard()
            index++
            corrects++
            nextCard()
        }
    }

    function nextCard() {
        if (index === cards.length) {
            stView.popDestroy()
            app.sendWordModeResults(correctCards, {"correctCards": corrects, "totalCards": cards.length})
            app.setPage(AppManager.Finish)
            return
        }

        curCard.card = root.cards[index]
    }

    function initCard() {
        app.receiveUserWords()
        cards = app.currentData
        curCard.card = root.cards[root.index]
    }
}

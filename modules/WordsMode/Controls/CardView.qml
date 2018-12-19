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

    CardViewUnit {
        id: curCard
        anchors.fill: parent
        countCorrect: corrects
        countCards: root.cards.length
        currentCard: index + 1
        onNext: nextCard()
    }

    function nextCard() {
        addCorrectCard()
        index++
        corrects++
        console.log("test")
        if (index === cards.length) {
            stView.popDestroy()
            app.sendWordModeResults(correctCards, {"correctCards": corrects, "totalCards": cards.length})
            app.setPage(AppManager.Finish)
            console.log("correctCards", corrects)
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

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
            index++
            corrects++
            nextCard()
        }
    }

    function nextCard() {
        if (index === cards.length) {
            stView.popDestroy()
            app.setPage(AppManager.Finish)
            app.sendWordModeResults({
                                        "correctCards": corrects,
                                        "totalCards": cards.length
                                    })
            return
        }

        curCard.card = root.cards[index]
    }

    function initCard() {
        app.receiveWordCards()
        cards = app.currentData
        curCard.card = root.cards[root.index]
    }
}

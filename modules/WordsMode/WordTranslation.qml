/*
Режим слово-перевод

*/


import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import AppManager 1.0
import "../Controls"

Item {
    id: root
    property int corrects: 0
    property var cards: app.currentData

    QtObject{
       Component.onCompleted: app.receiveWordCards()
    }

    StackView{
        id:lsv
        anchors.fill: parent
        Repeater{
            model: cards

            WordTranslationUnit{
                id: card
                word: modelData["word"]
                correctTranslation: modelData["translation"]
                countCorrect: corrects
                countCards: cards.length - index
                onCorrectChanged: {
                    corrects++
                }

                onNext:{
                    if(lsv.depth != 1)
                        lsv.pop()
                    else{
                        stView.pop()
                        app.setPage(AppManager.Finish)
                        app.sendWordModeResults({"correctCards": root.corrects, "totalCards": root.cards.length})
                    }
                }
                Component.onCompleted: {
                    lsv.push(card)
                    var trnsl = []
                    var tempWords = root.cards.slice()

                    for(var i=0; i<3;){
                        var rand = Math.round((Math.random() * 10)) % tempWords.length
                        if(tempWords[rand]["translation"] === correctTranslation)
                            continue;
                        trnsl.push(tempWords[rand]["translation"])
                        tempWords.splice(rand, 1)
                        console.log(tempWords)
                        i++
                    }

                    rand = Math.round((Math.random() * 10)) % trnsl.length
                    trnsl.splice(rand, 0, correctTranslation)

                    card.translations = trnsl
                }
            }
        }

    }






}

import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import "../Controls"

Item {
    id: root
    property int corrects: 0
    property var cards: [["house", "дом"], ["car", "автомобиль"],
        ["day", "день"], ["sky","небо"], ["tree", "дерево"],
        ["black", "черный"]]

    StackView{
        id:lsv
        anchors.fill: parent
        Repeater{
            model: cards

            WordTranslationUnit{
                id: card
                word: modelData[0]
                correctTranslation: modelData[1]
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
                        var str = "qrc:/modules/WordsMode/Finish.qml"
                        var obj = createPage(str)
                        obj.getResults(root.corrects, root.cards.length)
                        stView.push(obj)
                    }
                }
                Component.onCompleted: {
                    lsv.push(card)
                    var trnsl = []
                    var tempWords = root.cards.slice()

                    for(var i=0; i<3;){
                        var rand = Math.round((Math.random() * 10)) % tempWords.length
                        if(tempWords[rand][1] === correctTranslation)
                            continue;
                        trnsl.push(tempWords[rand][1])
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

import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import AppManager 1.0

Item {
    id: root

    property bool reversCreator: false

    property int index: 0
    property int corrects: 0
    property bool isCorrect: true

    property var inData

    property var sentences
    property var translates

    onInDataChanged: {
        var arr = shuffle(inData)
        sentences = []
        translates = []
        for(var i=0; i<arr.length; i++){
            if(!reversCreator){
                sentences.push(arr[i]["sentence"]+"")
                translates.push(arr[i]["translation"]+"")
            }else{
                sentences.push(arr[i]["translation"]+"")
                translates.push(arr[i]["sentence"].replace("_"," ")+"")
            }


        }
        scu.sentence = getSentenceParts(sentences[index])
        scu.sentenceTranslate = translates[index]
        console.log(sentences)
    }

    SentenceCreatorUnit{
        id: scu
        anchors.fill: parent
        anchors.margins: 10
        onNext: checkAnswer()
    }

    function checkAnswer(){
        for(var i in scu.sentence){
            if(scu.sentence[i] !== scu.currentSentence[i]){
                isCorrect = false
                scu.status = "wrong"
                app.say("Wrong")
                timer.start()
                return
            }
        }
        if(isCorrect){
            corrects++
        }
        scu.status = "correct"
        if(!reversCreator)
            app.say(scu.sentence.join(" "))
        else
            app.say(scu.sentenceTranslate)
        timer.isNext = true
        timer.start()
    }

    function nextSentence(){
        index++;
        isCorrect = true
        timer.isNext = false
        if(index >= sentences.length){
            stView.pop()
            stView.pop()
            app.setPage(AppManager.Finish)
            app.sendGrammarModeResults({"correctCards": root.corrects, "totalCards": root.sentences.length})

        }
        scu.sentence = getSentenceParts(sentences[index])
        scu.sentenceTranslate = translates[index]
    }

    function getSentenceParts(sentence){
        console.log(sentence)
        var sentenceParts = sentence.split(" ")
        console.log(sentenceParts)
        for(var i in sentenceParts){
            sentenceParts[i] = sentenceParts[i].replace("_", " ")
        }
        return sentenceParts
    }

    Timer{
        id: timer
        interval: 1000;
        property bool isNext: false
        onTriggered: {
            if(isNext)
                nextSentence()
            scu.status = "normal"
        }
    }

    function shuffle(array){
        var larray = array.slice()
        var sharr = []
        while(larray.length>0){
            var i = Math.round(Math.random()*100) % larray.length
            sharr.push(larray[i])
            larray.splice(i, 1)
        }
        return sharr
    }
}


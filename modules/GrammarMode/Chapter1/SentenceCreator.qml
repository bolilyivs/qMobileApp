import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import "../../Controls"

Item {
    id: root
    height: 1000
    width: 600

    property int index: 0
    property int corrects: 0
     property bool isCorrect: true

    property var sentences: [
     "I am a_man",
     "You are a_robot",
     "He is a_student",
     "She is a_doctor",
     "They are androids"
    ]

    property var translates: [
     "Я (есть) человек",
     "Ты (есть) роборт",
     "Он (есть) студент",
     "Она (есть) доктор",
     "Они (есть) андроиды"
    ]

    SentenceCreatorUnit{
        id: scu
        anchors.fill: parent
        sentence: getSentenceParts(sentences[index])
        sentenceTranslate: translates[index]
        onNext: checkAnswer()
    }

    function checkAnswer(){
        for(var i in scu.sentence){
            if(scu.sentence[i] !== scu.currentSentence[i]){
                isCorrect = false
                scu.status = "wrong"
                timer.start()
                return
            }
        }
        if(isCorrect){
            corrects++
            scu.status = "correct"
        }
        timer.isNext = true
        timer.start()
    }

    function nextSentence(){
        index++;
        isCorrect = true
        timer.isNext = false
        if(index >= sentences.length){
            stView.pop()
            var str = "qrc:/modules/WordsMode/Finish.qml"
            var obj = createPage(str)
            obj.getResults(root.corrects, sentences.length)
            stView.push(obj)
        }
    }

    function getSentenceParts(sentence){
        var sentenceParts = sentence.split(" ")
        for(var i in sentenceParts){
            sentenceParts[i] = sentenceParts[i].replace("_", " ")
        }
        return sentenceParts
    }

    Timer{
        id: timer
        interval: 500;
        property bool isNext: false
        onTriggered: {
            if(isNext)
                nextSentence()
            scu.status = "normal"
        }
    }
}


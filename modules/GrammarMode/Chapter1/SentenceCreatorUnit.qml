import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import "../../Controls"

Item {
    property var sentence
    property var currentSentence
    property string sentenceTranslate
    property string status: "normal"

    onSentenceChanged: newSentence()
    onNext: {
        currentSentence = getCurrentSentence()
    }

    signal next()

    ColumnLayout{
        anchors.fill: parent
        //Карточка предложения
        Rectangle{

            id: card
            color: "#90FFFFFF"
            height: 400
            Layout.fillWidth: true
            radius: 30
            state: status
            states:[
                State {
                    name: "normal"
                    PropertyChanges {
                        target: card
                        color: "#90FFFFFF"
                    }
                },
                State {
                    name: "correct"
                    PropertyChanges {
                        target: card
                        color: "#90009900"
                    }
                },
                State {
                    name: "wrong"
                    PropertyChanges {
                        target: card
                        color: "#90990000"
                    }
                }
            ]

            ColumnLayout{
                anchors.fill: parent
                spacing: 0
                //Перевод
                Item{
                    Layout.fillWidth: true
                    height: 80
                    Label{
                        anchors.fill: parent
                        anchors.margins: 10
                        text: sentenceTranslate
                        font.pixelSize: 30
                        verticalAlignment: Text.AlignBottom
                    }
                }
                //Разделитель
                Rectangle{
                    height: 2
                    Layout.fillWidth: true
                    color: "#90000000"
                }
                //Контейнер предложения
                Item{
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    GridLayout{
                        anchors.fill: parent
                        anchors.margins: 20
                        id: glSentence
                    }
                }
            }
        }

        Button{
            text: "Next"
            Layout.fillWidth: true
            implicitHeight: 80
            onClicked: next()
        }

        //Контейнер частей предложения
        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true
            GridLayout{
                id: glbottom
                anchors.fill: parent
                rowSpacing: 1
                columnSpacing: 1
                flow: GridLayout.LeftToRight
            }
        }
    }

    //Получить текущее предложение
    function getCurrentSentence(){
        var csent = []
        for(var i in glSentence.children){
            csent.push(glSentence.children[i].text)
        }
        return csent
    }

    //Новое предложение
    function newSentence(){
        clearArray(glbottom.children)
        clearArray(glSentence.children)

        for(var i in sentence){
            console.log(sentence)
            if(csp.status == Component.Ready ){
                var obj = csp.createObject(glbottom)
                obj.text = sentence[i]
                obj.color = ["#60FF0000", "#6000FF00", "#600000FF"][i%3]
                console.log(obj.color, obj.height, obj.width)
            }
        }
    }

    function clearArray(arr){
        if(arr.length !== 0){
            for(var i in arr){
                arr[i].destroy()
            }
        }
    }



    //Компонент части предложения
    Component{
        id: csp
        SentencePart{
            onMoveTop: {
                parent = glSentence
            }
            onMoveBottom: parent = glbottom
        }
    }
}


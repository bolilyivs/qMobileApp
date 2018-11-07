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
            color: "#BBFFFFFF"
            height: 400
            Layout.fillWidth: true
            Layout.fillHeight: true
            radius: 30

            ColumnLayout{
                anchors.fill: parent
                spacing: 0
                //Перевод
                Item{
                    Layout.fillWidth: true
                    height: 80
                    CLabel{
                        anchors.fill: parent
                        anchors.margins: 10
                        text: sentenceTranslate
                        font.pixelSize: 20
                        color: "#BB000000"
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
                    Layout.minimumHeight: 50
                    Layout.preferredHeight: glSentence.childrenRect.height+20

                    GridLayout{
                        id: glSentence
                        anchors.fill: parent
                        anchors.margins: 10
                        rowSpacing: 0
                        columnSpacing: 0
                        columns: 4
                    }
                }

                Item{
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
                Button{
                    text: "Next"
                    Layout.fillWidth: true
                    Layout.margins: 30
                    implicitHeight: 80
                    onClicked: next()
                    background: Rectangle{
                        id:enb
                        radius: 20
                        color: "transparent"
                        border.color: "#BB000000"
                        border.width: 2

                        state: status
                        states:[
                            State {
                                name: "normal"
                                PropertyChanges {
                                    target: enb
                                    color: "transparent"
                                }
                            },
                            State {
                                name: "correct"
                                PropertyChanges {
                                    target: enb
                                    color: "#90009900"
                                }
                            },
                            State {
                                name: "wrong"
                                PropertyChanges {
                                    target: enb
                                    color: "#90990000"
                                }
                            }
                        ]
                        Behavior on color{ ColorAnimation{ duration: 1000 }}
                    }
                }

            }
        }

        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true
        }



        //Контейнер частей предложения
        Rectangle{
            Layout.fillWidth: true
            Layout.minimumHeight: 50
            Layout.preferredHeight: glbottom.childrenRect.height+20
            color: "#BBFFFFFF"
            radius: 30
            GridLayout{
                id: glbottom
                anchors.fill: parent
                anchors.margins: 10
                rowSpacing: 1
                columnSpacing: 1
                flow: GridLayout.LeftToRight
                columns: 4
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

        var lsentence = shuffle(sentence)

        for(var i in lsentence){
            if(csp.status == Component.Ready ){
                var obj = csp.createObject(glbottom)
                obj.text = lsentence[i]
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



    //Компонент части предложения
    Component{
        id: csp
        SentencePart{
            Layout.alignment : Qt.AlignTop | Qt.AlignLeft
            Layout.fillWidth: true
            onMoveTop: {
                parent = glSentence
            }
            onMoveBottom: parent = glbottom
        }
    }
}


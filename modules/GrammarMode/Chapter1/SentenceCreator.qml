import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import "../../Controls"

Item {
    height: 1000
    width: 600
    property var sentence
    property alias currentSentence: lblCurrentSentence.text
    property string sentenceTranslate

    currentSentence: {
        var str = ""
        for(var i in glSentence.children){
            if(i !== 0)
                str += " "
            str += glSentence.children[i].text
        }
        return str
    }

    ColumnLayout{
        anchors.fill: parent
        //Карточка предложения
        Rectangle{
            color: "#90FFFFFF"
            height: 400
            Layout.fillWidth: true
            radius: 30
            border.color: "black"

            ColumnLayout{
                anchors.fill: parent
                spacing: 0
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

                Rectangle{
                    height: 2
                    Layout.fillWidth: true
                    color: "black"
                }

                Item{
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    GridLayout{
                        anchors.fill: parent
                        anchors.margins: 20
                        id: glSentence
                    }
                }

                Rectangle{
                    height: 2
                    Layout.fillWidth: true
                    color: "black"
                }

                Item{
                    Layout.fillWidth: true
                    height: 80
                    Label{
                        id: lblCurrentSentence
                        anchors.fill: parent
                        anchors.margins: 10
                        text: root.currentSentence
                        font.pixelSize: 30
                        verticalAlignment: Text.AlignBottom
                    }
                }
            }
        }

        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true
            GridLayout{
                id: glbottom
                anchors.fill: parent
                rowSpacing: 1
                columnSpacing: 1
                flow: GridLayout.LeftToRight

                Repeater{
                    model: sentence
                    SentencePart{
                        text: modelData
                        color: ["#60FF0000", "#6000FF00", "#600000FF"][index%3]
                        onMoveTop: parent = glSentence
                        onMoveBottom: parent = glbottom
                    }
                }

            }
        }


    }

}


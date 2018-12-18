import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import "../Controls"
Item {
    id: root
    anchors.centerIn: parent
    anchors.fill: parent
    property var cards
    Component.onCompleted: {
        initCard()
    }

    function initCard() {
        app.receiveWordCards()
        cards = app.currentData
        var words = []
        var cluse = []
        for(var i in cards){
            words.push(cards[i]["word"])
            cluse.push(cards[i]["translation"])
        }
        cg.words = words
        cg.clues = cluse
        console.log(words)
        console.log(cluse)
        cg.init()
    }


    ColumnLayout{
        anchors.fill: parent
        spacing: 30
        Grid{
            id: gr
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.leftMargin: root.width/2 - childrenRect.width/2
        }
        RowLayout{
            Layout.preferredHeight: childrenRect.height
            Layout.fillWidth: true
            Label{
                id: taAcross
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "white"
                font.pixelSize: 20
                Layout.leftMargin: 30
            }
            Label{
                id: taDown
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "white"
                font.pixelSize: 20
            }
        }


        ControlPanel {
            Layout.fillWidth: true
            onClicked: {
                          var ok = true
                          for(var i in gr.children){
                              if(!gr.children[i].readOnly){
                                  var correctLetter = cg.letters[gr.children[i].i][gr.children[i].j]
                                  if(gr.children[i].text != correctLetter){
                                      ok = false
                                      gr.children[i].bgcolor = "white"
                                  }else{
                                      gr.children[i].bgcolor = "#90009900"
                                  }
                                  console.log(correctLetter, gr.children[i].text)
                              }
                          }
                          console.log(ok)
                      }
        }

        CrosswordGenerator{
            id: cg
            function init(){
                run()
                var obj = ""
                var columns = 0

                for(var i in letters){
                    if(columns < letters[i].length)
                        columns = letters[i].length
                    for(var j in letters[0]){
                        if(letters[i][j] === "#")
                            obj = fill.createObject(gr)
                        else
                            obj = field.createObject(gr, {"placeholderText":starts[i][j], "i":i, "j":j})
                    }
                }
                gr.columns = columns

                taAcross.text = "По горизонтали:\n"
                for(var i in across){
                    taAcross.text += across[i] + "\n"
                }
                taDown.text = "\nПо вертикали:\n"
                for(i in down){
                    taDown.text += down[i] + "\n"
                }
            }
        }

        Component{
            id: field
            TextField{
                implicitHeight: root.width/(gr.columns+5)
                implicitWidth: implicitHeight
                property int i: 0
                property int j: 0
                property color bgcolor: "white"
                background: Rectangle{
                    color: parent.bgcolor
                    anchors.fill: parent
                    border.color: "gray"
                }
                maximumLength: 1
                font.pixelSize: implicitHeight/2
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignBottom
                bottomPadding: 0.5
            }
        }
        Component{
            id: fill
            TextField{
                implicitHeight: root.Height/(gr.rows+1)/2
                implicitWidth: implicitHeight
                property color bgcolor: "transparent"
                background: Rectangle{
                    color: parent.bgcolor
                    anchors.fill: parent
                }

                readOnly: true
            }
        }

    }
}

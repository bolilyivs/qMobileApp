import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0

Rectangle {
    id: root
    property alias word: wordLbl.text
    property alias transcription: transcriptionLbl.text
    property alias imgSource: img.source
    property int countCorrect: 0
    property int countCards: 0

    height: dp(250)
    width: parent.width
    color: "#90000000"

    layer.enabled: true
    layer.effect: DropShadow {
        horizontalOffset: 0
        verticalOffset: 0
        radius: 5
        samples: 6
    }

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 10
        spacing: 0
        Rectangle{
            height: 30
            Layout.fillWidth: true
            color: "#000a87ad"
            RowLayout{
                anchors.fill: parent
                anchors.margins: dp(10)
                Item{
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

                CLabel{
                    text: countCorrect + " \uf274"
                    color: "green"
                    font.family: aweFont.name
                    font.pixelSize: dp(30)
                }
                UiLabel{
                    text: countCards + " \uf641"
                    color: "yellow"
                    font.family: aweFont.name
                    font.pixelSize: dp(30)
                }
            }
        }

        RowLayout{
            Layout.fillWidth: true
            Layout.fillHeight: true

            Image{
                id: img
                Layout.fillHeight: true
                sourceSize.height: dp(100)
                sourceSize.width: dp(100)
                source: "qrc:/images/nopic.png"
                fillMode: Image.PreserveAspectFit
            }

            ColumnLayout{
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: 0

                CLabel{
                    id: wordLbl
                    Layout.fillWidth: true
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: dp(35)
                    color: "white"
                    height: dp(10)
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                }

                CLabel{
                    id: transcriptionLbl
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: dp(15)
                    color: "white"
                    height: dp(10)
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                }

            }

        }

    }



    MouseArea{
        anchors.fill: parent
        onClicked: {
            speech.say(wordLbl.text)
        }
    }

}

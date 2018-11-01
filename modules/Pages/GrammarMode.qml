import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import "../Controls"
import "../Panels"
Item {
    height: childrenRect.height

    ColumnLayout{
        width: parent.width
        spacing: dp(15)


        HeaderPanel{
            text: "Grammar"
            Layout.fillWidth: true
        }

        ColumnLayout{
            id: chapters
            spacing: dp(15)
            Layout.fillWidth: true
            Layout.fillHeight: true

            Repeater{
                model: [["Chapter 1", "cards"],
                    ["Chapter 2", "repeat"],
                    ["Chapter 3", "wordtr"],
                    ["Chapter 4", "trword"],
                    ["Chapter 5", "constrWords"],
                    ["Chapter 6", "hearing"]]

                MenuTile{
                    textColor: "white"
                    text: modelData[0]
                    Layout.fillWidth: true
                    height: dp(150)
                    onClicked: console.log(modelData[1])
                }
            }

        }
    }

}

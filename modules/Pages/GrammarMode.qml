/*
Режим грамматики
*/

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
                model: [["Chapter 1", "chapter1"],
                    ["Chapter 2", "chapter2"],
                    ["Chapter 3", "chapter3"],
                    ["Chapter 4", "chapter4"],
                    ["Chapter 5", "chapter5"],
                    ["Chapter 6", "chapter6"]]

                MenuTile{
                    textColor: "white"
                    text: modelData[0]
                    Layout.fillWidth: true
                    height: dp(150)
                    onClicked: changeMode(modelData[1])
                }
            }

        }
    }

}

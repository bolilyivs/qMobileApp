/*
Режим грамматики
*/

import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import AppManager 1.0
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
                model: [["Chapter 1", AppManager.Chapter1Menu],
                    ["Chapter 2", AppManager.Chapter1Menu],
                    ["Chapter 3", AppManager.Chapter1Menu],
                    ["Chapter 4", AppManager.Chapter1Menu],
                    ["Chapter 5", AppManager.Chapter1Menu],
                    ["Chapter 6", AppManager.Chapter1Menu]]

                MenuTile{
                    text: modelData[0]
                    Layout.fillWidth: true
                    height: dp(150)
                    onClicked: app.setPage(modelData[1])
                }
            }

        }
    }

}

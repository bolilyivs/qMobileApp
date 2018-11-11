/*
Панель выбора режима

*/

import QtQuick 2.11
import QtQuick.Controls 2.4
import "../Pages"
import "../GrammarMode/Chapter1"

Item {
    Flickable{
        id: flic
        clip: true
        anchors.fill: parent
        contentHeight: sv.currentItem.childrenRect.height + dp(100)
        width: parent.width
        SwipeView{
            id: sv
            anchors.fill: parent
            padding: dp(20)
            spacing: dp(20)
            WordsMode{
                id: wm
            }

            GrammarMode{
                id: wm2

            }

            GameModePage{
                id: wm3
            }

        }
    }


}

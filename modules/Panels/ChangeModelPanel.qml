

/*
Панель выбора режима

*/
import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import "../Pages"
import "../GrammarMode/Chapter1"

Item {

    ColumnLayout {
        anchors.fill: parent
        Flickable {
            id: flic
            clip: false
            contentHeight: sv.currentItem.childrenRect.height + dp(100)
            Layout.fillWidth: true
            Layout.fillHeight: true
            SwipeView {
                id: sv
                anchors.fill: parent
                padding: dp(20)
                spacing: dp(20)
                HomePage {
                    id: hp
                }

                GrammarMode {
                    id: wm2
                }

                WordsMode {
                    id: wm
                }

//                GameModePage {
//                    id: wm3
//                }
            }
        }

        MenuNavigation {
            Layout.fillWidth: true
            height: 150
        }
    }
}

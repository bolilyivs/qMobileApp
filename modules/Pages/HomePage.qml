import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtQuick.Window 2.12
import AppManager 1.0
import "../Controls"
import "../Panels"

Item {
    height: childrenRect.height

    ColumnLayout {
        width: parent.width
        spacing: 20
        UserTile {
            height: 100
            Layout.fillWidth: true

        }
        Rectangle {
            color: "#00000000"
            Layout.fillWidth: true
            height: 800
            ColumnLayout{
                anchors.fill: parent
                MenuTile {
                    text: "Словарь"
                    Layout.fillWidth: true
                    height: dp(150)
                    onClicked: app.setPage(AppManager.UserWordsPage)
                }
                MenuTile {
                    text: "Добавить в слова"
                    Layout.fillWidth: true
                    height: dp(150)
                    onClicked: app.setPage(AppManager.WordsViewPage)
                }
                Item{
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }
        }

    }
}

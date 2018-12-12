

/*
Режим слова

*/
import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import AppManager 1.0
import "../Controls"
import "../Panels"

Item {
    height: childrenRect.height
    width: dp(400)
    ColumnLayout {
        width: parent.width
        spacing: dp(15)

        MenuTile {
            text: "Обзор"
            Layout.fillWidth: true
            height: dp(200)
            onClicked: app.setPage(AppManager.WordView)
        }

        GridLayout {
            Layout.fillWidth: true

            //height: childrenRect.height
            columnSpacing: dp(15)
            rowSpacing: dp(15)
            columns: 2

            Repeater {
                model: [["Повторение", AppManager.WordRepeating], ["Слово - перевод", AppManager.WordTranslate], ["Перевод - слово", AppManager.TranslateWord], ["Конструктор слов", AppManager.WordConstructor], ["Понимание речи", AppManager.WordSpeech], ["Чтение", AppManager.WordReading]]

                MenuTile {
                    text: modelData[0]
                    Layout.fillWidth: true
                    height: dp(150)
                    onClicked: app.setPage(modelData[1])
                }
            }
        }
    }
}

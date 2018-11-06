/*
Режим слова

*/

import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import "../Controls"
import "../Panels"
Item {
    height: childrenRect.height
    width: dp(400)
    ColumnLayout{
        width: parent.width
        spacing: dp(15)

        HeaderPanel{
            text: "Words"
            Layout.fillWidth: true
        }


        MenuTile{
            text: "Комплекс"
            Layout.fillWidth: true
            height: dp(200)
        }

        GridLayout{
            Layout.fillWidth: true
            //height: childrenRect.height

            columnSpacing: dp(15)
            rowSpacing: dp(15)
            columns: 2

            Repeater{
                model: [["Карточки", "cards"],
                    ["Повторение", "repeat"],
                    ["Слово - перевод", "wordtr"],
                    ["Перевод - слово", "trword"],
                    ["Построение слов", "constrWords"],
                    ["Тренировка слуха", "hearing"]]

                MenuTile{
                    text: modelData[0]
                    Layout.fillWidth: true
                    height: dp(150)
                    onClicked: changeMode(modelData[1])
                    Component.onCompleted: {
                        if(text == "Слово - перевод"){
                            bgColor = "#900a87ad"
                        }
                    }
                }
            }

        }
    }

}

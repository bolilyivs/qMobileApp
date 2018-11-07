import QtQuick 2.1
import "../Controls"


Item {
    id: root
    property var inData:[
        [["I am a_man"],["Я (есть) мужчина"]],
        [["You are a_woman"],["Ты (есть) женщина"]],
        [["We are people"],["Мы (есть) люди"]],
        [["It is a_pet"],["Оно (есть) питомец"]],
        [["He is a_John"],["Он Джон"]],
        [["John is a_man and he is a_human"],["Джон - мужчина и он человек"]],
        [["Mary is a_doctor and she is a_woman"],["Мари - доктор и она - женщина"]],
        [["They are workers"],["Они - рабочие"]]
    ]

    SentenceCreator{
        anchors.fill: parent
        inData: root.inData
    }
}

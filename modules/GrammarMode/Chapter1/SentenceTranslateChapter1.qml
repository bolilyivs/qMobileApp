import QtQuick 2.1
import "../Controls"


Item {
    id: root
    property var inData:[
        [["Я есть мужчина"], ["I am a man"]],
        [["Ты есть женщина"],["You are a woman"]],
        [["Мы есть люди"], ["We are people"]],
        [["Оно есть питомец"], ["It is a pet"]],
        [["Он Джон"], ["He is a John"]],
        [["Джон мужчина и он человек"], ["John is a man and he is a human"]],
        [["Мари доктор и она женщина"], ["Mary is a doctor and she is a woman"]],
        [["Они рабочие"], ["They are workers"]]
    ]

    SentenceCreator{
        anchors.fill: parent
        inData: root.inData
        reversCreator: true
    }
}

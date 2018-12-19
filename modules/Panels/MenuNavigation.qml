import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.12
import "../Controls"

Item {
    id: root
    height: 120
    property int index: 0
    property int currentIndex: 0
    onCurrentIndexChanged: {

        home.iconColor = "#90FFFFFF"
        words.iconColor = home.iconColor
        grammar.iconColor = home.iconColor

        home.textColor = home.iconColor
        words.textColor = home.textColor
        grammar.textColor = home.textColor


        if(currentIndex == 0){
            home.iconColor = "#90000000"
            home.textColor = home.iconColor

        }
        if(currentIndex == 1){
            words.iconColor = "#90000000"
            words.textColor = words.iconColor

        }
        if(currentIndex == 2){
            grammar.iconColor = "#90000000"
            grammar.textColor = home.iconColor

        }

    }


    Image {
        id: name
        source: "qrc:/images/bottom.svg"
        anchors.fill: parent
    }
    RowLayout {
        anchors.fill: parent

        MenuNavButton {
            id: home
            iconCode: "\uf015"
            text: "Home"
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: {
                index = 0
            }
        }

        MenuNavButton {
            id: words
            iconCode: "\uf1ab"
            text: "Words"
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: {
                index = 1
            }
        }

        MenuNavButton {
            id: grammar
            iconCode: "\uf02d"
            text: "Grammar"
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: {
                index = 2
            }
        }

    }
}

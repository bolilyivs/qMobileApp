/*
 Окно приложения
 Входят следующие элементы:
 *Навигационное окно
 *Страница приложения
 *Сентизатор речи
 *Функции
 *Шрифты
*/

import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import TTSpeech 1.0
import "modules/Panels"
import "modules/Pages"


ApplicationWindow {
    visible: true
    width: 600
    height: 1000
    title: qsTr("Three Word English")
    id: win
    color: "darkred"
    property int dpi: Screen.pixelDensity * 25.4

    Image{
        id: bg
        anchors.fill: parent
        source: "qrc:/images/bg.png"
    }

    ColumnLayout{
        anchors.fill: parent

        NavigationPanel{
            Layout.fillWidth: true
        }

        StackView{
            id: stView
            Layout.fillWidth: true
            Layout.fillHeight: true
            initialItem: lg
            Flickable{
                id: flic
                clip: true
                contentHeight: cmp.childrenRect.height

                ChangeModePanel{
                    id: cmp
                    width: win.width
                }
            }

        }

    }

    Item{
        id: pages
        LoginPage{
            id: lg
            onEnterGuest:stView.push(flic)
        }
    }

/*
    TTSpeech{
            id: speech
            volume: 0.3
            voice: voicesList[0]

            Component.onCompleted: {
                setLocal(TTSpeech.English, TTSpeech.USA)
                console.log(voicesList)
            }
        }*/

    function changeMode(mode){
        var obj
        var str = ""
        if(mode === "wordtr"){
            str = "qrc:/modules/WordsMode/WordTranslation.qml"
        }
        if(mode === "chapter1"){
            str = "qrc:/modules/GrammarMode/Chapter1/SentenceCreator.qml"
            console.log(str)
        }

        stView.push(createObject(str, pages))
    }

    function dp(x){
        if(dpi < 120) {
            return x; // Для обычного монитора компьютера
        } else {
            return x*(dpi/160);
        }
    }

    function createObject(psource, pparent){
        var component = Qt.createComponent(psource);
        if(component.status === Component.Ready){
            var object = component.createObject(pparent);
            return object
        }
    }

    function createPage(psource){
        return createObject(psource, pages)
    }

    FontLoader {
        id: localFont
        source: "qrc:/fonts/Ubuntu-M.ttf"
    }
    FontLoader {
        id: aweFont
        source: "qrc:/fonts/fa-solid-900.ttf"
    }
}

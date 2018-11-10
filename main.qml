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
import AppManager 1.0
import "modules/Panels"
import "modules/Pages"


ApplicationWindow {
    id: win
    visible: true
    width: 600
    height: 1000
    title: qsTr("Three Word English")
    color: "darkred"
    property int dpi: Screen.pixelDensity * 25.4
    property var appView

    Image{
        id: bg
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        source: "qrc:/images/bg2.png"
        Rectangle{
            anchors.fill: parent
            color: "#30000000"
        }
    }

    Component.onCompleted: {
        appView = createObject("qrc:/AppView.qml", win)
    }

    onClosing: {
        close.accepted = false
        if(appView.stack.depth < 1){
            Qt.quit()
        }

    }

    function createObject(psource, pparent){
        var component = Qt.createComponent(psource);
        if(component.status === Component.Ready){
            var object = component.createObject(pparent);
            return object
        }
    }
}

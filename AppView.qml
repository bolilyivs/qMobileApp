import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import AppManager 1.0
import "modules/Panels"
import "modules/Pages"

Item {
    id: root
    anchors.fill: parent
    property string speechText: "test"

    ColumnLayout {
        anchors.fill: parent

        NavigationPanel {
            id: np
            Layout.fillWidth: true
            z: 5
        }

        StackView {
            id: stView
            Layout.fillWidth: true
            Layout.fillHeight: true
            initialItem: lg

            function popDestroy() {
                var obj = stView.pop()
                if (stView.depth > 1)
                    obj.destroy(500)
            }
        }
    }

    Item {
        id: pages
        LoginPage {
            id: lg
            onEnter: app.setPage(AppManager.MainMenu)
            onRegister: app.setPage(AppManager.Registration)
        }    
    }

    AppManager {
        id: app
        onCurrentPageUrlChanged: {
            stView.push(createObject(currentPageUrl, pages))
        }
        onSpeechTextChanged: root.speechText = speechText
    }

    FontLoader {
        id: localFont
        source: "qrc:/fonts/Ubuntu-M.ttf"
    }
    FontLoader {
        id: aweFont
        source: "qrc:/fonts/fa-solid-900.ttf"
    }

    focus: true
//    Keys.onReleased: {
//        if (stView.depth > 1) {

//            stView.popDestroy()
//        }
//    }

    function dp(x) {
        if (dpi < 120) {
            return x // Для обычного монитора компьютера
        } else {
            return x * (dpi / 160)
        }
    }

    function createObject(psource, pparent) {
        var component = Qt.createComponent(psource)
        if (component.status === Component.Ready) {
            var object = component.createObject(pparent)
            return object
        }
    }

    function createPage(psource) {
        return createObject(psource, pages)
    }
}


import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import AppManager 1.0
import "../../Controls"
import "../../Panels"
Item {

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 10
        spacing: dp(15)

        CLabel{
            Layout.fillWidth: true
            Layout.preferredHeight: implicitHeight
            font.pixelSize: 30
            text: "Chapter 1"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

        }

        MenuTile{
            text: "Правила"
            Layout.fillWidth: true
            height: dp(200)
            onClicked: app.setPage(AppManager.Chapter1Rules)
        }

        GridLayout{
            Layout.fillWidth: true
            Layout.preferredHeight: childrenRectChanged.height

            columnSpacing: dp(15)
            rowSpacing: dp(15)
            columns: 2

            MenuTile{
                text: "Конструктор предложений"
                Layout.fillWidth: true
                height: dp(150)
                onClicked: app.setPage(AppManager.Chapter1SentenceCreator)
            }

            MenuTile{
                text: "Перевод предложений"
                Layout.fillWidth: true
                height: dp(150)
                onClicked: app.setPage(AppManager.Chapter1SentenceTranslate)
            }
        }
        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }

}

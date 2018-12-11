import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.12
import "../Controls"

Item {
    id: root
    height: 120
    Image {
        id: name
        source: "qrc:/images/bottom.svg"
        anchors.fill: parent
    }
    RowLayout {
        anchors.fill: parent

        MenuNavButton {
            iconCode: "\uf015"
            text: "Home"
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        MenuNavButton {
            iconCode: "\uf02d"
            text: "Grammar"
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        MenuNavButton {
            iconCode: "\uf1ab"
            text: "Words"
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}

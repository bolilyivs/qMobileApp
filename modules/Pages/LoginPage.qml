

/*
Страница ввода

*/
import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0
import "../Controls"
import "../Panels"

Rectangle {
    color: "#00000000"

    signal enter
    signal register

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 5

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 180
            color: "#00000000"
            CLabel {
                anchors.fill: parent
                text: "Three Word\nEnglish"
                font.pixelSize: dp(70)
                font.weight: Font.Bold
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }

        Rectangle {
            Layout.preferredHeight: 300
            Layout.fillWidth: true
            radius: 6
            color: "#CCFFFFFF"
            GridLayout {
                anchors.fill: parent
                anchors.margins: 20
                columns: 2
                columnSpacing: 5
                Rectangle {
                    color: "#00000000"
                    width: 100
                    Layout.fillHeight: true
                    UiLabel {
                        anchors.fill: parent
                        text: "\uf508"
                        color: "#BB000000"
                        font.pixelSize: dp(30)
                        horizontalAlignment: Text.AlignHCenter
                    }
                }

                TextField {
                    id: login
                    Layout.fillWidth: true
                    font.pixelSize: dp(30)
                    color: "#BB000000"
                    text: "guest"
                }

                Rectangle {
                    color: "#00000000"
                    width: 100
                    Layout.fillHeight: true
                    UiLabel {
                        anchors.fill: parent
                        text: "\uf084"
                        font.pixelSize: dp(30)
                        color: "#BB000000"
                        horizontalAlignment: Text.AlignHCenter
                    }
                }

                TextField {
                    id: passwd
                    Layout.fillWidth: true
                    font.pixelSize: dp(30)
                    color: "#BB000000"
                    echoMode: TextInput.Password
                    text: "guest"
                }
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        Rectangle {
            height: 100
            Layout.fillWidth: true
            color: "#00000000"
            Image {
                id: name
                source: "qrc:/images/bottom.svg"
                anchors.fill: parent
            }

            RowLayout {
                anchors.fill: parent
                anchors.topMargin: 30
                Button {
                    text: "\uf234 Регистрация"
                    font.family: aweFont.name
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    font.pixelSize: dp(20)
                    onClicked: register()
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 40
                        opacity: enabled ? 1 : 0.3
                        color: "transparent"
                        border.color: parent.down ? "#BB000000" : "#BBFFFFFF"
                        border.width: 2
                        radius: 20
                    }

                    contentItem: Text {
                        text: parent.text
                        font: parent.font
                        opacity: enabled ? 1.0 : 0.3
                        color: parent.down ? "#BB000000" : "#BBFFFFFF"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                }
                Button {
                    text: "\uf2f6 Войти"
                    font.family: aweFont.name
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    font.pixelSize: dp(20)
                    onClicked: enter()
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 40
                        opacity: enabled ? 1 : 0.3
                        color: "transparent"
                        border.color: parent.down ? "#BB000000" : "#BBFFFFFF"
                        border.width: 2
                        radius: 20
                    }
                    contentItem: Text {
                        text: parent.text
                        font: parent.font
                        opacity: enabled ? 1.0 : 0.3
                        color: parent.down ? "#BB000000" : "#BBFFFFFF"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                }
            }
        }
    }
}

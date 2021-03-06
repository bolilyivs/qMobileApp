

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
    property var postData

    signal enter
    signal register

    ColumnLayout {
        anchors.fill: parent

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
                UiLabel {
                    width: 50
                    text: "\uf508"
                    color: "#BB000000"
                    font.pixelSize: dp(30)
                    horizontalAlignment: Text.AlignHCenter
                }

                CTextField {
                    id: login
                    Layout.fillWidth: true
                    font.pixelSize: dp(30)
                    color: "#BB000000"
                    placeholderText: "Login"
                }

                UiLabel {
                    width: 50
                    text: "\uf084"
                    font.pixelSize: dp(30)
                    color: "#BB000000"
                    horizontalAlignment: Text.AlignHCenter
                }

                CTextField {
                    id: passwd
                    Layout.fillWidth: true
                    font.pixelSize: dp(30)
                    color: "#BB000000"
                    echoMode: TextInput.Password
                    placeholderText: "Password"

                }

                Item{
                    width: 50
                    height: 30
                }

                CButton{
                    Layout.fillWidth: true
                    text: "Регистрация"
                    onClicked: register()
                }
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        Rectangle {
            height: 150
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
                    text: "\uf2f6 Войти"
                    font.family: aweFont.name
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    font.pixelSize: dp(30)
                    onClicked:{
                        postData = {"login" : login.text, "password":passwd.text}
                        enter()
                    }
                    background: Rectangle {
                        color: "transparent"
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

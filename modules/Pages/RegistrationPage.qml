

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

        Rectangle {
            Layout.preferredHeight: 400
            Layout.fillWidth: true
            radius: 6
            color: "#CCFFFFFF"
            GridLayout {
                id: gl
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
                    text: "\uf0e0"
                    font.pixelSize: dp(30)
                    color: "#BB000000"
                    horizontalAlignment: Text.AlignHCenter
                }

                CTextField {
                    id: email
                    Layout.fillWidth: true
                    font.pixelSize: dp(30)
                    color: "#BB000000"
                    placeholderText: "Email"
                    validator: RegExpValidator{
                         regExp: /^[-._a-z0-9]+@(?:[a-z0-9][-a-z0-9]+\.)+[a-z]{2,6}$/
                    }
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

                UiLabel {
                    width: 50
                    text: "\uf084"
                    font.pixelSize: dp(30)
                    color: "#BB000000"
                    horizontalAlignment: Text.AlignHCenter
                }

                CTextField {
                    id: passwd2
                    Layout.fillWidth: true
                    font.pixelSize: dp(30)
                    color: "#BB000000"
                    echoMode: TextInput.Password
                    placeholderText: "Password again"
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
                    text: "\uf2f6 Зарегистрироваться"
                    font.family: aweFont.name
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    font.pixelSize: dp(30)
                    onClicked: enter()
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

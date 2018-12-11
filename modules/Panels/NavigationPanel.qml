

/*
Панель навигации

*/
import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0
import "../Controls"

Image {
    id: root
    height: dp(80)
    source: "qrc:/images/top.svg"
    sourceSize.height: height

    RowLayout {
        anchors.fill: parent
        anchors.bottomMargin: 20
        MTButton {
            text: {
                if (stView > 1)
                    visible = true
                if (stView.depth > 2)
                    return "\uf060"
                else if (stView.depth > 1)
                    return "\uf2f5"
                else {
                    return ""
                }
            }
            onClicked: stView.popDestroy()
        }

        Rectangle {
            color: "transparent"
            Layout.fillHeight: true
            Layout.fillWidth: true
            UiLabel {
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: "\uf007 " + app.userName + " | \uf161 " + app.userLevel
                      + " | \uf217 " + app.userExp
                font.pixelSize: 18
                color: "#BBFFFFFF"
            }
        }

        MTButton {
            id: menuButton
            text: "\uf085"
            onClicked: menu.open()
        }
    }

    Drawer {
        id: menu
        width: 0.5 * win.width
        height: win.height
        edge: Qt.RightEdge

        Image {
            id: bgSlide
            anchors.fill: parent
            source: "qrc:/images/bg3.png"
            fillMode: Image.PreserveAspectCrop
            opacity: 0.5
        }
        Flickable {
            anchors.fill: parent
            contentHeight: dcl.childrenRect.height
            ColumnLayout {
                id: dcl
                spacing: 1
                width: menu.width
                SlideMenuButton {
                    text: "achievement"
                    font.pixelSize: 25
                    Layout.fillWidth: true
                    implicitHeight: dp(100)
                }

                Image {
                    id: img1
                    z: 5
                    fillMode: Image.Stretch
                    mipmap: true
                    sourceSize.width: width
                    sourceSize.height: height
                    Layout.fillWidth: true
                    Layout.margins: 10
                    height: 200
                    source: "qrc:/images/bg.png"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            bg.source = parent.source
                        }
                    }
                }

                Image {
                    id: img2
                    z: 5
                    fillMode: Image.Stretch
                    mipmap: true
                    sourceSize.width: width
                    sourceSize.height: height
                    Layout.fillWidth: true
                    Layout.margins: 10
                    height: 200
                    source: "qrc:/images/bg2.png"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            bg.source = parent.source
                        }
                    }
                }

                Image {
                    id: img3
                    z: 5
                    fillMode: Image.Stretch
                    mipmap: true
                    sourceSize.width: width
                    sourceSize.height: height
                    Layout.fillWidth: true
                    Layout.margins: 10
                    height: 200
                    source: "qrc:/images/bg3.png"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            bg.source = parent.source
                        }
                    }
                }

                SlideMenuButton {
                    text: "exit"
                    font.pixelSize: 25
                    Layout.fillWidth: true
                    implicitHeight: dp(100)
                    onClicked: Qt.quit()
                }
            }
        }
    }
}

/*
Панель навигации

*/

import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0
import "../Controls"


Rectangle{
    id: root
    height: dp(70)
    gradient: Gradient {
        GradientStop {
            position: 0.00;
            color: "#FF000000";
        }
        GradientStop {
            position: 1.00;
            color: "#00000000";
        }
    }

    RowLayout{
        anchors.fill: parent

        MTButton{
            text: {
                if(stView>1)
                    visible = true
                if(stView.depth>2)
                    return "\uf060"
                else if(stView.depth>1)
                    return "\uf2f5"
                else{
                    return ""
                }
            }
            onClicked: {
                var obj = stView.pop()
                if(stView.depth>1)
                    obj.destroy(500)
            }
        }

        Rectangle{
            color: "transparent"
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        MTButton{
            id: menuButton
            text: "\uf085"
            onClicked: menu.open()
        }
    }

    Drawer{
        id: menu
        width: 0.5 * win.width
        height: win.height
        edge: Qt.RightEdge


        Image{
            id: bgSlide
            anchors.fill: parent
            source: "qrc:/images/bg3.png"
            fillMode: Image.PreserveAspectCrop
            opacity: 0.5
        }
        Flickable{
            anchors.fill: parent
            contentHeight: dcl.childrenRect.height
            ColumnLayout{
                id: dcl
                spacing: 1
                width: menu.width
                SlideMenuButton{
                    text: "achivment"
                    font.pixelSize: 25
                    Layout.fillWidth: true
                    implicitHeight: dp(100)
                }

                Image{
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
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            bg.source = parent.source
                        }
                    }
                }

                Image{
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
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            bg.source = parent.source
                        }
                    }
                }

                Image{
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
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            bg.source = parent.source
                        }
                    }
                }

                SlideMenuButton{
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

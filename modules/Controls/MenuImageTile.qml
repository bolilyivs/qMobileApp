/*
Плитка меню с изображением

*/

import QtQuick 2.11
import QtQuick.Controls 2.4

MenuTile{
    property alias imgSource: img.source

    color: "#90000000"

    Image{
        id: img
        z: 5
        fillMode: Image.Stretch
        mipmap: true
        sourceSize.width: width
        sourceSize.height: height
    }

}

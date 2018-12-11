import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import AppManager 1.0
import "../../Controls"

Rectangle {
    property string text: ""
    color: "transparent"

    onTextChanged: {
        reload()
    }

    function reload() {
        topParts.clear()
        bottomParts.clear()
        var parts = []
        for (var i in text) {
            parts.push(text[i])
        }

        parts = app.shuffle(parts)

        for (var i in parts) {
            var obj = compPart.createObject(bottomParts, {
                                                "text": parts[i]
                                            })
            bottomParts.addPart(obj)
        }
    }

    function getCreatedWord() {
        var str = ""
        for (var i in topParts.parts) {
            str += topParts.parts[i].text
        }
        return str
    }

    ColumnLayout {
        anchors.fill: parent

        ConstructorParts {
            id: topParts
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        ConstructorParts {
            id: bottomParts
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }

    Component {
        id: compPart
        ConstructorPart {
            onClicked: {
                console.log(part.isMove)
                if (part.isMove)
                    topParts.addPart(part)
                else
                    bottomParts.addPart(part)
            }
        }
    }
}

import QtQuick 2.1
import "../Controls"


Item {
    id: root

    QtObject{
        Component.onCompleted: {
            app.receiveSentenceCards()
        }
    }

    SentenceCreator{
        anchors.fill: parent
        inData: app.currentData
    }
}

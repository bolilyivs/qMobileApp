import QtQuick 2.11
import "../Controls"


Item {
    id: root

    QtObject{
        Component.onCompleted: {
            app.receiveSentenceCards2()
        }
    }

    SentenceCreator{
        anchors.fill: parent
        inData: app.currentData
        reversCreator: true
    }
}

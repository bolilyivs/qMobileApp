import QtQuick 2.12
import QtQuick.Particles 2.0
import QtGraphicalEffects 1.12

Rectangle {
    anchors.fill: parent

    //    layer.enabled: true
    //    layer.effect: FastBlur {
    //        radius: 40
    //    }
    LinearGradient {
        anchors.fill: parent
        start: Qt.point(0, 0)
        end: Qt.point(0, 300)
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: "#ff1d3f77"
            }
            GradientStop {
                position: 1.0
                color: "#be1d36ae"
            }
        }
    }

    //    Emitter {
    //        id: emitter
    //        anchors.left: parent.right
    //        anchors.top: parent.top
    //        system: particleSystem
    //        emitRate: 10
    //        lifeSpan: 8400
    //        lifeSpanVariation: 500
    //        size: 128
    //        velocity: AngleDirection {
    //            angle: 180 - 45
    //            angleVariation: 30
    //            magnitude: 100
    //            magnitudeVariation: 50
    //        }
    //    }

    //    ParticleSystem {
    //        id: particleSystem
    //    }

    //    Item {
    //        anchors.fill: parent
    //        ImageParticle {
    //            source: "qrc:/images/star.svg"
    //            system: particleSystem
    //            smooth: true
    //            colorVariation: 0.3
    //        }
    //    }
    Rectangle {
        color: "#80000000"
        anchors.fill: parent
    }

    //    Image {
    //        id: name
    //        source: "qrc:/images/bottom.svg"
    //        height: 150
    //        width: parent.width
    //        anchors.bottom: parent.bottom
    //    }
}

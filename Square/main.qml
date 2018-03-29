import QtQuick 2.8
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0

Window {
    id: applicationWindow

    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: background
        anchors.fill: parent
        color: Qt.rgba(1, 0, 1, 1)
    }
}

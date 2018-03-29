import QtQuick 2.0

import animation_poc 1.0

ViewController
{
    id: genericBlueViewRoot

    title: "Blue View"

    Rectangle
    {
        id: background

        anchors.fill: parent

        color: Qt.rgba(0, 1, 1, 1)
    }

    Text
    {
        id: title

        anchors.centerIn: genericBlueViewRoot

        text: genericBlueViewRoot.title
    }
}

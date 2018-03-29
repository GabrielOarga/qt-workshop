import QtQuick 2.8
import QtQuick.Window 2.2

import "Views"

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    // Add scrollable views that contain animations
    MainView
    {
        id: mainView

        anchors.fill: parent
    }

}

import QtQuick 2.0
import animation_poc 1.0

ViewController
{
    id: mainViewRoot

    title: "Main View"

    Rectangle
    {
        id: background

        anchors.fill: parent

        color: Qt.rgba(1, 0, 0, 1)
    }

    Text
    {
        id: title

        anchors.centerIn: mainViewRoot

        text: mainViewRoot.title
    }

    Loader
    {
        id: viewControllerLoader

        anchors.fill: parent

        active: false
        sourceComponent: Component {

            GenericBlueView {
            }
        }
    }

    MouseArea
    {
        anchors.fill: parent
        onClicked: {
            console.log( "---> Main View Activated <---" )
            viewControllerLoader.active = !viewControllerLoader.active
        }
    }
}

import QtQuick 2.11
import QtQuick.Controls 2.2
import QtBluetooth 5.9

ApplicationWindow {
    visible: true

    height: 640
    width: 480

    Item {
        anchors.fill: parent

        BluetoothDiscoveryModel {
            id: bluetoothModel

            // Initial state for the BT Discovery mode. Not running in this case
            running: false

            // Dicovery mode that only looks for devices, and not the whole range of BT services
            discoveryMode: BluetoothDiscoveryModel.DeviceDiscovery

            // This property holds an optional UUID filter
            //uuidFilter: ""

            onDiscoveryModeChanged: console.log("Discovery mode: " + discoveryMode)
            onServiceDiscovered: console.log("Found new service "
                                             + service.deviceAddress + " "
                                             + service.deviceName + " "
                                             + service.serviceName);
            onDeviceDiscovered: console.log("New device: " + device)
            onErrorChanged: {
                switch (btModel.error) {
                case BluetoothDiscoveryModel.PoweredOffError:
                    console.log("Error: Bluetooth device not turned on"); break;
                case BluetoothDiscoveryModel.InputOutputError:
                    console.log("Error: Bluetooth I/O Error"); break;
                case BluetoothDiscoveryModel.InvalidBluetoothAdapterError:
                    console.log("Error: Invalid Bluetooth Adapter Error"); break;
                case BluetoothDiscoveryModel.NoError:
                    break;
                default:
                    console.log("Error: Unknown Error"); break;
                }
            }
            onRunningChanged: {
                console.log("State changed: " + (running ? "running" : "not running"))
            }
        }

        ListView {
            id: bluetoothDeviceList

            width: parent.width
            anchors {
                top: parent.top
                bottom: buttonRow.top
            }

            model: bluetoothModel
            delegate: bluetoothDeviceComponent
        }

        Component {
            id: bluetoothDeviceComponent

            Rectangle {
                id: deviceComponentRoot

                width: parent.width
                height: btDeviceName.contentHeight + 20

                color: "cyan"

                Text {
                    id: btDeviceName

                    width: deviceComponentRoot.width
                    anchors {
                        centerIn: deviceComponentRoot
                    }

                    text: deviceName ? deviceName : name
                }
            }
        }

        Row {
            id: buttonRow

            width: parent.width
            height: 50

            anchors.bottom: parent.bottom

            Rectangle {
                height: parent.height
                width: parent.width / 2

                color: "#84b3ff"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        bluetoothModel.running = true
                    }
                }
            }

            Rectangle {
                height: parent.height
                width: parent.width / 2

                color: "#ff9b9b"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        bluetoothModel.running = false
                    }
                }
            }
        }
    }
}

import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 240
    height: 680
    title: qsTr("TV Remote Control")

    property int currentChannel: 1
    property int volume: 50

    Column {
        anchors.centerIn: parent
        spacing: 10

        // Display for current channel and volume
        Rectangle {
            width: 200
            height: 50
            color: "lightgray"
            radius: 10
            border.color: "black"
            Text {
                anchors.centerIn: parent
                text: "Channel: " + parent.parent.currentChannel + "\nVolume: " + parent.parent.volume + "%"
                font.pointSize: 12
            }
        }

        // Number buttons 0-9
        Grid {
            columns: 3
            spacing: 5
            Repeater {
                model: 10
                Button {
                    text: index
                    onClicked: parent.parent.currentChannel = index
                    width: 60
                    height: 60
                }
            }
        }

        // Channel control buttons
        Row {
            spacing: 10
            Button {
                text: "Prev"
                onClicked: {
                    parent.parent.currentChannel--
                    if (parent.parent.currentChannel < 0) {
                        parent.parent.currentChannel = 9
                    }
                }
                width: 90
                height: 60
            }
            Button {
                text: "Next"
                onClicked: {
                    parent.parent.currentChannel++
                    if (parent.parent.currentChannel > 9) {
                        parent.parent.currentChannel = 0
                    }
                }
                width: 90
                height: 60
            }
        }

        // Volume control buttons
        Row {
            spacing: 10
            Button {
                text: "Vol-"
                onClicked: {
                    parent.parent.volume -= 10
                    if (parent.parent.volume < 0) {
                        parent.parent.volume = 0
                    }
                }
                width: 90
                height: 60
            }
            Button {
                text: "Vol+"
                onClicked: {
                    parent.parent.volume += 10
                    if (parent.parent.volume > 100) {
                        parent.parent.volume = 100
                    }
                }
                width: 90
                height: 60
            }
        }
    }
}

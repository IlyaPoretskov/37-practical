import QtQuick 2.12
import QtQuick.Controls 2.12
import QtMultimedia 5.12

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Video Player")

    Video {
        id: videoPlayer
        anchors.fill: parent
        source: "file:///C:/Users//Илья/Videos/video_2024-05-29_21-34-04.mp4";
        autoPlay: false

        // Воспроизведение по клику на экран
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (videoPlayer.status == MediaPlayer.Playing) {
                    videoPlayer.pause()
                } else {
                    videoPlayer.play()
                }
            }
        }
    }

    Column {
        anchors.bottom: parent.bottom
        width: parent.width
        spacing: 10
        padding: 10

        Row {
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter

            Button {
                text: "▶️"
                onClicked: videoPlayer.play()
            }
            Button {
                text: "⏸"
                onClicked: videoPlayer.pause()
            }
            Button {
                text: "⏹"
                onClicked: videoPlayer.stop()
            }
            Button {
                text: "⏪"
                onClicked: videoPlayer.seek(videoPlayer.position - 5000)
            }
            Button {
                text: "⏩"
                onClicked: videoPlayer.seek(videoPlayer.position + 5000)
            }
        }

        Slider {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 40
            value: videoPlayer.position
            from: 0
            to: videoPlayer.duration
            onMoved: videoPlayer.seek(value)
        }
    }
}

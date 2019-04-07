import QtQuick 2.11
import QtQuick.Window 2.11

Window {
    id: root_window
    visible: true
    width: 640
    height: 480
    title: qsTr("Learn Vocabulary")
    color: "#f5f2ee"

    Rectangle {
        id: word_area
        width: root_window.width
        height: 40
        anchors.left: root_window.left
        anchors.top: root_window.top
        color: "#a2c1fc"

        Text {
            id: word
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            text: qsTr("Hello")
        }
    }

    Rectangle {
        id: word_description_area
        width: root_window.width
        height: root_window.height - word_area.height
        anchors.top: word_area.bottom
        anchors.left: root_window.left

        Image {
            id: image
            width: parent.width - 20
            height: parent.height - 20
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            source: "qrc:/resources/images/background3.jpg"
        }
    }
}

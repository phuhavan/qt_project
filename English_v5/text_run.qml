import QtQuick 2.0

Rectangle {
    property alias txt_id: text_run
    id: text_run

    property string word_run: "Ha Van Phu. Dai Hoc Bach Khoa ha noi"
    property int x_val: 0
//    property int y_val: 0
    property int he: 500
    property int check_gen: 0


    width: txt_run.width + 40
    height: he

    color: "white"
    x: x_val
//    y: y_val


    Rectangle {

        width: txt_run.width + 20
        height: txt_run.height + 20
        radius: 5
        border.color: "#D8D8D8"
        color: "white"
        anchors.centerIn: parent

        Rectangle {

            property real offset: 1.5
            color: "#E6E6E6"
            width: parent.width + offset
            height: parent.height + offset
            z: -1
            opacity: 0.75
            radius: parent.radius
            anchors.left: parent.left
            anchors.leftMargin: offset
            anchors.top: parent.top
            anchors.topMargin: offset
        }

        Text {
            id:txt_run
            width: 350
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            text: word_run
            wrapMode: Text.WordWrap

        }
    }
}


import QtQuick 2.0
import QtQuick.Window 2.0

Rectangle {
    property alias rect: rt
    id: rt
    property string buttonId;
    z: 0;
    property int x_old
    property int y_old
    property int key
    property string term_text
    width: term.width + 20 ; height: term.height+ 20
    radius: 5
    border.color: "black"
    Text {
        id: term
        width: 160
//        anchors.left: parent.left
//        anchors.leftMargin: (parent.width - term.width)/2

        font.pixelSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: term_text
        wrapMode: Text.Wrap
    }
    signal positionChanged(string buttonId);
    signal released(string buttonId);
    signal exited(string buttonId);


    MouseArea {
        id: dragArea_term
        z: 1
        anchors.fill: parent
        drag.target: parent
        hoverEnabled: true
        onPositionChanged: {
            parent.positionChanged(parent.buttonId)
            term.color = "cyan"
            parent.opacity = 0.7;
            parent.z = 1;
        }
        onReleased: {
            parent.released(parent.buttonId)
            term.color = "black"
            parent.opacity = 1;
            parent.z = 0;
        }
        onExited: {
            parent.exited(parent.buttonId)
            term.color = "black"
            parent.opacity = 1;
            parent.z = 0;
        }
    }
}

import QtQuick 2.0

Rectangle {
    property alias sp_copy_id: sp_copy

    id: sp_copy
    width: wi //parent.width/4
    height: width*2/3
    anchors.centerIn: parent
    radius: 5
    border.color: "black"
    color: "#eeeeee"
    visible: true

    property int wi: 350
    property string term: "term"
    property string definition: "definition"
    property int click: 0


    Text {
        id:sp_definition
        text: "Definition: "+definition
        width: parent.width - 20
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        font.pointSize: parent.width/22
        wrapMode: Text.WordWrap
    }

    Text {
        id:sp_term
        text: "Correct answers: "+term
        width: parent.width -20
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: sp_definition.bottom
        anchors.topMargin: 10
        font.pointSize: parent.width/22
        wrapMode: Text.WordWrap
    }

    Rectangle {
        id: sp_button_back
        width: 100
        height: 50
        anchors.left: parent.left
        anchors.leftMargin: (parent.width - width)/2
        radius: 5
        anchors.top: sp_term.bottom
        anchors.topMargin: 10

        property color begin_color: "#337cdc"
        property color stop_color: "#2371d9"

        gradient: Gradient {
            GradientStop { position: 0.0; color: sp_button_back.begin_color }
            GradientStop { position: 1.0; color: sp_button_back.stop_color }
        }

        Text {
            text: "OK"
            color: "white"
            font.bold: true
            font.pixelSize: Math.round(sp_button_back.height/3)
            anchors.centerIn: sp_button_back
        }

        MouseArea{
            anchors.fill: sp_button_back
            hoverEnabled: true

            onPressed: {
                sp_button_back.begin_color = "#3584eb"
                sp_button_back.stop_color = "#267bea"
            }

            onReleased: {
                sp_button_back.begin_color = "#337cdc"
                sp_button_back.stop_color = "#2371d9"
            }

            onClicked: {
                sp_copy_id.visible = false
                click = 99
            }
        }

    }

    //            Text {
    //                id:copy_definition
    //                text: "copy answer:"
    //                width: parent.width -20
    //                anchors.left: parent.left
    //                anchors.leftMargin: 10
    //                anchors.top: correct_definition.bottom
    //                anchors.topMargin: 10
    //                font.pointSize: parent.width/22
    //                wrapMode: Text.WordWrap
    //            }

    //            TextField {
    //                id: type_copy
    //                width: parent.width -20
    //                anchors.left: parent.left
    //                anchors.leftMargin: 10
    //                anchors.top: copy_definition.bottom
    //                anchors.topMargin: 10
    //                font.pointSize: parent.width/22
    //            }


}


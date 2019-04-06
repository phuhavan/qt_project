import QtQuick 2.0


Rectangle {


    property string buttonId;

    property color begin_color: "#fa632e"
    property color stop_color: "#e23516"

    property string unit: "Unit 1"
    property int left_margin: 10
    property int top_margin: 10
    property alias rec_id: rec_lesson
    property alias m_id: mouseArea
    property int oob: 0 // order of button

    id: rec_lesson
    height: 80
    width: 80
    radius: 12

    signal clicked(string buttonId);

    anchors.leftMargin: left_margin
    anchors.topMargin: top_margin

    gradient: Gradient {
        GradientStop { position: 0.0; color: rec_lesson.begin_color }
        GradientStop { position: 1.0; color: rec_lesson.stop_color }
    }

    Text {
        id: lesson_text
        text: unit
        color: "white"
        font.bold: true
        font.pixelSize: Math.round(rec_lesson.height/4)
        anchors.centerIn: rec_lesson
    }

    MouseArea{
        id: mouseArea
        anchors.fill: rec_lesson
        hoverEnabled: true

        onClicked:parent.clicked(parent.buttonId)

        onPressed:  {
            rec_lesson.begin_color = "#f3d537"
            rec_lesson.stop_color = "#edac1b"
        }

        onReleased:  {
            rec_lesson.begin_color = "#fa632e"
            rec_lesson.stop_color = "#e23516"
        }
    }

}


import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.4

Window {
    id: root_window
    visible: true
    width: 640
    height: 480
    title: qsTr("Learn Vocabulary")
    color: "#f5f2ee"

    property string src_path: "qrc:/resources/images"
    property string newWord: "hello"
    property int nbOfAnimations: 3
    property int currentIdx: 1
    property int time_set: 1
    property int time_left: time_set

    function slideImage(string)
    {
        if (currentIdx == nbOfAnimations) {
            currentIdx = 1;
        }
        else {
            currentIdx = currentIdx + 1;
        }

        var path = src_path+"/"+newWord;
        path = path + "/" + String(currentIdx);
        return path
    }

    Rectangle {
        id: word_area
        width: root_window.width
        height: 40
        anchors.left: root_window.left
        anchors.top: root_window.top
        color: "#fcd3c3"

        Text {
            id: word
            color: "#1700e0"
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            text: newWord
            font.capitalization: Font.Capitalize
            style: Text.Normal
            font.weight: Font.Normal
            font.pointSize: 12
            font.bold: true
        }

        Rectangle {
            id: button_start
            width: 50
            height: parent.height - 20
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            radius: 5
            property color begin_color: "#337cdc"
            property color stop_color: "#2371d9"

            gradient: Gradient {
                GradientStop { position: 0.0; color: button_start.begin_color }
                GradientStop { position: 1.0; color: button_start.stop_color }
            }

            MouseArea{
                id: startMouseArea
                anchors.fill: button_start
                hoverEnabled: true

                onPressed: {
                    button_start.begin_color = "#3584eb"
                    button_start.stop_color = "#267bea"
                }

                onReleased: {
                    button_start.begin_color = "#337cdc"
                    button_start.stop_color = "#2371d9"
                }

                onClicked: {
//                    image.source = slideImage()
                    if (timer.running == true) timer.running = false
                    else timer.running = true
                }
            }
        }

        Rectangle {
            id: rec_timeleft
            width: 150
            height: button_start.height
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.right: button_start.left
            anchors.rightMargin: 10

            Item {
                id: countdown
                property int min: time_set
                property int sec: 0
                property string current_time
                property string string_min
                property string string_sec
                property int count: 0

                function timeChanged()  {
                    if(sec!=0) sec = sec - 1;
                    else {
                        if(min!=0) sec = 59;
                    }
                    if(sec == 59) min = min - 1;

                    if(min<10) {
                        string_min = "0"+min
                    }
                    else {
                        string_min = ""+min
                    }

                    if(sec<10) {
                        string_sec = "0"+sec
                    }
                    else {
                        string_sec = ""+sec
                    }
                    if (sec == 0 && min == 0) current_time = "Time Out!"
                    else {
                        current_time = string_min + ":"+string_sec
                        // counter
                        if (count==3) {
                            count=0;
                            image.source = slideImage();
                        }
                        else count=count+1;
                        progress_bar.value = count/3;
                    }
                }

                Timer  {
                    id: timer
                    interval: 1000;
                    running: false;
                    repeat: true;
                    onTriggered: {
                        countdown.timeChanged()
                    }
                }
            }

            Text {
                id: text_timeleft
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 0
                text: "Time left: " + countdown.current_time
            }
        }

        ProgressBar {
            id: progress_bar
            height: 20
            transformOrigin: Item.Center
            opacity: 1
            anchors.right: rec_timeleft.left
            anchors.rightMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            indeterminate: false
            activeFocusOnTab: false
            from: 0
            to: 1
            value: 0
        }

    }

    Rectangle {
        id: word_description_area
        width: root_window.width
        height: root_window.height - word_area.height
        anchors.top: word_area.bottom
        anchors.left: root_window.left

        AnimatedImage {
            id: image
            width: parent.width - 20
            height: parent.height - 20
            anchors.centerIn: parent
            source: "qrc:/resources/images/"+newWord+"/1"
        }
    }
}

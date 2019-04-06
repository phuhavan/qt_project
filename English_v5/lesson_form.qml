import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtQuick 2.3
import QtQuick.Window 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.LocalStorage 2.0
import QtQuick.Dialogs 1.2
import QtMultimedia 5.5
import QtQml 2.2

Rectangle {
    id: sub_form
    height: Screen.height
    width: Screen.width
    color: "#f4f0ea"
    visible: true

    property int list_height: 10
    property int test_height: 10
    property var test: []

    property string speller_path: "./data/AmericanPackage/"
    property int count: 1   // count order of term and definition list
    property int count_noq: noq
    property int learn_count: 0
    property int speller_count: 0
    property int failed: 0
    property int n_correct: 0
    property int n_incorrect: 0
    property int correct_ans: 0

    property var cdx
    property var cdy
    property var rect1: []
    property int time_set: 2   // 60min
    property int time_left: time_set

    property int sec_count_scatter: 0

    // Variable for Space race

    property int speed_initial: 1
    property var word_1
    property var word_2
    property var word_3
    property var box
    property int level: 1
    property int lives: 3
    property int score: 0
    property int correct: 0
    property int sp_instruct_click: 0
    property var component
    property var component1
    property var component2
    property var component3
    property int sp_click: 0
    property int check_word_1: 0
    property int check_word_2: 0
    property int check_word_3: 0
    property int check_message: 0
    property int check_only: 0
    property int answer_right: 0
    property int right_10: 0

    property var sp_term: []

    property var sp_definition: []

    property int key: 0
    property int choose_term_definition: 0


    function initial()
    {

        for(var i=0;i<3;i++)
        {
            sp_term[i]=term_heli_list[choose_term_definition+i]
            sp_definition[i]=definition_heli_list[choose_term_definition+i]
        }
        choose_term_definition = choose_term_definition + 3
    }


    function reset()
    {
        count = 0;
        count_noq = noq;
        learn_count = 0;
        speller_count = 0;
        failed = 0;
        n_correct = 0;
        n_incorrect = 0;
        correct_ans = 0;
        sec_count_scatter = 0;
        speed_initial= 1;
        level= 1;
        lives= 3;
        score= 0;
        correct= 0;
        sp_instruct_click= 0;
        sp_click= 0;
        check_word_1= 0;
        check_word_2= 0;
        check_word_3= 0;
        check_message= 0;
        check_only= 0;
        answer_right= 0;
        key= 0;
        right_10 = 0;
        choose_term_definition = 0;
    }



    Rectangle {
        id: lesson_form
        height: sub_form.height
        width: sub_form.width
        color: "#f4f0ea"
        visible: true

        //    property int num_ques: 0

        //    Connections {
        //        target: root_window;

        //        onSendInt: {
        //            num_ques = num;
        //            console.log(num);
        //        }

        //    }


        Rectangle {
            id: rec_menu
            //            height: lesson_form.height/7
            height: 110
            width: lesson_form.width
            color: "#132d45"
            Text {
                id: txt_lesson
                color: "#ffffff"
                text: "LESSON " + lesson_u
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                font.family: "Verdana"
                font.pointSize: 15
            }
            Text {
                id: txt_hello
                color: "#ffffff"
                text: "Hi Student"
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                font.family: "Verdana"
                font.pointSize: 15
            }

            Rectangle {

                id: rec_flash
                width: lesson_form.width/6 - 100
                height: rec_menu.height - txt_lesson.height - 30
                anchors.top: txt_lesson.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10

                radius: 10
                border.color: "white"
                border.width: 1

                property color begin_color: "#c7f59c"
                property color stop_color: "#61b213"

                gradient: Gradient {
                    GradientStop { position: 0.0; color: rec_flash.begin_color }
                    GradientStop { position: 1.0; color: rec_flash.stop_color }
                }

                Text {
                    color: "black"
                    text: "Flash Cards"
                    font.bold: true
                    font.pointSize: 15
                    anchors.centerIn: rec_flash
                }

                MouseArea{
                    id: flashmouseArea
                    anchors.fill: rec_flash
                    hoverEnabled: true

                    onPressed:  {
                        rec_flash.begin_color = "white"
                        rec_flash.stop_color = "#9be74f"
                    }

                    onReleased:  {
                        rec_flash.begin_color = "#c7f59c"
                        rec_flash.stop_color = "#61b213"
                    }

                    onClicked: {
                        lesson_form.visible = false
                        flashcard_form.visible = true
                        learn_form.visible = false
                        speller_form.visible = false
                        test_form.visible = false
                        scatter_form.visible = false
                        space_form.visible = false
                    }
                }

            }

            Rectangle {

                id: rec_learn
                width: lesson_form.width/6 - 100
                height: rec_menu.height - txt_lesson.height - 30
                anchors.top: txt_lesson.bottom
                anchors.topMargin: 10
                anchors.left: rec_flash.right
                anchors.leftMargin: 20

                radius: 10
                border.color: "white"
                border.width: 1

                property color begin_color: "#c7f59c"
                property color stop_color: "#61b213"

                gradient: Gradient {
                    GradientStop { position: 0.0; color: rec_learn.begin_color }
                    GradientStop { position: 1.0; color: rec_learn.stop_color }
                }

                Text {
                    color: "black"
                    text: "Learn"
                    font.bold: true
                    font.pointSize: 15
                    anchors.centerIn: rec_learn
                }

                MouseArea{
                    id: learnmouseArea
                    anchors.fill: rec_learn
                    hoverEnabled: true

                    onPressed:  {
                        rec_learn.begin_color = "white"
                        rec_learn.stop_color = "#9be74f"
                    }

                    onReleased:  {
                        rec_learn.begin_color = "#c7f59c"
                        rec_learn.stop_color = "#61b213"
                    }

                    onClicked: {
                        lesson_form.visible = false
                        flashcard_form.visible = false
                        learn_form.visible = true
                        speller_form.visible = false
                        test_form.visible = false
                        scatter_form.visible = false
                        space_form.visible = false
                    }
                }

            }

            Rectangle {

                id: rec_speller
                width: lesson_form.width/6 - 100
                height: rec_menu.height - txt_lesson.height - 30
                anchors.top: txt_lesson.bottom
                anchors.topMargin: 10
                anchors.left: rec_learn.right
                anchors.leftMargin: 20

                radius: 10
                border.color: "white"
                border.width: 1

                property color begin_color: "#c7f59c"
                property color stop_color: "#61b213"

                gradient: Gradient {
                    GradientStop { position: 0.0; color: rec_speller.begin_color }
                    GradientStop { position: 1.0; color: rec_speller.stop_color }
                }

                Text {
                    color: "black"
                    text: "Speller"
                    font.bold: true
                    font.pointSize: 15
                    anchors.centerIn: rec_speller
                }

                MouseArea{
                    id: spellermouseArea
                    anchors.fill: rec_speller
                    hoverEnabled: true

                    onPressed:  {
                        rec_speller.begin_color = "white"
                        rec_speller.stop_color = "#9be74f"
                    }

                    onReleased:  {
                        rec_speller.begin_color = "#c7f59c"
                        rec_speller.stop_color = "#61b213"
                    }

                    onClicked: {
                        lesson_form.visible = false
                        flashcard_form.visible = false
                        learn_form.visible = false
                        speller_form.visible = true
                        test_form.visible = false
                        scatter_form.visible = false
                        space_form.visible = false


                        speller_player.source = speller_path + term_heli_list[speller_count][0].toUpperCase() + "/" + term_heli_list[speller_count] + ".mp3"
                        if(speller_player.playbackState == 0)
                        {
                            speller_player.play();
                        }
                    }
                }

            }

            Rectangle {

                id: rec_test
                width: lesson_form.width/6 - 100
                height: rec_menu.height - txt_lesson.height - 30
                anchors.top: txt_lesson.bottom
                anchors.topMargin: 10
                anchors.left: rec_speller.right
                anchors.leftMargin: 20

                radius: 10
                border.color: "white"
                border.width: 1

                property color begin_color: "#c7f59c"
                property color stop_color: "#61b213"

                gradient: Gradient {
                    GradientStop { position: 0.0; color: rec_test.begin_color }
                    GradientStop { position: 1.0; color: rec_test.stop_color }
                }

                Text {
                    color: "black"
                    text: "Test"
                    font.bold: true
                    font.pointSize: 15
                    anchors.centerIn: rec_test
                }

                MouseArea{
                    id: testmouseArea
                    anchors.fill: rec_test
                    hoverEnabled: true

                    onPressed:  {
                        if(privacy_type==1) {
                            rec_test.stop_color = "#9be74f"
                            rec_test.begin_color = "white"
                        }
                        else {
                            rec_test.enabled = false
                        }


                    }

                    onReleased:  {
                        rec_test.begin_color = "#c7f59c"
                        rec_test.stop_color = "#61b213"
                    }

                    onClicked: {
                        lesson_form.visible = false
                        flashcard_form.visible = false
                        learn_form.visible = false
                        speller_form.visible = false
                        test_form.visible = true
                        scatter_form.visible = false
                        space_form.visible = false
                    }
                }

            }

            Rectangle {

                id: rec_scatter
                width: lesson_form.width/6 - 100
                height: rec_menu.height - txt_lesson.height - 30
                anchors.top: txt_lesson.bottom
                anchors.topMargin: 10
                anchors.left: rec_test.right
                anchors.leftMargin: 20

                radius: 10
                border.color: "white"
                border.width: 1

                property color begin_color: "#c7f59c"
                property color stop_color: "#61b213"

                gradient: Gradient {
                    GradientStop { position: 0.0; color: rec_scatter.begin_color }
                    GradientStop { position: 1.0; color: rec_scatter.stop_color }
                }

                Text {
                    color: "black"
                    text: "Scatter"
                    font.bold: true
                    font.pointSize: 15
                    anchors.centerIn: rec_scatter
                }

                MouseArea{
                    id: scattermouseArea
                    anchors.fill: rec_scatter
                    hoverEnabled: true

                    onPressed:  {
                        rec_scatter.begin_color = "white"
                        rec_scatter.stop_color = "#9be74f"
                    }

                    onReleased:  {
                        rec_scatter.begin_color = "#c7f59c"
                        rec_scatter.stop_color = "#61b213"
                    }

                    onClicked: {
                        lesson_form.visible = false
                        flashcard_form.visible = false
                        learn_form.visible = false
                        speller_form.visible = false
                        test_form.visible = false
                        scatter_form.visible = true
                        space_form.visible = false


                        rt_item_scatter_play.sec = 0;
                        rt_item_scatter_play.min = 0;
                        rt_item_scatter_play.hour = 0;
                        rt_item_scatter_play.current_time = "00:00:00";


                    }
                }

            }

            Rectangle {

                id: rec_race
                width: lesson_form.width/6 - 100
                height: rec_menu.height - txt_lesson.height - 30
                anchors.top: txt_lesson.bottom
                anchors.topMargin: 10
                anchors.left: rec_scatter.right
                anchors.leftMargin: 20

                radius: 10
                border.color: "white"
                border.width: 1


                property color begin_color: "#c7f59c"
                property color stop_color: "#61b213"

                gradient: Gradient {
                    GradientStop { position: 0.0; color: rec_race.begin_color }
                    GradientStop { position: 1.0; color: rec_race.stop_color }
                }

                Text {
                    color: "black"
                    text: "Space Race"
                    font.bold: true
                    font.pointSize: 15
                    anchors.centerIn: rec_race
                }

                MouseArea{
                    id: racemouseArea
                    anchors.fill: rec_race
                    hoverEnabled: true

                    onPressed:  {
                        rec_race.begin_color = "white"
                        rec_race.stop_color = "#9be74f"
                    }

                    onReleased:  {
                        rec_race.begin_color = "#c7f59c"
                        rec_race.stop_color = "#61b213"
                    }

                    onClicked: {
                        lesson_form.visible = false
                        flashcard_form.visible = false
                        learn_form.visible = false
                        speller_form.visible = false
                        test_form.visible = false
                        scatter_form.visible = false
                        space_form.visible = true
                    }
                }

            }


            Rectangle {

                id: rec_back
                height: rec_menu.height - txt_lesson.height - 30
                width: 110
                anchors.top: txt_lesson.bottom
                anchors.topMargin: 10
                anchors.right: current_code.left
                anchors.rightMargin: 20

                radius: 5
                border.color: "white"
                border.width: 1

                property color begin_color: "#FF7C7C"
                property color stop_color: "#FF0000"


                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#ffffff" }
                    GradientStop { position: 1.0; color: rec_back.stop_color }
                }

                Image {
                    height: parent.height - 5
                    fillMode: Image.PreserveAspectFit
                    anchors.centerIn: parent
                    source: "../English_v4/resource/unit/exit.png"
                }

                MouseArea{
                    id: backmouseArea
                    anchors.fill: rec_back
                    hoverEnabled: true

                    onEntered:  {
                        if(privacy_type == 1) {
                            rec_back.begin_color = "#ffffff"
                            rec_back.stop_color = "#FF7C7C"
                        }
                        else {
                            rec_back.enabled = false
                        }
                    }

                    onExited:  {
                        if(privacy_type == 1) {
                            rec_back.begin_color = "#FF7C7C"
                            rec_back.stop_color = "#FF0000"
                        }
                        else {
                            rec_back.enabled = false
                        }
                    }

                    onClicked: {
                        //                        lesson_form.visible = false
                        //                        flashcard_form.visible = false
                        //                        learn_form.visible = false
                        //                        speller_form.visible = false
                        //                        test_form.visible = false
                        //                        scatter_form.visible = false
                        //                        space_form.visible = false
                        if(privacy_type == 1){
                            perform.back_to_main();
                            reset();
                        }
                    }
                }

            }



            Rectangle {
                id: current_code
                width: 150
                height: rec_menu.height - txt_lesson.height - 30
                color: "white"
                border.color: "black"
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: txt_hello.bottom
                anchors.topMargin: 10

                Item {
                    id: root_item

                    property int min: time_set
                    property int sec: 0
                    property string current_time
                    property string string_min
                    property string string_sec

                    function timeChanged()  {

                        if(sec!=0) sec = sec - 1;
                        else
                        {
                            if(min!=0) sec = 59;
                        }


                        if(sec == 59) min = min - 1;

                        if(min<10)
                        {
                            string_min = "0"+min
                        }
                        else
                        {
                            string_min = ""+min
                        }

                        if(sec<10)
                        {
                            string_sec = "0"+sec
                        }
                        else
                        {
                            string_sec = ""+sec
                        }

                        time_left = min;
                        if((time_left<1)&&(privacy_type==2))
                        {
                            lesson_form.visible = false
                            flashcard_form.visible = false
                            learn_form.visible = false
                            speller_form.visible = false
                            test_form.visible = true
                            scatter_form.visible = false
                            space_form.visible = false
                        }

                        if((min==0) && (sec==0))
                        {
                            console.log("time out");

                        }

                        console.log(time_left)

                        if(privacy_type==1) current_time = "None"
                        else current_time = string_min + ":"+string_sec

                    }

                    Timer  {
                        id: elapsedTimer
                        interval: 1000;
                        running: true;
                        repeat: true;
                        onTriggered: {
                            root_item.timeChanged()
                        }
                    }


                }

                Text {
                    id: txt_current_code
                    anchors.top: parent.top
                    anchors.topMargin: (parent.height - txt_current_code.height*2)/2 - 1
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    text:"Code: " + code
                }

                Text {
                    id: txt_study_time
                    anchors.top: txt_current_code.bottom
                    anchors.topMargin: 2
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    //                    text:"time left: " + root_item.secondsElapsed
                    text:"time left: " + root_item.current_time;
                }

            }
        }

        Rectangle {
            id: rec_list_word
            height: lesson_form.height - rec_menu.height - 120
            width: lesson_form.width - 40
            color: "white"
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: rec_menu.bottom
            anchors.topMargin: 20

            radius: 5






            ScrollView {
                id: scroll_area
                height: rec_list_word.height - 10
                width: rec_list_word.width - 10

                anchors.left: rec_list_word.left
                anchors.leftMargin: 5
                anchors.top: rec_list_word.top
                anchors.topMargin: 5

                objectName: "ScrollView"
                frameVisible: false
                highlightOnFocus: true



                Rectangle{
                    id: rec_scroll
                    width: scroll_area.width - 20
                    height: 100

                    anchors.left: scroll_area.left
                    anchors.top: scroll_area.top
                    anchors.leftMargin: 10
                    anchors.topMargin: 0


                    function get_Id(word_id)
                    {
                        console.debug(word_id);
                    }

                    function createSomeWord()
                    {
                        var component = Qt.createComponent("word.qml");
                        for(var i=0;i<noq;i++)
                        {
                            var vocab_non = component.createObject(rec_scroll,{
                                                                       "word_id":i,
                                                                       "width": rec_scroll.width,
                                                                       "anchors.left": rec_scroll.left,
                                                                       "anchors.top": rec_scroll.top,
                                                                       "anchors.leftMargin": 0,
                                                                       "anchors.topMargin": list_height,
                                                                       "tm": term_list[i],
                                                                       "dn": definition_list[i]
                                                                   });
                            list_height = list_height + vocab_non.height
                            rec_scroll.height = list_height + 10
                        }
                    }
                    Component.onCompleted: {
                        createSomeWord();
                    }



                }

            }
        }


    }

    Rectangle {
        id: flashcard_form
        height: sub_form.height - 100
        width: sub_form.width
        color: "lightgray"
        visible: false

        Rectangle {
            id: fl_button_back
            width: 200
            height: 50
            anchors.left: flashcard_form.left
            anchors.leftMargin: 10
            radius: 5
            anchors.top: flashcard_form.top
            anchors.topMargin: 10

            property color begin_color: "#337cdc"
            property color stop_color: "#2371d9"

            gradient: Gradient {
                GradientStop { position: 0.0; color: fl_button_back.begin_color }
                GradientStop { position: 1.0; color: fl_button_back.stop_color }
            }

            Text {
                text: "← back to lesson " + lesson_u
                color: "white"
                font.bold: true
                font.pixelSize: Math.round(fl_button_back.height/3)
                anchors.centerIn: fl_button_back
            }

            MouseArea{
                anchors.fill: fl_button_back
                hoverEnabled: true

                onPressed: {
                    fl_button_back.begin_color = "#3584eb"
                    fl_button_back.stop_color = "#267bea"
                }

                onReleased: {
                    fl_button_back.begin_color = "#337cdc"
                    fl_button_back.stop_color = "#2371d9"
                }

                onClicked: {

                    flashcard_form.visible = false
                    lesson_form.visible = true
                    reset()
                    text_front.text = term_heli_list[count]
                    text_back.text = definition_heli_list[count]
                }
            }

        }

        Rectangle {

            width: 150
            height: 50
            color: "white"
            border.color: "black"
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 10

            Item {
                id: rt_item_flash

                property int min: time_set
                property int sec: 0
                property string current_time
                property string string_min
                property string string_sec

                function timeChanged()  {
                    if(sec!=0) sec = sec - 1;
                    else
                    {
                        if(min!=0) sec = 59;
                    }

                    if(sec == 59) min = min - 1;


                    if(min<10)
                    {
                        string_min = "0"+min
                    }
                    else
                    {
                        string_min = ""+min
                    }

                    if(sec<10)
                    {
                        string_sec = "0"+sec
                    }
                    else
                    {
                        string_sec = ""+sec
                    }

                    if(privacy_type==1) current_time = "None"
                    else current_time = string_min + ":"+string_sec

                }

                Timer  {
                    interval: 1000;
                    running: true;
                    repeat: true;
                    onTriggered: {
                        rt_item_flash.timeChanged()
                    }
                }


            }


            Text {
                id: txt_crt_code_flash
                anchors.top: parent.top
                anchors.topMargin: (parent.height - txt_crt_code_flash.height)/2
                anchors.left: parent.left
                anchors.leftMargin: 10
                text:"time left: " + rt_item_flash.current_time;
            }

        }


        Flipable {
            id: flipable
            height: flashcard_form.height*3/4
            width: flashcard_form.width*3/4
            anchors.centerIn: flashcard_form

            property bool flipped: false


            front: Rectangle{
                id: front
                color: "white"
                radius: 6
                anchors.fill: parent
                Text {
                    id: text_front
                    anchors.centerIn: front
                    text: term_heli_list[count]
                    wrapMode: Text.WordWrap
                    font.pixelSize: Math.round(front.height/10)
                }

                Text {
                    text: ("click to flip")
                    anchors.right: front.right
                    anchors.rightMargin: 10
                    anchors.bottom: front.bottom
                    anchors.bottomMargin: 10
                }

                MouseArea {
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                    anchors.fill: parent
                    onClicked: flipable.flip()
                }

            }
            back: Rectangle {
                id: back
                color: "white"
                radius: 10
                anchors.fill: parent
                Text {
                    id: text_back
                    width: back.width - 20

                    text: definition_heli_list[count]
                    anchors.top: back.top
                    anchors.topMargin: (back.height - text_back.height)/2
                    anchors.left: back.left
                    anchors.leftMargin: (back.width - text_back.width)/2
                    wrapMode: Text.WordWrap
                    font.pixelSize: Math.round(back.height/12)
                }
                Text {
                    text: ("click to flip")
                    anchors.right: back.right
                    anchors.rightMargin: 10
                    anchors.bottom: back.bottom
                    anchors.bottomMargin: 10
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: flipable.flip()
                }
            }

            transform: Rotation {
                id: rotation
                origin.x: flipable.width/2
                origin.y: flipable.height/2
                axis.x: 1; axis.y: 0; axis.z: 0     // set axis.y to 1 to rotate around y-axis
                angle: 0    // the default angle
            }

            states: State {
                name: "back"
                PropertyChanges { target: rotation; angle: 180 }
                when: flipable.flipped
            }

            transitions: Transition {
                NumberAnimation { target: rotation; property: "angle"; duration: 200 }
            }

            function flip () {
                flipped = !flipped
            }
        }

        Rectangle {
            id: back_button
            height: Math.round(flipable.height/9)
            width: Math.round(flipable.height/9)
            color: "white"
            anchors.top: flipable.bottom
            anchors.topMargin: 10
            anchors.left: flipable.left
            anchors.leftMargin: flipable.width/4
            radius: 100
            border.color: "#F2F2F2"
            border.width: 2

            Text {
                id: back_text
                text: "<"
                color: "black"
                font.bold: true
                font.pixelSize: Math.round(back_button.height/2)
                anchors.centerIn: back_button
            }

            MouseArea{
                anchors.fill: back_button
                hoverEnabled: true

                onPressed: {
                    back_button.color = "#2E2EFE"
                    back_text.color = "white"
                }
                onReleased: {
                    back_button.color = "white"
                    back_text.color = "black"
                }

                onClicked: {
                    if(count>1) count = count - 1;

                    text_front.text = term_heli_list[count]
                    text_back.text = definition_heli_list[count]
                }
            }
        }

        Rectangle {
            id: next_button
            height: Math.round(flipable.height/9)
            width: Math.round(flipable.height/9)
            color: "white"
            anchors.top: flipable.bottom
            anchors.topMargin: 10
            anchors.right: flipable.right
            anchors.rightMargin: flipable.width/4
            radius: 100
            border.color: "#F2F2F2"
            border.width: 2

            Text {
                id: next_text
                text: ">"
                color: "black"
                font.bold: true
                font.pixelSize: Math.round(next_button.height/2)
                anchors.centerIn: next_button
            }

            MouseArea{
                id: nextmouseArea
                anchors.fill: next_button
                hoverEnabled: true

                onPressed: {
                    next_button.color = "#2E2EFE"
                    next_text.color = "white"
                }
                onReleased: {
                    next_button.color = "white"
                    next_text.color = "black"
                }

                onClicked: {
                    if(count < noq) count = count + 1;
                    text_front.text= term_heli_list[count]
                    text_back.text = definition_heli_list[count]
                }
            }
        }

        ProgressBar {
            id: progressBar
            anchors.top: next_button.top
            anchors.topMargin: (next_button.height - progressBar.height)/2
            anchors.right: next_button.left
            anchors.rightMargin: 30
            anchors.left: back_button.right
            anchors.leftMargin: 30
            indeterminate: false
            activeFocusOnTab: false
            maximumValue: 1
            value: count/noq
            Text {
                id: progressText
                text: (count+"/"+noq)
                anchors.centerIn: progressBar
            }
        }
    }

    Rectangle {
        id: learn_form
        width: sub_form.width
        height: sub_form.height - 100
        color: "#f5f2ee"
        visible: false

        Rectangle {
            id: le_button_back
            width: 200
            height: 50
            anchors.left: learn_form.left
            anchors.leftMargin: 20
            radius: 5
            anchors.top: learn_form.top
            anchors.topMargin: 10

            property color begin_color: "#337cdc"
            property color stop_color: "#2371d9"

            gradient: Gradient {
                GradientStop { position: 0.0; color: le_button_back.begin_color }
                GradientStop { position: 1.0; color: le_button_back.stop_color }
            }

            Text {
                text: "← back to lesson " +lesson_u
                color: "white"
                font.bold: true
                font.pixelSize: Math.round(le_button_back.height/3)
                anchors.centerIn: le_button_back
            }

            MouseArea{
                anchors.fill: le_button_back
                hoverEnabled: true

                onPressed: {
                    le_button_back.begin_color = "#3584eb"
                    le_button_back.stop_color = "#267bea"
                }

                onReleased: {
                    le_button_back.begin_color = "#337cdc"
                    le_button_back.stop_color = "#2371d9"
                }

                onClicked: {
                    learn_form.visible = false
                    lesson_form.visible = true
                    reset()
                    status_answer.text = "";
                    learn_definition.text = definition_heli_list[learn_count];
                    learn_term.text = "";
                    txt_remain.text = "" + count_noq;
                    txt_correct.text = "" + n_correct;
                    txt_incorrect.text = "" + n_incorrect;

                }
            }

        }

        Rectangle {

            width: 150
            height: 50
            color: "white"
            border.color: "black"
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 10

            Item {
                id: rt_item_learn

                property int min: time_set
                property int sec: 0
                property string current_time
                property string string_min
                property string string_sec

                function timeChanged()  {
                    if(sec!=0) sec = sec - 1;
                    else
                    {
                        if(min!=0) sec = 59;
                    }

                    if(sec == 59) min = min - 1;


                    if(min<10)
                    {
                        string_min = "0"+min
                    }
                    else
                    {
                        string_min = ""+min
                    }

                    if(sec<10)
                    {
                        string_sec = "0"+sec
                    }
                    else
                    {
                        string_sec = ""+sec
                    }

                    if(privacy_type==1) current_time = "None"
                    else current_time = string_min + ":"+string_sec

                }

                Timer  {
                    interval: 1000;
                    running: true;
                    repeat: true;
                    onTriggered: {
                        rt_item_learn.timeChanged()
                    }
                }


            }


            Text {
                id: txt_crt_code_learn
                anchors.top: parent.top
                anchors.topMargin: (parent.height - txt_crt_code_learn.height)/2
                anchors.left: parent.left
                anchors.leftMargin: 10
                text:"time left: " + rt_item_learn.current_time;
            }

        }

        Rectangle {
            id: results
            width: learn_form.width/6
            height: learn_form.height - 100
            color: "white"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 80
            radius: 5

            Text {
                id: txt_remaining
                text: "Remaining"
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 10
            }

            Rectangle {
                width: results.width - 20
                height: 50
                color: "#1f6fd9"
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: txt_remaining.bottom
                anchors.topMargin: 10

                Text {
                    id: txt_remain
                    color: "#ffffff"
                    text: ""+count_noq
                    anchors.centerIn: parent
                }
            }

            Text {
                id: text_incorrect
                text: "Incorrect"
                anchors.top: txt_remaining.bottom
                anchors.topMargin: 100
                anchors.left: parent.left
                anchors.leftMargin: 10
            }

            Rectangle {
                width: results.width - 20
                height: 50
                color: "#dd4b39"
                anchors.top: text_incorrect.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10

                Text {
                    id: txt_incorrect
                    color: "#ffffff"
                    text: "" + n_incorrect
                    anchors.centerIn: parent
                }
            }
            Text {
                id: text_correct
                text: "Correct"
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: text_incorrect.bottom
                anchors.topMargin: 100
            }

            Rectangle {
                width: results.width - 20
                height: 50
                color: "#398f34"
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: text_correct.bottom
                anchors.topMargin: 10

                Text {
                    id: txt_correct
                    color: "#ffffff"
                    text: "" + n_correct
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                id: button_start
                width: results.width - 60
                height: 50
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                radius: 5

                property color begin_color: "#337cdc"
                property color stop_color: "#2371d9"

                gradient: Gradient {
                    GradientStop { position: 0.0; color: button_start.begin_color }
                    GradientStop { position: 1.0; color: button_start.stop_color }
                }

                Text {
                    text: "Start Over"
                    color: "white"
                    font.bold: true
                    font.pixelSize: Math.round(button_start.height/3)
                    anchors.centerIn: button_start
                }

                MouseArea{
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

                    }
                }
            }
        }

        Rectangle {
            id: test
            width: learn_form.width - results.width - 70
            height: learn_form.height - 100
            color: "#ffffff"
            anchors.top: parent.top
            anchors.topMargin: 80
            anchors.left: results.right
            anchors.leftMargin: 30
            radius: 5

            Text {
                id: learn_definition
                width: test.width - 40
                text: definition_heli_list[learn_count]
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 20
                font.pixelSize: 30
                wrapMode: Text.WordWrap
            }

            Text {
                id: learn_term
                anchors.bottom: txt_answer.top
                anchors.bottomMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 20
                font.pixelSize: 30
                color: "green"
                text: ""
            }

            TextField {
                id: txt_answer
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                placeholderText: qsTr("Give your answer")
                width: test.width - 200
                height: 50
                font.pointSize: 18
            }

            Rectangle {
                id: button_enter
                width: 100
                height: 50
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20

                property color begin_color: "#337cdc"
                property color stop_color: "#2371d9"

                gradient: Gradient {
                    GradientStop { position: 0.0; color: button_enter.begin_color }
                    GradientStop { position: 1.0; color: button_enter.stop_color }
                }

                Text {
                    text: "Answer"
                    color: "white"
                    font.bold: true
                    font.pixelSize: Math.round(button_enter.height/3)
                    anchors.centerIn: button_enter
                }

                MouseArea{
                    anchors.fill: button_enter
                    hoverEnabled: true

                    onPressed: {
                        button_enter.begin_color = "#3584eb"
                        button_enter.stop_color = "#267bea"
                    }

                    onReleased: {
                        button_enter.begin_color = "#337cdc"
                        button_enter.stop_color = "#2371d9"
                    }

                    onClicked: {
                        if(txt_answer.text === term_heli_list[learn_count])
                        {
                            status_answer.text = "True!";
                            learn_count = learn_count + 1;
                            learn_definition.text = definition_heli_list[learn_count];
                            learn_term.text = "";
                            txt_remain.text = "" + count_noq - learn_count;
                            if(failed == 0)
                            {
                                n_correct = n_correct + 1;
                                txt_correct.text = "" + n_correct;
                            }
                            failed = 0;
                        }
                        else
                        {
                            status_answer.text = "False!";
                            learn_term.text = "Type again correct answer: " + term_heli_list[learn_count];
                            if(failed == 0)
                            {
                                n_incorrect = n_incorrect + 1;
                                txt_incorrect.text = "" + n_incorrect;
                            }

                            failed = 1;
                        }
                        txt_answer.text = "";
                    }
                }
            }

            Text {
                id: status_answer
                text: ""
                anchors.right: parent.right
                anchors.rightMargin: 50
                anchors.bottom: button_enter.top
                anchors.bottomMargin: 10
                font.pointSize: 15

            }

            Text {
                id: txt_dont
                x: 974
                text: "Don't know"
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.right: parent.right
                anchors.rightMargin: 20
                font.pixelSize: 17
                color: "blue"
                MouseArea {
                    anchors.fill: txt_dont
                    hoverEnabled: true
                    onClicked:
                    {
                        status_answer.text = "False!";
                        learn_term.text = "Type again correct answer: " + term_heli_list[learn_count];
                        if(failed == 0)
                        {
                            n_incorrect = n_incorrect + 1;
                            txt_incorrect.text = "" + n_incorrect;
                        }

                        failed = 1;
                    }
                }
            }
        }
    }



    Rectangle {
        id: speller_form
        height: sub_form.height - 100
        width: sub_form.width
        color: "#f4f0ea"
        visible: false

        Audio {
            id: speller_player
            source: speller_path
            autoLoad: true
            autoPlay: false
        }

        Rectangle {
            id: sp_button_back
            width: 200
            height: 50
            anchors.left: speller_form.left
            anchors.leftMargin: 20
            radius: 5
            anchors.top: speller_form.top
            anchors.topMargin: 10

            property color begin_color: "#337cdc"
            property color stop_color: "#2371d9"

            gradient: Gradient {
                GradientStop { position: 0.0; color: sp_button_back.begin_color }
                GradientStop { position: 1.0; color: sp_button_back.stop_color }
            }

            Text {
                text: "← back to lesson " +lesson_u
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
                    speller_form.visible = false
                    lesson_form.visible = true
                    reset()
                }
            }

        }

        Rectangle {

            width: 150
            height: 50
            color: "white"
            border.color: "black"
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 10

            Item {
                id: rt_item_speller

                property int min: time_set
                property int sec: 0
                property string current_time
                property string string_min
                property string string_sec

                function timeChanged()  {
                    if(sec!=0) sec = sec - 1;
                    else
                    {
                        if(min!=0) sec = 59;
                    }

                    if(sec == 59) min = min - 1;


                    if(min<10)
                    {
                        string_min = "0"+min
                    }
                    else
                    {
                        string_min = ""+min
                    }

                    if(sec<10)
                    {
                        string_sec = "0"+sec
                    }
                    else
                    {
                        string_sec = ""+sec
                    }

                    if(privacy_type==1) current_time = "None"
                    else current_time = string_min + ":"+string_sec

                }

                Timer  {
                    interval: 1000;
                    running: true;
                    repeat: true;
                    onTriggered: {
                        rt_item_speller.timeChanged()
                    }
                }


            }


            Text {
                id: txt_crt_code_speller
                anchors.top: parent.top
                anchors.topMargin: (parent.height - txt_crt_code_speller.height)/2
                anchors.left: parent.left
                anchors.leftMargin: 10
                text:"time left: " + rt_item_speller.current_time;
            }

        }

        Rectangle {
            id: speller_results
            width: speller_form.width/6
            height: speller_form.height - 100
            color: "white"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 80
            radius: 5

            Text {
                id: txt_progress
                text: "Progress"
                width: speller_results.width - 20
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 10
            }

            Rectangle {
                id: button_replay
                width: speller_results.width - 60
                height: 40
                radius: 5
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: progressBar1.bottom
                anchors.topMargin: 20

                property color begin_color: "#337cdc"
                property color stop_color: "#2371d9"

                gradient: Gradient {
                    GradientStop { position: 0.0; color:button_replay.begin_color }
                    GradientStop { position: 1.0; color: button_replay.stop_color }
                }

                Text {
                    text: "Replay audio"
                    color: "white"
                    font.bold: true
                    font.pixelSize: Math.round(button_replay.height/3)
                    anchors.centerIn: button_replay
                }

                MouseArea{
                    anchors.fill: button_replay
                    hoverEnabled: true

                    onPressed: {
                        button_replay.begin_color = "#3584eb"
                        button_replay.stop_color = "#267bea"
                    }

                    onReleased: {
                        button_replay.begin_color = "#337cdc"
                        button_replay.stop_color = "#2371d9"
                    }

                    onClicked: {
                        speller_player.source = speller_path + term_heli_list[speller_count][0].toUpperCase() + "/" + term_heli_list[speller_count] + ".mp3"
                        if(speller_player.playbackState == 0)
                        {
                            speller_player.play();
                        }
                    }
                }
            }

            ProgressBar {
                id: progressBar1
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: txt_progress.bottom
                anchors.topMargin: 20
                indeterminate: false
                activeFocusOnTab: false
                maximumValue: 1
                value: speller_count/noq
                Text {
                    text: speller_count+"/" + noq
                    anchors.centerIn: parent
                    color: "black"
                }
            }
        }

        Rectangle {
            id: speller_test
            width: speller_form.width - speller_results.width - 70
            height: speller_form.height - 100
            color: "#ffffff"
            anchors.top: parent.top
            anchors.topMargin: 80
            anchors.left: speller_results.right
            anchors.leftMargin: 30
            radius: 5

            Text {
                id: speller_definition
                text: ""
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 20
                font.pixelSize: 30
            }

            Text {
                id: speller_term
                anchors.bottom: speller_txt_answer.top
                anchors.bottomMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 20
                font.pixelSize: 30
                color: "green"
                text: ""
            }

            TextField {
                id: speller_txt_answer
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                placeholderText: qsTr("Give your answer")
                width: speller_test.width - 200
                height: 50
                font.pointSize: 18
            }

            Rectangle {
                id: speller_button_enter
                width: 100
                height: 50
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20

                property color begin_color: "#337cdc"
                property color stop_color: "#2371d9"

                gradient: Gradient {
                    GradientStop { position: 0.0; color: speller_button_enter.begin_color }
                    GradientStop { position: 1.0; color: speller_button_enter.stop_color }
                }

                Text {
                    text: "Answer"
                    color: "white"
                    font.bold: true
                    font.pixelSize: Math.round(speller_button_enter.height/3)
                    anchors.centerIn: speller_button_enter
                }

                MouseArea{
                    anchors.fill: speller_button_enter
                    hoverEnabled: true

                    onPressed: {
                        speller_button_enter.begin_color = "#3584eb"
                        speller_button_enter.stop_color = "#267bea"
                    }

                    onReleased: {
                        speller_button_enter.begin_color = "#337cdc"
                        speller_button_enter.stop_color = "#2371d9"
                    }

                    onClicked: {
                        if(speller_txt_answer.text === term_heli_list[speller_count])
                        {
                            speller_count = speller_count + 1;
                            speller_status_answer.text = "True!"
                            speller_txt_answer.text = "";
                            speller_term.text = "";
                            speller_definition.text = "";
                        }
                        else
                        {
                            speller_status_answer.text = "False!"
                            speller_txt_answer.text = "";
                            speller_term.text = "Type again correct answer: " + term_heli_list[speller_count];
                            speller_definition.text = definition_heli_list[speller_count];
                        }
                        speller_player.source = speller_path + term_heli_list[speller_count][0].toUpperCase() + "/" + term_heli_list[speller_count] + ".mp3"
                        if(speller_player.playbackState == 0)
                        {
                            speller_player.play();
                        }
                    }
                }
            }

            Text {
                id: speller_status_answer
                text: ""
                anchors.right: parent.right
                anchors.rightMargin: 50
                anchors.bottom: speller_button_enter.top
                anchors.bottomMargin: 10
                font.pointSize: 15

            }

            Text {
                id: speller_txt_dont
                text: "Don't know"
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.right: parent.right
                anchors.rightMargin: 20
                font.pixelSize: 17
                color: "blue"
                MouseArea {
                    anchors.fill: speller_txt_dont
                    hoverEnabled: true
                    onClicked:
                    {
                        speller_txt_answer.text = "";
                        speller_term.text = "Type again correct answer: " + term_heli_list[speller_count];
                        speller_definition.text = definition_heli_list[speller_count];
                        speller_player.source = speller_path + term_heli_list[speller_count][0].toUpperCase() + "/" + term_heli_list[speller_count] + ".mp3"
                        if(speller_player.playbackState == 0)
                        {
                            speller_player.play();
                        }
                    }
                }
            }
        }

    }


    Rectangle {
        id: test_form
        height: Screen.height - 100
        width: Screen.width
        color: "#f4f0ea"
        visible: false


        Rectangle {
            id: te_button_back
            width: 200
            height: 50
            anchors.left: test_form.left
            anchors.leftMargin: 20
            radius: 5
            anchors.top: test_form.top
            anchors.topMargin: 10

            property color begin_color: "#337cdc"
            property color stop_color: "#2371d9"

            gradient: Gradient {
                GradientStop { position: 0.0; color: te_button_back.begin_color }
                GradientStop { position: 1.0; color: te_button_back.stop_color }
            }

            Text {
                text: "← back to lesson "+lesson_u
                color: "white"
                font.bold: true
                font.pixelSize: Math.round(te_button_back.height/3)
                anchors.centerIn: te_button_back
            }

            MouseArea{
                anchors.fill: te_button_back
                hoverEnabled: true

                onPressed: {
                    if(privacy_type==1){
                        te_button_back.begin_color = "#3584eb"
                        te_button_back.stop_color = "#267bea"
                    }
                    else te_button_back.enabled = false
                }

                onReleased: {
                    te_button_back.begin_color = "#337cdc"
                    te_button_back.stop_color = "#2371d9"
                }

                onClicked: {
                    for(var i=0; i<noq;i++)
                    {
                        test[i].answer_term.text = "";
                    }
                    your_score_word.text = "";
                    your_score_percent.text = "";

                    button_check_answer.begin_color = "#337cdc"
                    button_check_answer.stop_color = "#2371d9"
                    mouseCheckAnswer.enabled = true

                    test_form.visible = false
                    lesson_form.visible = true
                    reset()
                }
            }

        }

        Rectangle {
            id: crt_code
            width: 150
            height: 50
            color: "white"
            border.color: "black"
            anchors.right: test_form.right
            anchors.rightMargin: 20
            anchors.top: test_form.top
            anchors.topMargin: 10

            Item {
                id: rt_item

                property int min: time_set
                property int sec: 0
                property string current_time
                property string string_min
                property string string_sec

                function timeChanged()  {
                    if(sec!=0) sec = sec - 1;
                    else
                    {
                        if(min!=0) sec = 59;
                    }

                    if(sec == 59) min = min - 1;


                    if(min<10)
                    {
                        string_min = "0"+min
                    }
                    else
                    {
                        string_min = ""+min
                    }

                    if(sec<10)
                    {
                        string_sec = "0"+sec
                    }
                    else
                    {
                        string_sec = ""+sec
                    }

                    if((min==0)&&(sec==0)&&(privacy_type==2))
                    {
                        button_check_answer.begin_color = "#337cdc"
                        button_check_answer.stop_color = "#2371d9"
                        for(var i=0; i<noq;i++)
                        {
                            if(test[i].answer_term.text === term_heli_list[i]){
                                correct_ans = correct_ans + 1;
                            }
                        }
                        var kq = Math.round(correct_ans/count_noq * 10);
                        if(kq >= 9.5) your_score_word.text = "A+"
                        else if((kq >=8.5) & (kq<9)) your_score_word.text = "A"
                        else if((kq >=8) & (kq<8.5)) your_score_word.text = "B+"
                        else if((kq >=7) & (kq<8)) your_score_word.text = "B"
                        else if((kq >=6.5) & (kq<7)) your_score_word.text = "C+"
                        else if((kq >=5.5) & (kq<6)) your_score_word.text = "C"
                        else if((kq >=5) & (kq<5.5)) your_score_word.text = "D+"
                        else if((kq >=4) & (kq<5)) your_score_word.text = "D"
                        else if((kq >=3) & (kq<4)) your_score_word.text = "F+"
                        else your_score_word.text = "F"
                        your_score_percent.text = Math.round(correct_ans/count_noq * 100) + " %"

                        console.log("correct answers is: "+correct_ans);
                        button_check_answer.begin_color = "#dfdfdf"
                        button_check_answer.stop_color = "#7d7d7d"
                        mouseCheckAnswer.enabled = false
                    }



                    if(privacy_type==1) current_time = "None"
                    else current_time = string_min + ":"+string_sec

                }

                Timer  {
                    interval: 1000;
                    running: true;
                    repeat: true;
                    onTriggered: {
                        rt_item.timeChanged()
                    }
                }


            }


            Text {
                id: txt_crt_code
                anchors.top: parent.top
                anchors.topMargin: (parent.height - txt_crt_code.height)/2
                anchors.left: parent.left
                anchors.leftMargin: 10
                //                    text:"time left: " + root_item.secondsElapsed
                text:"time left: " + rt_item.current_time;
            }

        }

        Rectangle {
            id: test_results
            width: test_form.width/6
            height: test_form.height - 100
            color: "white"
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 80
            radius: 5
            border.color: "#d4d1cc"

            Text {
                id: text1
                text: qsTr("Question types")
                font.bold: true
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                font.pixelSize: 16
            }

            CheckBox {
                id: checkBox1
                text: qsTr("Written")
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: text1.bottom
                anchors.topMargin: 10
                checked: true
            }


            CheckBox {
                id: checkBox2
                text: qsTr("Matching")
                anchors.leftMargin: 10
                anchors.topMargin: 10
                checked: false
                anchors.left: parent.left
                anchors.top: checkBox1.bottom
            }
            CheckBox {
                id: checkBox3
                text: qsTr("Multiple choice")
                anchors.leftMargin: 10
                anchors.topMargin: 10
                checked: false
                anchors.left: parent.left
                anchors.top: checkBox2.bottom
            }
            CheckBox {
                id: checkBox4
                text: qsTr("True/False")
                anchors.leftMargin: 10
                anchors.topMargin: 10
                checked: false
                anchors.left: parent.left
                anchors.top: checkBox3.bottom
            }

            Text {
                id: text2
                text: qsTr("Start with")
                font.bold: true
                anchors.top: text1.bottom
                anchors.topMargin: 170
                anchors.left: parent.left
                anchors.leftMargin: 10
                font.pixelSize: 16
            }

            RadioButton {
                id: radioButton1
                text: qsTr("Term")
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: text2.bottom
                anchors.topMargin: 10
                checked: true
            }

            RadioButton {
                id: radioButton2
                text: qsTr("Definition")
                activeFocusOnPress: true
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: radioButton1.bottom
                anchors.topMargin: 10
                checked: false
            }
            RadioButton {
                id: radioButton3
                text: qsTr("Both")
                activeFocusOnPress: true
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: radioButton2.bottom
                anchors.topMargin: 10
                checked: false
            }

            Text {
                id: text3
                text: qsTr("Question limit:")
                font.bold: true
                anchors.top: text2.bottom
                anchors.topMargin: 130
                anchors.left: parent.left
                anchors.leftMargin: 10
                font.pixelSize: 16
            }

            TextField {
                id: textField1
                height: text3.height
                width: 30
                anchors.top: text3.top
                anchors.topMargin: 0
                anchors.left: text3.right
                anchors.leftMargin: 4
                placeholderText: qsTr("")
            }
            Text {
                id: text4
                text: qsTr("of ")+count_noq
                font.bold: true
                anchors.top: text3.top
                anchors.topMargin: 0
                anchors.left: textField1.right
                anchors.leftMargin: 4
                font.pixelSize: 16
            }

            Rectangle {
                id: button_create_test
                width: test_results.width - 60
                height: 40
                radius: 5
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: text3.bottom
                anchors.topMargin: 20

                property color begin_color: "#337cdc"
                property color stop_color: "#2371d9"

                gradient: Gradient {
                    GradientStop { position: 0.0; color: button_create_test.begin_color }
                    GradientStop { position: 1.0; color: button_create_test.stop_color }
                }

                Text {
                    text: "Create new test"
                    color: "white"
                    font.bold: true
                    font.pixelSize: Math.round(button_create_test.height/3)
                    anchors.centerIn: button_create_test
                }


                MouseArea{
                    anchors.fill: button_create_test
                    hoverEnabled: true

                    onPressed: {
                        button_create_test.begin_color = "#3584eb"
                        button_create_test.stop_color = "#267bea"
                    }

                    onReleased: {
                        button_create_test.begin_color = "#337cdc"
                        button_create_test.stop_color = "#2371d9"
                    }

                    onClicked: {

                    }
                }

            }

            Text {
                id: text5
                text: "Your score:"
                font.pointSize: 16
                font.bold: true
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: button_create_test.bottom
                anchors.topMargin: 10
            }

            Text {
                id: your_score_word
                text: ""
                font.pointSize: 30
                font.bold: true
                anchors.left: parent.left
                anchors.leftMargin: (parent.width - your_score_word.width)/2
                anchors.top: text5.bottom
                anchors.topMargin: 5
                color: "red"
            }

            Text {
                id: your_score_percent
                text: ""
                font.pointSize: 14
                font.bold: true
                anchors.left: parent.left
                anchors.leftMargin: (parent.width - your_score_percent.width)/2
                anchors.top: your_score_word.bottom
                anchors.topMargin: 5
                color: "black"
            }


        }

        Rectangle {
            id: test_test
            width: test_form.width - test_results.width - 70
            height: test_form.height - 100
            color: "#ffffff"
            anchors.top: parent.top
            anchors.topMargin: 80
            anchors.right: test_results.left
            anchors.rightMargin: 30
            radius: 5
            border.color: "#d4d1cc"

            ScrollView {
                id: test_scroll_area
                height: test_test.height - 10
                width: test_test.width - 10

                anchors.left: test_test.left
                anchors.leftMargin: 5
                anchors.top: test_test.top
                anchors.topMargin: 5


                objectName: "ScrollView"
                frameVisible: false
                highlightOnFocus: true

                Rectangle{
                    id: rec_test_scroll
                    width: test_scroll_area.width - 20
                    height: 100

                    anchors.left: test_scroll_area.left
                    anchors.top: test_scroll_area.top
                    anchors.leftMargin: 10
                    anchors.topMargin: 0

                    function print_Id(genId)
                    {
                        console.debug(genId);
                    }


                    function createTest()
                    {
                        var component = Qt.createComponent("gen_test.qml");

                        for(var i=0;i<noq;i++)
                        {
                            test[i] = component.createObject(rec_test_scroll,{
                                                                 "genId":i,
                                                                 "width":rec_test_scroll.width,
                                                                 "anchors.top": rec_test_scroll.top,
                                                                 "anchors.topMargin": test_height,
                                                                 "order":i+1,
                                                                 "dn":definition_heli_list[i]

                                                             });
                            test_height = test_height + test[i].height;
                            rec_test_scroll.height = test_height + 100;

                            test[i].send_Id.connect(print_Id);
                        }
                    }
                    Component.onCompleted: {
                        createTest();
                        //                        console.log(test[10].answer_term.text);
                    }

                    Rectangle {
                        id: button_check_answer
                        width: 150
                        height: 50
                        radius: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 20

                        property color begin_color: "#337cdc"
                        property color stop_color: "#2371d9"

                        gradient: Gradient {
                            GradientStop { position: 0.0; color: button_check_answer.begin_color }
                            GradientStop { position: 1.0; color: button_check_answer.stop_color }
                        }

                        Text {
                            text: "Check answers"
                            color: "white"
                            font.bold: true
                            font.pixelSize: Math.round(button_check_answer.height/3)
                            anchors.centerIn: button_check_answer
                        }

                        MouseArea{
                            id: mouseCheckAnswer
                            anchors.fill: button_check_answer
                            hoverEnabled: true
                            enabled: true

                            onPressed: {
                                button_check_answer.begin_color = "#3584eb"
                                button_check_answer.stop_color = "#267bea"
                            }

                            onReleased: {
                                button_check_answer.begin_color = "#337cdc"
                                button_check_answer.stop_color = "#2371d9"
                            }

                            onClicked: {
                                // check answers
                                for(var i=0; i<noq;i++)
                                {
                                    if(test[i].answer_term.text === term_heli_list[i]){
                                        correct_ans = correct_ans + 1;
                                    }
                                }
                                var kq = Math.round(correct_ans/count_noq * 10);
                                if(kq >= 9.5) your_score_word.text = "A+"
                                else if((kq >=8.5) & (kq<9)) your_score_word.text = "A"
                                else if((kq >=8) & (kq<8.5)) your_score_word.text = "B+"
                                else if((kq >=7) & (kq<8)) your_score_word.text = "B"
                                else if((kq >=6.5) & (kq<7)) your_score_word.text = "C+"
                                else if((kq >=5.5) & (kq<6)) your_score_word.text = "C"
                                else if((kq >=5) & (kq<5.5)) your_score_word.text = "D+"
                                else if((kq >=4) & (kq<5)) your_score_word.text = "D"
                                else if((kq >=3) & (kq<4)) your_score_word.text = "F+"
                                else your_score_word.text = "F"
                                your_score_percent.text = Math.round(correct_ans/count_noq * 100) + " %"

                                console.log("correct answers is: "+correct_ans);
                                button_check_answer.begin_color = "#dfdfdf"
                                button_check_answer.stop_color = "#7d7d7d"
                                mouseCheckAnswer.enabled = false

                            }
                        }
                    }

                }
            }


        }


    }


    Rectangle {
        id: scatter_form
        height: Screen.height - 100
        width: Screen.width
        color: "#f4f0ea"
        visible: false

        Rectangle {
            id: sc_button_back
            width: 200
            height: 50
            anchors.left: scatter_form.left
            anchors.leftMargin: 20
            radius: 5
            anchors.top: scatter_form.top
            anchors.topMargin: 10

            property color begin_color: "#337cdc"
            property color stop_color: "#2371d9"

            gradient: Gradient {
                GradientStop { position: 0.0; color: sc_button_back.begin_color }
                GradientStop { position: 1.0; color: sc_button_back.stop_color }
            }

            Text {
                text: "← back to lesson "+lesson_u
                color: "white"
                font.bold: true
                font.pixelSize: Math.round(sc_button_back.height/3)
                anchors.centerIn: sc_button_back
            }

            MouseArea{
                anchors.fill: sc_button_back
                hoverEnabled: true

                onPressed: {
                    sc_button_back.begin_color = "#3584eb"
                    sc_button_back.stop_color = "#267bea"
                }

                onReleased: {
                    sc_button_back.begin_color = "#337cdc"
                    sc_button_back.stop_color = "#2371d9"
                }

                onClicked: {
                    scatter_form.visible = false
                    lesson_form.visible = true
                    reset()
                    for(var z=0;z<20;z++)
                    {
                        rect1[z].destroy();
                    }
                    sc_main_play.generate()



                }
            }

        }

        Rectangle {
            id: time_left_scatter
            width: 150
            height: 50
            color: "white"
            border.color: "black"
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 10

            Item {
                id: rt_item_scatter

                property int min: time_set
                property int sec: 0
                property string current_time
                property string string_min
                property string string_sec

                function timeChanged()  {
                    if(sec!=0) sec = sec - 1;
                    else
                    {
                        if(min!=0) sec = 59;
                    }

                    if(sec == 59) min = min - 1;


                    if(min<10)
                    {
                        string_min = "0"+min
                    }
                    else
                    {
                        string_min = ""+min
                    }

                    if(sec<10)
                    {
                        string_sec = "0"+sec
                    }
                    else
                    {
                        string_sec = ""+sec
                    }

                    if(privacy_type==1) current_time = "None"
                    else current_time = string_min + ":"+string_sec

                }

                Timer  {
                    interval: 1000;
                    running: true;
                    repeat: true;
                    onTriggered: {
                        rt_item_scatter.timeChanged()
                    }
                }


            }


            Text {
                id: txt_crt_code_scatter
                anchors.top: parent.top
                anchors.topMargin: (parent.height - txt_crt_code_scatter.height)/2
                anchors.left: parent.left
                anchors.leftMargin: 10
                text:"time left: " + rt_item_scatter.current_time;
            }

        }

        Rectangle {
            id: sc_time
            width: 200
            height: 50
            anchors.right: time_left_scatter.left
            anchors.rightMargin: 20
            anchors.top: scatter_form.top
            anchors.topMargin: 10
            border.color: "black"

            Item {
                id: rt_item_scatter_play


                property int min: sec_count_scatter
                property int sec: sec_count_scatter
                property int hour: sec_count_scatter
                property string current_time
                property string string_min
                property string string_sec
                property string string_hour

                function timeChanged()  {

                    if(sec == 59) sec = 0;
                    else sec = sec + 1;

                    if(sec == 59) min = min + 1;

                    if((min == 59)&&(sec == 59)) hour = hour + 1;


                    if(min<10)
                    {
                        string_min = "0"+min
                    }
                    else
                    {
                        string_min = ""+min
                    }

                    if(sec<10)
                    {
                        string_sec = "0"+sec
                    }
                    else
                    {
                        string_sec = ""+sec
                    }
                    if(hour<10)
                    {
                        string_hour = "0"+hour
                    }
                    else
                    {
                        string_hour = ""+hour
                    }

                    current_time = string_hour + ":"+string_min + ":"+string_sec
                }

                Timer  {
                    interval: 1000;
                    running: true;
                    repeat: true;
                    onTriggered: {
                        rt_item_scatter_play.timeChanged()
                    }
                }


            }


            Text {
                text: "Time record: "
            }
            Text {
                anchors.left: sc_time.left
                anchors.leftMargin: (sc_time.width - width)/2

                anchors.top: sc_time.top
                anchors.topMargin: 20
                text: rt_item_scatter_play.current_time
            }
        }

        Rectangle {
            id: sc_main_play
            width: scatter_form.width - 40
            height: scatter_form.height - sc_button_back.height - 30
            anchors.top: sc_button_back.bottom
            anchors.topMargin: 10
            anchors.left: scatter_form.left
            anchors.leftMargin: 20
            radius: 5

            function checkmMatch(abc) {        //Ham de kiem tra xem co cung thuoc tinh khong de invisible
                var globalCoordinares_tr = abc.mapToItem(sc_main_play, 0, 0)
                var globalCoordinares_bl = abc.mapToItem(sc_main_play, 0, 0)
                var globalCoordinares_br = abc.mapToItem(sc_main_play, 0, 0)
                var globalCoordinares_tl = abc.mapToItem(sc_main_play, 0, 0)
                //top right
                globalCoordinares_tr.x = globalCoordinares_tr.x + abc.width
                globalCoordinares_tr.y = globalCoordinares_tr.y
                //bottom left
                globalCoordinares_bl.x = globalCoordinares_bl.x
                globalCoordinares_bl.y = globalCoordinares_bl.y + abc.height
                //bottom right
                globalCoordinares_br.x = globalCoordinares_br.x + abc.width
                globalCoordinares_br.y = globalCoordinares_br.y + abc.height
                abc.visible = false
                var temp = abc.key;  //Luu tam gia tri key cua rect_term1
                //Kiem tra xem co match ko
                if(sc_main_play.childAt(globalCoordinares_tl.x, globalCoordinares_tl.y) !== null && sc_main_play.childAt(globalCoordinares_tl.x, globalCoordinares_tl.y).key === temp )
                    sc_main_play.childAt(globalCoordinares_tl.x, globalCoordinares_tl.y).visible = false
                else if (sc_main_play.childAt(globalCoordinares_tr.x, globalCoordinares_tr.y) !== null && sc_main_play.childAt(globalCoordinares_tr.x, globalCoordinares_tr.y).key === temp)
                    sc_main_play.childAt(globalCoordinares_tr.x, globalCoordinares_tr.y).visible = false
                else if (sc_main_play.childAt(globalCoordinares_bl.x, globalCoordinares_bl.y) !== null && sc_main_play.childAt(globalCoordinares_bl.x, globalCoordinares_bl.y).key === temp)
                    sc_main_play.childAt(globalCoordinares_bl.x, globalCoordinares_bl.y).visible = false
                else if (sc_main_play.childAt(globalCoordinares_br.x, globalCoordinares_br.y) !== null && sc_main_play.childAt(globalCoordinares_br.x, globalCoordinares_br.y).key === temp)
                    sc_main_play.childAt(globalCoordinares_br.x, globalCoordinares_br.y).visible = false
                else
                {
                    abc.visible = true
                    abc.x = abc.x_old
                    abc.y = abc.y_old
                }
            }



            function rectPositionChanged(buttonId)
            {
                //            console.debug(buttonId);
            }
            function rectReleased(buttonId)
            {
                sc_main_play.checkmMatch(rect1[buttonId].rect)
                //            console.debug(buttonId);
                //        console.log(rect1[buttonId].rect.key)
            }
            function rectExited(buttonId)
            {
                //            console.debug(buttonId);
            }

            function generate() {
                var component = Qt.createComponent("scatter_rect.qml");
                for(var i=0; i<20; i++)
                {
                    cdx = 10 + (i%6)*(Screen.width/6.1)
                    cdy = 10 + Math.floor(i/6)*(Screen.height/4.8)
                    rect1[i] = component.createObject(sc_main_play,{"x":cdx,"y":cdy, "rect": i, x_old: cdx, y_old: cdy, buttonId: i,"term_text": ques_str[i], key:ques_key[i]});
                    //Connect the clicked signal of the newly created button
                    //to the event handler buttonClicked.
                    rect1[i].positionChanged.connect(rectPositionChanged)
                    rect1[i].released.connect(rectReleased)
                    rect1[i].exited.connect(rectExited)
                }
            }

            MouseArea {
                anchors.fill: parent
                Component.onCompleted: {
                    parent.generate()
                }

            }
        }

    }



    Rectangle {
        id: space_form
        height: Screen.height - 100
        width: Screen.width
        color: "#f4f0ea"
        visible: false

        Rectangle {
            id: race_button_back
            width: 200
            height: 50
            anchors.left: space_form.left
            anchors.leftMargin: 20
            radius: 5
            anchors.top: space_form.top
            anchors.topMargin: 10

            property color begin_color: "#337cdc"
            property color stop_color: "#2371d9"

            gradient: Gradient {
                GradientStop { position: 0.0; color: race_button_back.begin_color }
                GradientStop { position: 1.0; color: race_button_back.stop_color }
            }

            Text {
                text: "← back to lesson "+lesson_u
                color: "white"
                font.bold: true
                font.pixelSize: Math.round(race_button_back.height/3)
                anchors.centerIn: race_button_back
            }

            MouseArea{
                anchors.fill: race_button_back
                hoverEnabled: true

                onPressed: {
                    race_button_back.begin_color = "#3584eb"
                    race_button_back.stop_color = "#267bea"
                }

                onReleased: {
                    race_button_back.begin_color = "#337cdc"
                    race_button_back.stop_color = "#2371d9"
                }

                onClicked: {
                    space_form.visible = false
                    lesson_form.visible = true
                    sp_instruction.visible = true
                    // jump
                    word_1.destroy();
                    check_word_1 = 0;
                    word_2.destroy();
                    check_word_2 = 0;
                    word_3.destroy();
                    check_word_3 = 0;

                    reset()
                }
            }

        }

        Rectangle {

                width: 150
                height: 50
                color: "white"
                border.color: "black"
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.top: parent.top
                anchors.topMargin: 10

                Item {
                    id: rt_item_space

                    property int min: time_set
                    property int sec: 0
                    property string current_time
                    property string string_min
                    property string string_sec


                    function timeChanged()  {
                        if(sec!=0) sec = sec - 1;
                        else
                        {
                            if(min!=0) sec = 59;
                        }

                        if(sec == 59) min = min - 1;


                        if(min<10)
                        {
                            string_min = "0"+min
                        }
                        else
                        {
                            string_min = ""+min
                        }

                        if(sec<10)
                        {
                            string_sec = "0"+sec
                        }
                        else
                        {
                            string_sec = ""+sec
                        }


                        if(privacy_type==1) current_time = "None"
                        else current_time = string_min + ":"+string_sec

                    }

                    Timer  {
                        interval: 1000;
                        running: true;
                        repeat: true;
                        onTriggered: {
                            rt_item_space.timeChanged()
                        }
                    }


                }


                Text {
                    id: txt_crt_code_space
                    anchors.top: parent.top
                    anchors.topMargin: (parent.height - txt_crt_code_space.height)/2
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    text:"time left: " + rt_item_space.current_time;
                }

            }


        Rectangle {
            id: sp_main_play
            width: space_form.width
            height: space_form.height - race_button_back.height - 10
            anchors.top: race_button_back.bottom
            anchors.topMargin: 10
            anchors.left: space_form.left
            anchors.leftMargin: 0
            radius: 0
            color: "white"


            Item {
                id: sp_speed

                property int position: 1
                property int count1: 0
                property int count2: -Screen.width/3
                property int count3: -2*Screen.width/3


                function createMessage()
                {

                    component = Qt.createComponent("sp_message.qml");
                    box = component.createObject(sp_main_play,{
                                                     "wi": parent.width/4,
                                                     "anchors.centerIn": sp_main_play,
                                                     "term": sp_term[key-1],
                                                     "definition": sp_definition[key-1],
                                                     "click": 0
                                                 });


                }


                function createSomeWord1()
                {

                    component1 = Qt.createComponent("text_run.qml");
                    word_1 = component1.createObject(sp_main_play,{
                                                         "x_val": 0,
                                                         "anchors.top": sp_main_play.top,
                                                         "anchors.topMargin": 0,
                                                         "he": (sp_main_play.height - sp_record.height)/3,
                                                         "word_run": sp_definition[0],
                                                         "check_gen": 1
                                                     });


                }

                function createSomeWord2()
                {

                    component2 = Qt.createComponent("text_run.qml");
                    word_2 = component2.createObject(sp_main_play,{
                                                         "x_val": 0,
                                                         "anchors.top": sp_main_play.top,
                                                         "anchors.topMargin": (sp_main_play.height - sp_record.height)/3,
                                                         "he": (sp_main_play.height - sp_record.height)/3,
                                                         "word_run": sp_definition[1],
                                                         "check_gen": 2
                                                     });
                }

                function createSomeWord3()
                {

                    component3 = Qt.createComponent("text_run.qml");
                    word_3 = component3.createObject(sp_main_play,{
                                                         "x_val":0,
                                                         "anchors.top": sp_main_play.top,
                                                         "anchors.topMargin": 2*(sp_main_play.height - sp_record.height)/3,
                                                         "he": (sp_main_play.height - sp_record.height)/3,
                                                         "word_run": sp_definition[2],
                                                         "check_gen": 3
                                                     });


                }

                function destroyMessage()
                {
                    box.destroy();
                    check_message = 0;
                    sp_click = 0;
                    if(key==1)
                        key = 2;
                    else if(key==2)
                        key = 3;
                    else if(key==3)
                        key = 1;
                }

                function destroyWord1()
                {
                    word_1.destroy();
                    //key = 2;
                    check_word_1 = 0;
                }

                function destroyWord2()
                {
                    word_2.destroy();
                    //key = 3;
                    check_word_2 = 0;
                }
                function destroyWord3()
                {
                    word_3.destroy();
                    //key = 1;
                    check_word_3 = 0;
                }

                function genMessage()
                {
                    createMessage();
                    check_message = 999;
                }

                function genWord1()
                {
                    createSomeWord1();
                    check_word_1 = 1;
                }
                function genWord2()
                {

                    createSomeWord2();
                    check_word_2 = 2;
                }
                function genWord3()
                {

                    createSomeWord3();
                    check_word_3 = 3;
                }

                function runWord()
                {
                    // Argorithm 1 area:
                    if(sp_instruct_click == 99)
                    {
                        genWord1()
                        key = 1;
                        sp_instruct_click = 0

                    }
                    if(key==1)
                    {
                        console.log("term1:"+sp_term[key])
                        if(check_word_2 == 2)
                        {
                            if(sp_answer.text === sp_term[key-1])
                            {
                                destroyWord1();
                                key = 2;
                                sp_answer.text = "";
                                answer_right = 1;
                            }
                            else if(sp_click == 99)
                            {
                                destroyWord1();
                                sp_answer.text = "";
                            }
                        }
                        else
                        {
                            if(sp_answer.text === sp_term[key-1])
                            {
                                destroyWord1();
                                genWord2();
                                key = 2;
                                sp_answer.text = "";
                                answer_right = 1;
                            }
                            else if(sp_click == 99)
                            {
                                destroyWord1();
                                genWord2();
                                sp_answer.text = "";
                            }
                        }

                        if(word_1.txt_id.x_val === Math.round(2*Screen.width/3))
                        {
                            genWord2();
                        }

                    }

                    if(key==2)
                    {
                        console.log("term2:"+sp_term[key])
                        if(check_word_3 == 3)
                        {
                            if(sp_answer.text === sp_term[key-1])
                            {
                                destroyWord2();
                                key = 3;
                                sp_answer.text = "";
                                answer_right = 1;
                            }
                            else if(sp_click == 99)
                            {
                                destroyWord2();
                                sp_answer.text = "";
                            }
                        }
                        else
                        {
                            if(sp_answer.text === sp_term[key-1])
                            {
                                destroyWord2();
                                genWord3();
                                key = 3;
                                sp_answer.text = "";
                                answer_right = 1;
                            }
                            else if(sp_click == 99)
                            {
                                destroyWord2();
                                genWord3();
                                sp_answer.text = "";
                            }
                        }

                        if(word_2.txt_id.x_val === Math.round(2*Screen.width/3))
                        {
                            genWord3();
                        }

                    }
                    if(key==3)
                    {
                        console.log("term3:"+sp_term[key])
                        if(check_word_1 == 1)
                        {
                            if(sp_answer.text === sp_term[key-1])
                            {
                                destroyWord3();
                                key = 1;
                                sp_answer.text = "";
                                answer_right = 1;
                            }
                            else if(sp_click == 99)
                            {
                                destroyWord3();
                                sp_answer.text = "";
                            }
                        }
                        else
                        {
                            if(sp_answer.text === sp_term[key-1])
                            {
                                destroyWord3();
                                initial();
                                genWord1();
                                key = 1;
                                sp_answer.text = "";
                                answer_right = 1;
                            }
                            else if(sp_click == 99)
                            {
                                destroyWord3();
                                initial();
                                genWord1();
                                sp_answer.text = "";
                            }
                        }

                        if(word_3.txt_id.x_val === Math.round(2*Screen.width/3))
                        {
                            initial();
                            genWord1();
                        }

                    }

                    // Argorithm 2 area:

                    if(check_word_1 == 1)
                    {

                        if((sp_click == 0)&&(check_only == 0))
                        {
                            if(word_1.txt_id.x_val !== Screen.width)
                                word_1.txt_id.x_val = word_1.txt_id.x_val + 1;
                            else
                            {
                                genMessage()
                                check_only = 1;
                                sp_record.enabled = false
                                console.log("sp_click="+sp_click)
                                console.log("check_only="+check_only)
                            }
                        }
                    }

                    if(check_word_2 == 2)
                    {
                        if((sp_click == 0)&&(check_only == 0))
                        {

                            if(word_2.txt_id.x_val !== Screen.width)
                                word_2.txt_id.x_val = word_2.txt_id.x_val + 1;
                            else
                            {
                                genMessage()
                                check_only = 1;
                                sp_record.enabled = false
                            }
                        }
                    }

                    if(check_word_3 == 3)
                    {
                        if((sp_click == 0)&&(check_only == 0))
                        {

                            if(word_3.txt_id.x_val !== Screen.width)
                                word_3.txt_id.x_val = word_3.txt_id.x_val + 1;
                            else
                            {
                                genMessage()
                                check_only = 1;
                                sp_record.enabled = false
                            }
                        }
                    }

                    if((sp_click == 99)&&(check_only == 1))
                    {
                        console.log("IM HERE")
                        destroyMessage()
                        check_only = 0
                        sp_record.enabled = true
                    }



                }

                function checkMessage()
                {
                    if(check_message == 999)
                    {
                        sp_click = box.sp_copy_id.click
                    }
                }

                function checkRecord()
                {
                    if(sp_click == 99)
                        lives = lives - 1;
                    if(answer_right == 1)
                    {
                        answer_right = 0;
                        right_10 = right_10 + 1;
                        correct = correct + 1;
                        score = score + 10*speed_initial
                    }
                    if(right_10 == noq - 1)
                    {
                        right_10 = 0;
                        level = level + 1;
                        speed_initial = speed_initial + 1;
                    }
                    if((10/speed_initial == 0)||(lives == 0))
                    {
                        sp_gameover.visible = true
                        txt_score_sp.text = txt_score_sp.text + score
                        time_running.running = false
                    }
                }


                Timer  {
                    id: time_running
                    interval: 10/speed_initial;
                    running: true;
                    repeat: true;
                    onTriggered: {

                        sp_speed.runWord();
                        sp_speed.checkMessage();
                        sp_speed.checkRecord();
                    }
                }

            }


            Rectangle {
                id: sp_gameover
                width: parent.width/5
                height: width*2/3
                anchors.centerIn: parent
                radius: 5
                color: "#eeeeee"
                border.color: "black"
                z: 1
                visible: false


                Text {
                    id:txt_gameover_sp
                    text: "Game Over"
                    anchors.left: parent.left
                    anchors.leftMargin: (parent.width - width)/2
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    font.pointSize: parent.width/15
                    color: "blue"
                    font.bold: true
                }

                Text {
                    id:txt_score_sp
                    text: "Your Score: "
                    anchors.left: parent.left
                    anchors.leftMargin: (parent.width - width)/2
                    anchors.top: txt_gameover_sp.bottom
                    anchors.topMargin: parent.width/20
                    font.pointSize: parent.width/14
                    color: "red"
                    font.bold: true
                }



                Rectangle {

                    property real offset: Math.min(parent.width*0.01, parent.height*0.01)
                    color: "grey"
                    width: parent.width + 2*offset
                    height: parent.height + 2*offset
                    z: -1
                    opacity: 0.75
                    radius: parent.radius + 2
                    anchors.left: parent.left
                    anchors.leftMargin: -offset
                    anchors.top: parent.top
                    anchors.topMargin: -offset
                }
            }


            Rectangle {
                id: sp_instruction
                width: parent.width/5
                height: width*2/3
                anchors.centerIn: parent
                radius: 5
                border.color: "black"


                Text {
                    id:txt_instruct_space
                    text: "Instructions"
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    font.pointSize: parent.width/18
                }

                Text {
                    id: txt_content_space
                    width: sp_instruction.width - 20
                    text: "Destroy the scrolling words by typing in their corresponding term and pressing ENTER. You may destroy them in any order, but make sure they don't scroll past the screen. Click Start Playing to play"
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.top: txt_instruct_space.bottom
                    anchors.topMargin: parent.width/28
                    wrapMode: Text.WordWrap
                    font.pointSize: parent.width/28
                }

                Text {
                    color: "#1720fa"
                    text: "Start Playing"
                    anchors.left: parent.left
                    anchors.leftMargin: (parent.width - width)/2
                    anchors.top: txt_content_space.bottom
                    anchors.topMargin: parent.width/28
                    font.pointSize: parent.width/17
                    font.bold: true

                    MouseArea {
                        anchors.fill: parent
                        onEntered: parent.color = "red"
                        onExited: parent.color = "#1720fa"
                        onClicked: {
                            console.log("started")
                            sp_instruction.visible = false
                            sp_record.enabled = true
                            sp_instruct_click = 99 // clicked
                            initial()
                        }
                    }
                }


                Rectangle {

                    property real offset: Math.min(parent.width*0.01, parent.height*0.01)
                    color: "grey"
                    width: parent.width + 2*offset
                    height: parent.height + 2*offset
                    z: -1
                    opacity: 0.75
                    radius: parent.radius + 2
                    anchors.left: parent.left
                    anchors.leftMargin: -offset
                    anchors.top: parent.top
                    anchors.topMargin: -offset
                }
            }

            Rectangle {
                id:sp_record
                height: parent.height/6
                width: parent.width
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                color: "#eeeeee"
                border.color: "#cccccc"
                enabled: false

                TextField {
                    id: sp_answer
                    width: parent.width/2
                    height: parent.height/3
                    font.pointSize: height*2/5
                    anchors.top: parent.top
                    anchors.topMargin: (parent.height - height)/2
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                }

                Rectangle {

                    height: parent.height/3
                    width: parent.width - sp_answer.width - 60
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    color: "#eeeeee"

                    Text {
                        id:sp_lives
                        text: "LIVES: "+lives
                        anchors.top: parent.top
                        anchors.topMargin: (parent.height - height)/2
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                    }

                    Text {
                        id:sp_correct
                        text: "CORRECT: "+correct
                        anchors.top: parent.top
                        anchors.topMargin: (parent.height - height)/2
                        anchors.left: sp_lives.left
                        anchors.leftMargin: -parent.width/3
                    }

                    Text {
                        id:sp_level
                        text: "LEVEL: "+level
                        anchors.top: parent.top
                        anchors.topMargin: (parent.height - height)/2
                        anchors.left: sp_correct.left
                        anchors.leftMargin: -parent.width/3
                    }

                }

                Rectangle {
                    id: rectangle1

                    height: parent.height/3
                    width: parent.width - sp_answer.width - 60
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    color: "#eeeeee"

                    Text {
                        id:sp_score
                        text: "SCORE: "+score
                        anchors.rightMargin: 20
                        anchors.top: parent.top
                        anchors.topMargin: (parent.height - height)/2
                        anchors.right: parent.right
                    }
                }
            }
        }
    }
}




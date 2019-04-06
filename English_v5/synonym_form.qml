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
    id: sub_form_synonym
    height: Screen.height
    width: Screen.width
    color: "#f4f0ea"
    visible: true

    property int list_height: 10
    property int test_height: 10
    property var test: []
    property int count_noq: noq
    property int time_set: 2   // 60min


    Rectangle {
        id: synonym_form
        height: sub_form_synonym.height
        width: sub_form_synonym.width
        color: "#f4f0ea"
        visible: true

        Rectangle {
            id: rec_menu
            height: synonym_form.height/7
            width: synonym_form.width
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
                width: synonym_form.width/6 - 80
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
                        synonym_form.visible = false
                        flashcard_form.visible = true
                        learn_form.visible = false
                        test_form.visible = false
                    }
                }

            }

            Rectangle {

                id: rec_learn
                width: synonym_form.width/6 - 80
                height: rec_menu.height - txt_lesson.height - 30
                anchors.top: txt_lesson.bottom
                anchors.topMargin: 10
                anchors.left: rec_flash.right
                anchors.leftMargin: 30

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
                        synonym_form.visible = false
                        flashcard_form.visible = false
                        learn_form.visible = true
                        test_form.visible = false
                    }
                }

            }



            Rectangle {

                id: rec_test
                width: synonym_form.width/6 - 80
                height: rec_menu.height - txt_lesson.height - 30
                anchors.top: txt_lesson.bottom
                anchors.topMargin: 10
                anchors.left: rec_learn.right
                anchors.leftMargin: 30

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
                        rec_test.begin_color = "white"
                        rec_test.stop_color = "#9be74f"
                    }

                    onReleased:  {
                        rec_test.begin_color = "#c7f59c"
                        rec_test.stop_color = "#61b213"
                    }

                    onClicked: {
                        synonym_form.visible = false
//                        flashcard_form.visible = false
                        //learn_form.visible = false
                        test_form.visible = true

                    }
                }

            }

            Rectangle {

                id: rec_back
                height: rec_menu.height - txt_lesson.height - 30
                width: synonym_form.width/6 - 120
                anchors.top: txt_lesson.bottom
                anchors.topMargin: 10
                anchors.left: rec_test.right
                anchors.leftMargin: 40

                radius: 5
                border.color: "white"
                border.width: 1

                property color begin_color: "#FF7C7C"
                property color stop_color: "#FF0000"

                gradient: Gradient {
                    GradientStop { position: 0.0; color: rec_back.begin_color }
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
                        rec_back.begin_color = "#ffffff"
                        rec_back.stop_color = "#FF7C7C"
                    }

                    onExited:  {
                        rec_back.begin_color = "#FF7C7C"
                        rec_back.stop_color = "#FF0000"
                    }

                    onClicked: {
//                        synonym_form.visible = false
//                        flashcard_form.visible = false
//                        learn_form.visible = false
//                        test_form.visible = false
                        perform.back_to_main();
                    }
                }

            }

            Rectangle {
                id: current_code
                width: 150
                height: 50
                color: "white"
                border.color: "black"
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: txt_hello.bottom
                anchors.topMargin: 10
                Text {
                    id: txt_current_code
                    anchors.top: parent.top
                    anchors.topMargin: (parent.height - txt_current_code.height)/2
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    text:"Code: " + code
                }
            }
        }

        Rectangle {
            id: rec_list_word
            height: synonym_form.height - rec_menu.height - 120
            width: synonym_form.width - 40
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
                        var component = Qt.createComponent("word_synonym.qml");
                        for(var i=0;i<noq;i++)
                        {
                            var vocab_non = component.createObject(rec_scroll,{
                                                                       "word_id":i,
                                                                       "width": rec_scroll.width,
                                                                       "anchors.left": rec_scroll.left,
                                                                       "anchors.top": rec_scroll.top,
                                                                       "anchors.leftMargin": 0,
                                                                       "anchors.topMargin": list_height,
                                                                       "word":((col1[i]!=="") ? col1[i]+" - " : "") + ((col2[i]!=="") ? col2[i]+" - " : "")+((col3[i]!=="") ? col3[i]+" - " : "")+((col4[i]!=="") ? col4[i]+" - " : "")+((col5[i]!=="") ? col5[i]+" - " : "")+((col6[i]!=="") ? col6[i]+" - " : "")+((col7[i]!=="") ? col7[i]+" - " : "")+((col8[i]!=="") ? col8[i]+" - " : "")+((col9[i]!=="") ? col9[i]+" - " : "")+((col10[i]!=="") ? col10[i]+" - " : "")
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
//                    for(var i=0; i<noq;i++)
//                    {
//                        test[i].answer_term.text = "";
//                    }
                    your_score_word.text = "";
                    your_score_percent.text = "";

                    button_check_answer.begin_color = "#337cdc"
                    button_check_answer.stop_color = "#2371d9"
                    mouseCheckAnswer.enabled = true

                    test_form.visible = false
                    synonym_form.visible = true
//                    reset()
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
                        var component = Qt.createComponent("gen_test_synonym.qml");

                        for(var i=0;i<noq;i++)
                        {
                            test[i] = component.createObject(rec_test_scroll,{
                                                                 "genId":i,
                                                                 "width":rec_test_scroll.width,
                                                                 "anchors.top": rec_test_scroll.top,
                                                                 "anchors.topMargin": test_height,
                                                                 "order":i+1,
                                                                 "dn":col1[i],
                                                                 "hold1":col2[i][0],
                                                                 "hold2":col3[i][0],
                                                                 "hold3":col4[i][0],
                                                                 "hold4":col5[i][0],
                                                                 "hold5":col6[i][0],
                                                                 "hold6":col7[i][0],
                                                                 "hold7":col8[i][0],
                                                                 "hold8":col9[i][0],
                                                                 "hold9":col10[i][0]

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
}


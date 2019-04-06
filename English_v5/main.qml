import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtQuick 2.3
import QtQuick.Window 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.LocalStorage 2.0

Window {
    id: root_window
    visible: true
    x: 0
    y: 0
    width: Screen.width
    height: Screen.height
    title: "Login"
    color: "#f5f2ee"

    Image {
        id: background_image
        width: root_window.width
        height: root_window.height
        source: "../English_v4/resource/login/background3.jpg"

    }


    property int order_form: 0

    // Variable for unit_form
    property int margin: 10
    property int nou_vocab: 19
    property int nou_synonym: 9
    property int nou_grammar: 10
    property int lesson_width: root_window.width - 320 - 30

    property int noq: 0 // number of words
    property int type_u: 0
    property int lesson_u: 0
    property int privacy_type: 0

    property var term_list: []
    property var definition_list: []
    property var term_heli_list: []
    property var definition_heli_list: []
    //    property var temp: []
    property var ques_str: []
    property var ques_key: []
    property var col10: []
    property var col1: []
    property var col2: []
    property var col3: []
    property var col4: []
    property var col5: []
    property var col6: []
    property var col7: []
    property var col8: []
    property var col9: []


    property string code





    function generate_code()
    {
        var tmp;
        var tmp2;
        var tmp3;
        var day = new Date().toLocaleString(Qt.locale(),"dd");
        var month = new Date().toLocaleString(Qt.locale(),"MM");
        var year = new Date().toLocaleString(Qt.locale(),"yyyy");

        tmp3 = parseInt(day)*3 + parseInt(month) + parseInt(year);

        tmp = type_u;
        tmp2 = lesson_u;
        code = "" + tmp + tmp3 + tmp2;
        console.log(code);
    }



    Connections {
        target: perform

        onSyncData_synonym: {
            col1=c1;
            col2=c2;
            col3=c3;
            col4=c4;
            col5=c5;
            col6=c6;
            col7=c7;
            col8=c8;
            col9=c9;
            col10=c10;
        }


        onSyncData_scatter: {
            for (var z = 0; z < 20; z++)
            {
                ques_str[z] = str_pf[z];
                ques_key[z] = key_pf[z];
            }
        }

        onSyncData_heli: {
            for(var z=0;z<noq;z++)
            {
                term_heli_list[z] = term_heli[z];
                definition_heli_list[z] = definition_heli[z];
            }
        }

        onSyncData: {
            console.log("term[0]="+term[0]);
            console.log("noq="+noq);
            for (var z=0;z<noq;z++)
            {
                term_list[z] = term[z];
                definition_list[z] = definition[z];
            }

        }

        onSendDataToQml: {
            type_u = type;
            lesson_u = lesson;
            noq = now;
            privacy_type = privacy;

            console.log("type:"+type_u + ", lesson:"+lesson_u + ", noq: " + noq + ", privacy:" + privacy_type);

        }

        onSendToQml: {
            console.log("Received in QML from C++: " + order);
            order_form = order;



            if(order_form == 1)
            {
                login_form.visible = true;
                unit_form.visible = false;
                entercode_form.visible = false;
            }
            else if (order_form == 2)
            {
                login_form.visible = false;
                unit_form.visible = true;
                entercode_form.visible = false;
            }
            else if (order_form == 3)
            {
                login_form.visible = false;
                unit_form.visible = false;
                entercode_form.visible = true;
            }
            else if (order_form == 4)
            {
                login_form.visible = false;
                unit_form.visible = false;
                entercode_form.visible = false;
                generate_code();
                myLoader1.source = "lesson_form.qml";
                myLoader1.source = "synonym_form.qml";
                myLoader1.source = "lesson_form.qml";
            }
            else if (order_form == 5)
            {
                login_form.visible = false;
                unit_form.visible = false;
                entercode_form.visible = false;
                generate_code();
                myLoader1.source = "synonym_form.qml";
                myLoader1.source = "lesson_form.qml";
                myLoader1.source = "synonym_form.qml";
            }
        }
    }

    Item {
        width: root_window.width
        height: root_window.height


        Loader {
            id: myLoader1
            //            source: "lesson_form.qml"

        }

        Connections {
            target: myLoader1.item
        }
    }
    Item {
        width: root_window.width
        height: root_window.height


        Loader {
            id: myLoader2
        }

        Connections {
            target: myLoader2.item
        }
    }




    Rectangle {
        id: login_form
        width: 500
        height: 220
        visible: false

        color: "#58ACFA"
        anchors.top: parent.top
        anchors.topMargin: (root_window.height - login_form.height)/2
        anchors.left: parent.left
        anchors.leftMargin: (root_window.width - login_form.width)/2

        border.color: "black"
        border.width: 1

        radius: 10



        Text {
            id: txt_memberlogin
            text: "member login"
            style: Text.Sunken
            font.bold: true
            textFormat: Text.AutoText
            anchors.leftMargin: 168
            anchors.top: login_form.top
            anchors.topMargin: 20
            anchors.left: login_form.left
            font.pointSize: 20
            font.family: "Tahoma"
            color: "white"

        }

        TextField {
            id: txt_login
            objectName: "txt_login"
            width: login_form.width - 16
            height: 32
            text: ""
            placeholderText: "Username"
            clip: false
            anchors.top: parent.top
            anchors.topMargin: 73
            anchors.left: login_form.left
            anchors.leftMargin: (login_form.width - txt_login.width)/2
            Layout.fillWidth: true



        }
        TextField {
            id: txt_password
            objectName: "txt_password"
            width: login_form.width - 16
            height: 32
            text: ""
            echoMode: 2
            placeholderText: "Password"
            anchors.top: parent.top
            anchors.topMargin: 125
            anchors.left: login_form.left
            anchors.leftMargin: (login_form.width - txt_password.width)/2
            Layout.fillWidth: true
        }

        Rectangle {
            id: rec_enter
            width: login_form.width - 16
            height: 32
            color: "#0c7daf"
            radius: 10
            anchors.top: parent.top
            anchors.topMargin: 177
            anchors.left: login_form.left
            anchors.leftMargin: (login_form.width - rec_enter.width)/2


            Text {
                id: txt_enter
                text: "Login"
                anchors.centerIn: rec_enter
            }

            MouseArea{
                id: loginmouseArea
                anchors.fill: rec_enter
                hoverEnabled: true

                onPressed: {
                    rec_enter.color = "gray"
                }

                onReleased: {
                    rec_enter.color = "#0c7daf"
                    perform.check_member(txt_login.text, txt_password.text)

                }
            }

        }

    }


    Rectangle {
        id: unit_form
        height: root_window.height
        width: root_window.width
        color: "#f5f2ee"
        visible: false

        Rectangle {
            id: rec_list
            width: 320
            height: unit_form.height
            anchors.left: unit_form.left
            anchors.leftMargin: 10
            //        anchors.top: unit_form.top
            //        anchors.topMargin: 30

            color: "#ffffff"
            //        radius: 20
            //        border.color: "Black"
            //        border.width: 3

            Rectangle {
                id: rec_vocab
                width: Math.round(rec_list.width*3.5/4)
                height: width/4
                anchors.left: rec_list.left
                anchors.leftMargin: (rec_list.width - rec_vocab.width)/2
                color: "#eff1f4"
                radius: 5
                anchors.top: rec_list.top
                anchors.topMargin: 10

                Image {
                    id: vocab_icon
                    source: "resource/unit/vocabulary_icon.gif"
                    height: rec_vocab.height - 20
                    fillMode: Image.PreserveAspectFit
                    anchors.left: rec_vocab.left
                    anchors.leftMargin: 5
                    anchors.top: rec_vocab.top
                    anchors.topMargin: 10
                }

                Text {
                    id: vocab_text
                    text: "Vocabulary"
                    color: "#4172a1"
                    font.bold: true
                    font.pixelSize: Math.round(rec_vocab.height/3)
                    anchors.left: rec_vocab.left
                    anchors.leftMargin: 108
                    anchors.top: rec_vocab.top
                    anchors.topMargin: (rec_vocab.height - vocab_text.height)/2
                }



                MouseArea{
                    id: vocabMouseArea
                    anchors.fill: rec_vocab
                    hoverEnabled: true

                    onClicked: {
                        rec_vocab.color = "#4172a1"
                        vocab_text.color = "white"

                        rec_synonym.color = "#eff1f4"
                        synosym_text.color = "#4172a1"

                        rec_grammar.color = "#eff1f4"
                        grammar_text.color = "#4172a1"

                        rec_lesson_vocab.visible = true
                        rec_lesson_grammar.visible = false
                        rec_lesson_synonym.visible = false
                    }


                }
            }

            Rectangle {
                id: rec_synonym
                width: rec_vocab.width
                height: rec_vocab.height
                anchors.left: rec_list.left
                anchors.leftMargin: (rec_list.width - rec_synonym.width)/2
                color: "#eff1f4"
                radius: 5
                anchors.top: rec_vocab.bottom
                anchors.topMargin: 10

                Image {
                    id: synonym_icon
                    source: "resource/unit/synonym_icon.png"
                    height: rec_synonym.height - 20
                    fillMode: Image.PreserveAspectFit
                    anchors.left: rec_synonym.left
                    anchors.leftMargin: 5
                    anchors.top: rec_synonym.top
                    anchors.topMargin: 10
                }

                Text {
                    id: synosym_text
                    text: "Synonym"


                    color: "#4172a1"
                    font.bold: true
                    font.pixelSize: Math.round(rec_synonym.height/3)

                    anchors.left: parent.left
                    anchors.leftMargin: 108
                    anchors.top: rec_synonym.top
                    anchors.topMargin: (rec_synonym.height - synosym_text.height)/2

                }

                MouseArea{
                    id: synonymMouseArea
                    anchors.fill: rec_synonym
                    hoverEnabled: true


                    onClicked: {
                        rec_synonym.color = "#4172a1"
                        synosym_text.color = "white"

                        rec_vocab.color = "#eff1f4"
                        vocab_text.color = "#4172a1"

                        rec_grammar.color = "#eff1f4"
                        grammar_text.color = "#4172a1"

                        rec_lesson_synonym.visible = true
                        rec_lesson_grammar.visible = false
                        rec_lesson_vocab.visible = false
                    }


                }
            }

            Rectangle {
                id: rec_grammar
                width: rec_vocab.width
                height: rec_vocab.height
                anchors.left: rec_list.left
                anchors.leftMargin: (rec_list.width - rec_grammar.width)/2

                color: "#eff1f4"
                radius: 5
                anchors.top: rec_synonym.bottom
                anchors.topMargin: 10


                Text {
                    id: grammar_text
                    text: "Grammar Structure"
                    color: "#4172a1"
                    font.bold: true
                    font.pixelSize: Math.round(rec_grammar.height/3)
                    anchors.centerIn: rec_grammar
                }

                MouseArea{
                    id: grammarMouseArea
                    anchors.fill: rec_grammar
                    hoverEnabled: true

                    onClicked: {
                        rec_grammar.color = "#4172a1"
                        grammar_text.color = "white"

                        rec_synonym.color = "#eff1f4"
                        synosym_text.color = "#4172a1"

                        rec_vocab.color = "#eff1f4"
                        vocab_text.color = "#4172a1"

                        rec_lesson_grammar.visible = true
                        rec_lesson_vocab.visible = false
                        rec_lesson_synonym.visible = false
                    }

                }
            }


            Rectangle{
                id: rec_manage
                width: Math.round(rec_list.width*3.5/4)
                height: width/6
                anchors.left: rec_list.left
                anchors.leftMargin: (rec_list.width - rec_manage.width)/2
                radius: 5
                anchors.bottom: rec_list.bottom
                anchors.bottomMargin: 10

                property color begin_color: "#337cdc"
                property color stop_color: "#2371d9"

                gradient: Gradient {
                    GradientStop { position: 0.0; color: rec_manage.begin_color }
                    GradientStop { position: 1.0; color: rec_manage.stop_color }
                }

                Text {
                    id: manage_text
                    text: "Manage Student"
                    color: "white"
                    font.bold: true
                    font.pixelSize: Math.round(rec_manage.height/3)
                    anchors.centerIn: rec_manage
                }

                MouseArea{
                    id: manageMouseArea
                    anchors.fill: rec_manage
                    hoverEnabled: true

                    onPressed: {
                        rec_manage.begin_color = "#3584eb"
                        rec_manage.stop_color = "#267bea"
                    }

                    onReleased: {
                        rec_manage.begin_color = "#337cdc"
                        rec_manage.stop_color = "#2371d9"
                    }

                    onClicked: {
                        perform.check_choose_lesson(4,0);
                    }
                }

            }


        }

        Rectangle {
            id: rec_lesson_vocab
            width: lesson_width
            height: unit_form.height
            anchors.left: rec_list.right
            anchors.leftMargin: margin
            color: "white"
            visible: false

            property int margin_top_lesson: 40
            property int margin_left_lesson: 40
            property int width_lesson: 100
            property int height_lesson: 100



            function buttonClicked(buttonId)
            {
                console.debug("clicked button:"+buttonId);
                perform.check_choose_lesson(1, buttonId, 1);
            }

            function createSomeButtons()
            {
                //Function creates 4 buttons
                var component = Qt.createComponent("lesson_button.qml");
                var j = 0;
                var k = 0;

                for(var i=0;i<nou_vocab;i++)
                {
                    var button = component.createObject(rec_lesson_vocab,{
                                                            "buttonId":i+1,
                                                            "width": width_lesson,
                                                            "height": height_lesson,
                                                            "unit": "Unit " + Math.round(i+1),
                                                            "anchors.left": rec_lesson_vocab.left,
                                                            "anchors.top": rec_lesson_vocab.top,
                                                            "anchors.leftMargin": margin_left_lesson + j*(margin_left_lesson+width_lesson),
                                                            "anchors.topMargin": margin_top_lesson + k*(margin_top_lesson+height_lesson)

                                                        });
                    //Connect the clicked signal of the newly created button
                    //to the event handler buttonClicked.
                    button.clicked.connect(buttonClicked)

                    if(((j+2)*(margin_left_lesson+width_lesson))<rec_lesson_vocab.width)
                    {
                        j++;
                    }
                    else
                    {
                        j=0;
                        k++;
                    }


                }
            }
            Component.onCompleted: {
                createSomeButtons();
            }

        }

        Rectangle {
            id: rec_lesson_synonym

            width: lesson_width
            height: unit_form.height
            anchors.left: rec_list.right
            anchors.leftMargin: margin
            color: "white"

            visible: false

            property int margin_top_lesson: 40
            property int margin_left_lesson: 40
            property int width_lesson: 100
            property int height_lesson: 100



            function buttonClicked(buttonId)
            {
                console.debug(buttonId);
                perform.check_choose_lesson(2, buttonId, 1);
            }

            function createSomeButtons()
            {
                //Function creates 4 buttons
                var component = Qt.createComponent("lesson_button.qml");
                var j = 0;
                var k = 0;

                for(var i=0;i<nou_synonym;i++)
                {
                    var button = component.createObject(rec_lesson_synonym,{
                                                            "buttonId":i+1,
                                                            "width": width_lesson,
                                                            "height": height_lesson,
                                                            "unit": "Unit " + Math.round(i+1),
                                                            "anchors.left": rec_lesson_synonym.left,
                                                            "anchors.top": rec_lesson_synonym.top,
                                                            "anchors.leftMargin": margin_left_lesson + j*(margin_left_lesson+width_lesson),
                                                            "anchors.topMargin": margin_top_lesson + k*(margin_top_lesson+height_lesson)
                                                        });
                    //Connect the clicked signal of the newly created button
                    //to the event handler buttonClicked.
                    button.clicked.connect(buttonClicked)


                    if((j+2)*(margin_left_lesson+width_lesson)<rec_lesson_synonym.width)
                    {
                        j++;
                    }
                    else
                    {
                        j=0;
                        k++;
                    }


                }
            }
            Component.onCompleted: {
                createSomeButtons();
            }


        }

        Rectangle {
            id: rec_lesson_grammar

            width: lesson_width
            height: unit_form.height
            anchors.left: rec_list.right
            anchors.leftMargin: margin
            color: "white"

            visible: false

            property int margin_top_lesson: 40
            property int margin_left_lesson: 40
            property int width_lesson: 100
            property int height_lesson: 100



            function buttonClicked(buttonId)
            {
                console.debug(buttonId);
                perform.check_choose_lesson(3, buttonId, 1);
            }

            function createSomeButtons()
            {
                //Function creates 4 buttons
                var component = Qt.createComponent("lesson_button.qml");
                var j = 0;
                var k = 0;

                for(var i=0;i<nou_grammar;i++)
                {
                    var button = component.createObject(rec_lesson_grammar,{
                                                            "buttonId":i+1,
                                                            "width": width_lesson,
                                                            "height": height_lesson,
                                                            "unit": "Unit " + Math.round(i+1),
                                                            "anchors.left": rec_lesson_grammar.left,
                                                            "anchors.top": rec_lesson_grammar.top,
                                                            "anchors.leftMargin": margin_left_lesson + j*(margin_left_lesson+width_lesson),
                                                            "anchors.topMargin": margin_top_lesson + k*(margin_top_lesson+height_lesson)
                                                        });
                    //Connect the clicked signal of the newly created button
                    //to the event handler buttonClicked.
                    button.clicked.connect(buttonClicked)

                    if((j+2)*(margin_left_lesson+width_lesson)<rec_lesson_grammar.width)
                    {
                        j++;
                    }
                    else
                    {
                        j=0;
                        k++;
                    }


                }
            }
            Component.onCompleted: {
                createSomeButtons();
            }
        }


    }

    Rectangle {
        id: entercode_form
        width: 500
        height: 220
        visible: false

        color: "#58ACFA"
        anchors.top: parent.top
        anchors.topMargin: (root_window.height - entercode_form.height)/2
        anchors.left: parent.left
        anchors.leftMargin: (root_window.width - entercode_form.width)/2

        border.color: "black"
        border.width: 1

        radius: 10




        Text {
            text: "Enter your code today: "
            style: Text.Normal
            font.bold: true
            textFormat: Text.AutoText
            anchors.leftMargin: 8
            anchors.top: entercode_form.top
            anchors.topMargin: 38
            anchors.left: entercode_form.left
            font.pointSize: 15
            font.family: "Tahoma"
            color: "white"

        }

        TextField {
            id: txt_code
            objectName: "txt_login"
            width: entercode_form.width - 16
            height: 32
            text: ""
            anchors.leftMargin: 8
            placeholderText: "eg: 123456"
            clip: false
            anchors.top: parent.top
            anchors.topMargin: 82
            anchors.left: entercode_form.left
            Layout.fillWidth: true



        }
        Rectangle {
            id: rec_entercode
            width: entercode_form.width - 16
            height: 32
            color: "#0c7daf"
            radius: 10
            anchors.leftMargin: 8
            anchors.top: parent.top
            anchors.topMargin: 130
            anchors.left: entercode_form.left


            Text {
                text: "Go to lesson"
                anchors.centerIn: rec_entercode
            }

            MouseArea{
                id: mouseArea
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                anchors.fill: rec_entercode
                hoverEnabled: true

                onPressed: {
                    rec_entercode.color = "gray"
                }

                onReleased: {
                    rec_entercode.color = "#0c7daf"
                }
                onClicked: {
                    var check_time = 0;
                    var check_unit = 0;
                    var check_lesson = 0;
                    var get_time = ""
                    var get_unit = ""
                    var get_lesson = ""

                    for(var i=0;i<4;i++)
                    {
                        get_time = get_time + txt_code.text[i+1]
                    }
                    for(var j=0;j<1;j++)
                    {
                        get_unit = "" + txt_code.text[j]
                    }
                    for(var k=5;k<txt_code.length;k++)
                    {
                        get_lesson = "" + get_lesson + txt_code.text[k]
                    }

                    check_time = parseInt(get_time);
                    check_lesson = parseInt(get_lesson);
                    check_unit = parseInt(get_unit);

                    var tmp;
                    var tmp2;
                    var tmp3;
                    var day = new Date().toLocaleString(Qt.locale(),"dd");
                    var month = new Date().toLocaleString(Qt.locale(),"MM");
                    var year = new Date().toLocaleString(Qt.locale(),"yyyy");

                    tmp3 = parseInt(day)*3 + parseInt(month) + parseInt(year);

                    if(check_time === tmp3)
                    {
                        console.log("passed");
                        perform.check_lesson_student(check_unit,check_lesson)
                    }
                    else
                    {
                        console.log("false");
                        txt_code.text = "";
                    }


                }
            }

        }

    }

}

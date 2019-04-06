import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtQuick 2.3
import QtQuick.Window 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.LocalStorage 2.0
import QtMultimedia 5.5

Rectangle {
    id: gen_test
    width: 500
    height: definition.height + 10*answer_term1.height + 10*10 + 20
    border.color: "#ffffff"

    property string order: "1"
    property string dn: "Definition"
    property string tm: "Term"
    property alias answer_term1: ans1
    property alias answer_term2: ans2
    property alias answer_term3: ans3
    property alias answer_term4: ans4
    property alias answer_term5: ans5
    property alias answer_term6: ans6
    property alias answer_term7: ans7
    property alias answer_term8: ans8
    property alias answer_term9: ans9
    property string hold1: ""+1
    property string hold2: ""+2
    property string hold3: ""+3
    property string hold4: ""+4
    property string hold5: ""+5
    property string hold6: ""+6
    property string hold7: ""+7
    property string hold8: ""+8
    property string hold9: ""+9

    property string genId;

    signal send_Id(string genId)


    Text {
        id: stt
        text: order + "."
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
    }

    Text {
        id: definition
        text: dn
        anchors.top: stt.top
        anchors.topMargin: 0
        anchors.left: stt.right
        anchors.leftMargin: 10
    }

    TextField {
        id: ans1
        width: 400
        placeholderText: hold1
        anchors.left: stt.right
        anchors.leftMargin: 10
        anchors.top: definition.bottom
        anchors.topMargin: 10
    }

    TextField {
        id: ans2
        width: 400
        placeholderText: hold2
        anchors.left: stt.right
        anchors.leftMargin: 10
        anchors.top: ans1.bottom
        anchors.topMargin: 10
    }
    TextField {
        id: ans3
        width: 400
        placeholderText: hold3
        anchors.left: stt.right
        anchors.leftMargin: 10
        anchors.top: ans2.bottom
        anchors.topMargin: 10
    }
    TextField {
        id: ans4
        width: 400
        placeholderText: hold4
        anchors.left: stt.right
        anchors.leftMargin: 10
        anchors.top: ans3.bottom
        anchors.topMargin: 10
    }
    TextField {
        id: ans5
        width: 400
        placeholderText: hold5
        anchors.left: stt.right
        anchors.leftMargin: 10
        anchors.top: ans4.bottom
        anchors.topMargin: 10
    }
    TextField {
        id: ans6
        width: 400
        placeholderText: hold6
        anchors.left: stt.right
        anchors.leftMargin: 10
        anchors.top: ans5.bottom
        anchors.topMargin: 10
    }
    TextField {
        id: ans7
        width: 400
        placeholderText: hold7
        anchors.left: stt.right
        anchors.leftMargin: 10
        anchors.top: ans6.bottom
        anchors.topMargin: 10
    }
    TextField {
        id: ans8
        width: 400
        placeholderText: hold8
        anchors.left: stt.right
        anchors.leftMargin: 10
        anchors.top: ans7.bottom
        anchors.topMargin: 10
    }
    TextField {
        id: ans9
        width: 400
        placeholderText: hold9
        anchors.left: stt.right
        anchors.leftMargin: 10
        anchors.top: ans8.bottom
        anchors.topMargin: 10
    }

}


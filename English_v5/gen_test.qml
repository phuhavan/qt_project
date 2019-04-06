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
    height: definition.height + answer_term.height + 10 + 40
    border.color: "#ffffff"

    property string order: "1"
    property string dn: "Definition"
    property string tm: "Term"
    property alias answer_term: ans
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
        id: ans
        width: 400
        anchors.left: stt.right
        anchors.leftMargin: 10
        anchors.top: definition.bottom
        anchors.topMargin: 10
    }

}


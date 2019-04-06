import QtQuick 2.0

Rectangle {

    id: synonym
    width: 500
    height: term.height + 40
    border.color: "#dbdbdb"

    property string word: "term"



    Text {
        id: term
        text: word
        width: synonym.width
        font.pointSize: 15
        anchors.top:synonym.top
        anchors.topMargin: (synonym.height - term.height)/2
        anchors.left: synonym.left
        anchors.leftMargin: 20
        wrapMode: Text.WordWrap

    }

}


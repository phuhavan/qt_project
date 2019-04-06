import QtQuick 2.0

Rectangle {

    id: vocab
    width: 500
    height: definition.height + 40
    border.color: "#dbdbdb"

    property string tm: "term"
    property string dn: "definition"



    Text {
        id: term
        text: tm
        font.pointSize: 15
        anchors.top:vocab.top
        anchors.topMargin: (vocab.height - term.height)/2
        anchors.left: vocab.left
        anchors.leftMargin: 20

    }

    Text {
        id: definition
        text: dn
        width: vocab.width - vocab.width/4 - 20
        font.pointSize: 15
        anchors.top:vocab.top
        anchors.topMargin: 20
        anchors.left: vocab.left
        anchors.leftMargin: vocab.width/4
        wrapMode: Text.WordWrap
    }
}


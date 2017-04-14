import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    id: root
    visible: true
    width: 500; height: 500
    flags: Qt.FramelessWindowHint

    FunnyExitBtn {
        id: closeBtn
        text: "X"
        width: 50; height: 50
        x: 425; y: 25

        onClicked: root.close()

    }

    GameField{id: gameField; anchors.centerIn: parent}



    Grid{
        width: 300; height: 100
        x:50; y: 425
        columns: 3
        spacing: 50
        anchors.margins: 50
        FunnyBtn {id: newGame; text:"New"; onClicked: {gameField.newGame()}}
        FunnyBtn {id: saveGame; text:"Save"}
        FunnyBtn {id: loadGame; text:"Load"}
    }
}

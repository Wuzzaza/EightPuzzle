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



    Grid{
        width: 300; height: 300
        id: grid
        anchors.centerIn: parent
        anchors.margins: 0
        columns: 3

        Rectangle{
            property int currentRow: 0
            property int currentColumn: 0
            id: emptySpace
            color: transparent
            width: 100; height: 100

        }

        Repeater{

            model: 8
            Button{text: index + 1
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1)
            currentRow: (index + 1) % 3
            currentColumn: (index + 1) / 3
            onClicked: {

                if ((emptySpace.currentColumn == currentColumn && emptySpace.currentRow == currentRow + 1)
                  ||(emptySpace.currentColumn == currentColumn && emptySpace.currentRow == currentRow - 1)
                  ||(emptySpace.currentRow == currentRow && emptySpace.currentColumn == currentColumn + 1)
                  ||(emptySpace.currentRow == currentRow && emptySpace.currentColumn == currentColumn - 1))
                    {
                    var temp = currentColumn
                    currentColumn = emptySpace.currentColumn
                    emptySpace.currentColumn = temp

                    temp = currentRow
                    currentRow = emptySpace.currentRow
                    emptySpace.currentRow = temp

                    temp = x
                    x = emptySpace.x
                    emptySpace.x = temp

                    temp = y
                    y = emptySpace.y
                    emptySpace.y = temp
                    }
                }

           }

        }
    }

    Grid{
        width: 300; height: 100
        x:50; y: 425
        columns: 3
        spacing: 50
        anchors.margins: 50
        FunnyBtn {id: newGame; text:"New"}
        FunnyBtn {id: saveGame; text:"Save"}
        FunnyBtn {id: loadGame; text:"Load"}
    }
}

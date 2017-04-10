import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    id: root
    visible: true
    width: 400; height: 400

    Grid{

        id: grid
        anchors.fill: parent
        anchors.margins: 50
        columns: 3
        spacing: 3

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

}

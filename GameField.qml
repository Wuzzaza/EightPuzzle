import QtQuick 2.0

Item {

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
            id: gameBtns
            model: 8
            Button{text: ""
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



    Component.onCompleted: shuffleBtns();
    function newGame(){
        emptySpace.x = 0;
        emptySpace.y = 0;
        emptySpace.currentColumn = 0;
        emptySpace.currentRow = 0;

        for (var i = 0; i < 8; i++){
            gameBtns.itemAt(i).x =  roundToInt((i + 1)% 3)* 100;
            gameBtns.itemAt(i).y =  roundToInt((i + 1)/ 3)* 100;
            gameBtns.itemAt(i).currentRow = ((i + 1) % 3);
            gameBtns.itemAt(i).currentColumn = ((i + 1) / 3);

        }
        shuffleBtns();
    }

    function shuffleBtns(){
        for (var i = 0; i < 8; i++) gameBtns.itemAt(i).text = "";
        var btnIndex = 0;
        for (var i = 1; i < 9; i++){
            do{
                btnIndex = Math.random()*8;
            }while (gameBtns.itemAt(btnIndex).text !=="");
            gameBtns.itemAt(btnIndex).text = i;

        }
    }

    function roundToInt(x){
        return x - x%1;
    }
}

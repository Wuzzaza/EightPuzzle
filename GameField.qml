import QtQuick 2.0



Item {
    id: root
    property var saveGameData: []


    Grid{


        width: 300; height: 300
        id: grid
        anchors.centerIn: parent
        anchors.margins: 0
        columns: 3

        Rectangle{
            property var currentRow: 0
            property var currentColumn: 0
            id: emptySpace
            color: transparent
            width: 100; height: 100

        }

        Repeater{
            id: gameBtns
            model: 8
            Button{text: ""
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1)
            currentRow: roundToInt((index + 1) % 3)
            currentColumn: roundToInt((index + 1) / 3)
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
        emptySpace.currentRow = 0;
        emptySpace.currentColumn = 0;


        for (var i = 0; i < 8; i++){
            gameBtns.itemAt(i).x =  roundToInt((i + 1)% 3)* 100;
            gameBtns.itemAt(i).y =  roundToInt((i + 1)/ 3)* 100;
            gameBtns.itemAt(i).currentRow = roundToInt((i + 1) % 3);
            gameBtns.itemAt(i).currentColumn = roundToInt((i + 1) / 3);
            gameBtns.itemAt(i).color = Qt.rgba(Math.random(),Math.random(),Math.random(),1)


        }
        shuffleBtns();
    }

    function saveGame(){
        root.saveGameData = [];
        root.saveGameData.push({x: emptySpace.x,
                                y: emptySpace.y,
                                currentRow: emptySpace.currentRow,
                                currentColumn: emptySpace.currentColumn});

        for (var i = 0; i < 8; i++){
            root.saveGameData.push({x: gameBtns.itemAt(i).x,
                                    y: gameBtns.itemAt(i).y,
                                    currentRow: gameBtns.itemAt(i).currentRow,
                                    currentColumn: gameBtns.itemAt(i).currentColumn,
                                    str: gameBtns.itemAt(i).text,
                                    color: gameBtns.itemAt(i).color});
            console.log(root.saveGameData[i + 1].str);
        }

        gameSaver.saveGame();
    }

    function loadGame(){

        gameSaver.loadGame();


        emptySpace.x = root.saveGameData[0].x;
        emptySpace.y = root.saveGameData[0].y;

        emptySpace.currentRow = root.saveGameData[0].currentRow;
        emptySpace.currentColumn = root.saveGameData[0].currentColumn;


        for (var i = 0; i < 8; i++){

            gameBtns.itemAt(i).x = root.saveGameData[1 + i].x;
            gameBtns.itemAt(i).y = root.saveGameData[1 + i].y;

            gameBtns.itemAt(i).currentRow = root.saveGameData[1 + i].currentRow;
            gameBtns.itemAt(i).currentColumn = root.saveGameData[1 + i].currentColumn;
            gameBtns.itemAt(i).text = root.saveGameData[1 + i].str;
            gameBtns.itemAt(i).color = root.saveGameData[1 + i].color;
        }

    }

    function shuffleBtns(){
        for (var i = 0; i < 8; i++) gameBtns.itemAt(i).text = "";
        var btnIndex = 0;
        for (var i = 1; i < 9; i++){
            do{
                btnIndex = roundToInt(Math.random()*8);
            }while (gameBtns.itemAt(btnIndex).text !=="");
            gameBtns.itemAt(btnIndex).text = i;

        }
    }

    function roundToInt(x){
        return x - x%1;
    }
}

import QtQuick 2.0



Item {
    id: root

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
        var arr = [];
        arr.push(emptySpace.x);
        arr.push(emptySpace.y);
        arr.push(emptySpace.currentRow);
        arr.push(emptySpace.currentColumn);


        for (var i = 0; i < 8; i++){
            arr.push(gameBtns.itemAt(i).x);
            arr.push(gameBtns.itemAt(i).y);
            arr.push(gameBtns.itemAt(i).currentRow);
            arr.push(gameBtns.itemAt(i).currentColumn);
            arr.push(gameBtns.itemAt(i).text);
        }

        gameSaver.saveGame(arr);
    }

    function loadGame(){

        var arr = gameSaver.loadGame();



          emptySpace.x = arr.shift();
          emptySpace.y = arr.shift();

          emptySpace.currentRow = arr.shift();
          emptySpace.currentColumn = arr.shift();


          for (var i = 0; i < 8; i++){

              gameBtns.itemAt(i).x = arr.shift();;
              gameBtns.itemAt(i).y = arr.shift();

              gameBtns.itemAt(i).currentRow = arr.shift();
              gameBtns.itemAt(i).currentColumn = arr.shift();
              gameBtns.itemAt(i).text = arr.shift();
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

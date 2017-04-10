import QtQuick 2.0

Item {
    id:root
    width: 100; height: 100;
    property alias text: label.text
    property alias color: rect.color
    property int currentRow
    property int currentColumn
    signal clicked

    Behavior on x {NumberAnimation {duration: 200; easing.type: Easing.InOutCubic}}
    Behavior on y {NumberAnimation {duration: 200; easing.type: Easing.InOutCubic}}

    Rectangle{
        id: rect
        anchors.fill: parent
        color: "#9999ff"
        smooth: true; radius: 5
        border.color: "#ffffff"

        MouseArea{
            anchors.fill: parent
            onClicked: {
                root.clicked()
            }
        }


        Text {
            id: label

            anchors.centerIn: parent

            color: "#ffffff"
            text: qsTr("0")
            font.family: "Arial Black"
            styleColor: "#000000"
            font.pointSize: 48
        }
    }

}

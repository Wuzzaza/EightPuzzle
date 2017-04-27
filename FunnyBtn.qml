import QtQuick 2.0

Item {
    id:root
    width: 100; height: 50;
    property alias text: label.text

    signal clicked
    signal entered

    Rectangle{
        id: rect
        anchors.fill: parent
        color: "#999999"
        smooth: true; radius: 10
        border.color: "#ffffff"

        states:[
            State {
                name: "Hovering"
                PropertyChanges {
                    target: rect
                    color: "#000000"
                }
            },
            State {
                name: ""
                PropertyChanges {
                    target: rect
                    color: "#999999"
                }
            },

            State {
                name: "Pressed"
                PropertyChanges {
                    target: rect
                    color: "#aaaaaa"
                }
            }
        ]

        transitions: [
            Transition {
                        from: ""; to: "Hovering"
                        ColorAnimation { duration: 500 }
                    },

            Transition {
                        from: ""; to: "Pressed"
                        ColorAnimation { duration: 5 }
                    },
            Transition {
                        from: "Pressed"; to: "Hovering"
                        ColorAnimation { duration: 5 }
                    }


        ]

        Text {
            id: label

            anchors.centerIn: parent

            color: "#ffffff"
            text: qsTr("0")
            font.family: "Arial Black"
            styleColor: "#000000"
            font.pointSize: 24
        }

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                rect.state = 'Hovering'
                root.entered()
            }

            onExited:{
                rect.state = ''

            }

            onPressed: { rect.state="Pressed" }
                    onReleased: {
                        if (containsMouse)
                          rect.state="Hovering";
                        else
                          rect.state="";
                    }

            onClicked: {
                root.clicked()
            }
        }
    }
}

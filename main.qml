import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")


    Rectangle {
        id: root2

        width: 320
        height: 480

        color: "black"

        Grid {
            id: redDestination

            anchors.left: parent.left
            anchors.top: parent.top;
            anchors.margins: 5
            width: 64*3
            height: 64*3
            opacity: 0.5
            columns: 3

            Repeater {
                model: 9;
                delegate: DropTile { colorKey: "red" }
            }
        }


        DragTile {
            colorKey: "red";
            anchors.right: parent.right;
            anchors.top: parent.top

        }

    }

}

import QtQuick 2.0

Item {
    id: root

    property string colorKey : "red"
 //   property int modelData

    property string nbToDisplay

    width: 64; height: 64

    MouseArea {
      id: mouseArea

      width: 64; height: 64
      anchors.centerIn: parent

      drag.target: tile

      onReleased: {
          parent = tile.Drag.target !== null ? tile.Drag.target : root
          console.log("id of the item to drag: " + tile.Drag.target)
      }


      Rectangle {
          id: tile

          width: 64
          height: 64

          anchors.verticalCenter: parent.verticalCenter
          anchors.horizontalCenter: parent.horizontalCenter

          color: root.colorKey

          Drag.keys: [ root.colorKey ]
          Drag.active: mouseArea.drag.active
          Drag.hotSpot.x: 32
          Drag.hotSpot.y: 32

          Text {
              anchors.fill: parent
              color: "white"
              font.pixelSize: 48
              text: "1"
              horizontalAlignment:Text.AlignHCenter
              verticalAlignment: Text.AlignVCenter
          }

          states: State {
              when: mouseArea.drag.active
              ParentChange { target: tile; parent: root }
              AnchorChanges { target: tile; anchors.verticalCenter: undefined; anchors.horizontalCenter: undefined }
          }

      }
    }
}

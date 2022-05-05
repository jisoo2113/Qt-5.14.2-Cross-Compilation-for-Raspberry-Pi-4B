import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.3

Item {
    id : account_window
    width: 533
    height: 320


    Rectangle {
        id : account_window_rec
        width: parent.width
        height: parent.height
        border.width: 3
        border.color: "black"

        visible: true
        Row {
            spacing: 50
            anchors.centerIn: account_window_rec
            Rectangle {
                id :rec1
                width: 100
                height: 100
                Text {
                    id: rec1_text
                    text: qsTr("button1")
                }

            }
            Rectangle {
                id :rec2
                width: 100
                height: 100
                Text {
                    id: rec2_text
                    text: qsTr("button2")
                }

            }
            Rectangle {
                id :rec3
                width: 100
                height: 100
                Text {
                    id: rec3_text
                    text: qsTr("button3")
                }
            }
        }
    }

}

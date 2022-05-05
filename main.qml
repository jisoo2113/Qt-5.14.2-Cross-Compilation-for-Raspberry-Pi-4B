import QtQuick 2.14
//import QtQml 2.0
import QtQuick.Window 2.14
import QtQuick.Controls 2.3
import QtQuick.VirtualKeyboard 2.14
//import init_obj 1.0
import "/home/workspace/RaspberryQt/Accountpage.qml" as Accountpage


ApplicationWindow {
    id: window
    visible: true
    visibility: "FullScreen"
    //width: Screen.width/1.5
    //height: Screen.height/1.5
    title: qsTr("Sorter_UI")
    flags : Qt.Window | Qt.FramelessWindowHint
    MouseArea {
        anchors.fill: parent
        enabled: false
        cursorShape: Qt.BlankCursor
    }

    //testslot {
    //    id : cpp_model
    //}
/*
    Accountpage {

        id : account_window
        width: parent.width/2
        height: parent.height/2
        visible: false

    }
*/
    SwipeView{
        id : swipeview
        anchors.fill: parent
        currentIndex: 0


    }

    Rectangle {
        id :menu1
        x:0
        y:0
        z:1
        width: 50
        height: parent.height/10
        color: "#CCCCCC"
        Image {
            id: background_image
            width: 40
            height: 40
            source: "/image/menu3.png"
            MouseArea {
               id :control1
               anchors.fill: background_image
               onClicked: {
                   if (account_window.visible) {
                        account_window.visible = false
                   } else {
                        account_window.visible = true
                   }

               }
            }
        }
    }



    Rectangle {
        id :rec11
        x : 300
        y : 200
        width: 100
        height: 40
        color: "green"
        Text {
            id: txt1
            text:  "??"
            font.pixelSize: 40
            font.bold: true
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                signal_cpp.generator();
                console.log(ct.color);
                if (ct.color != "#ff0000"){
                    ct.color = "#ff0000"    //red
                    txt1.text = "Abc"
                } else {
                    ct.color = "#CCCCCC"    //gray
                    txt1.text = "Dfg"
                }


            }
        }

    }

    Rectangle {
        id : ct
        x : 0
        y : 0
        z : 0
        width: parent.width
        height: parent.height/10
        color: "#CCCCCC"


        Text {
            id: timer_text
            x :0
            y :0
            text: Qt.formatDate(new Date(),"yyyy.MM.dd(ddd)  ") + Qt.formatTime(new Date(),"hh:mm:ss")
            anchors.centerIn: ct
            font.pixelSize: 25
            font.bold: true
        }
        Timer {
            id : timer
            interval: 1000
            repeat: true
            running: true

            onTriggered: {
                timer_text.text = Qt.formatDate(new Date(),"yyyy.MM.dd(ddd)  ") + Qt.formatTime(new Date(),"hh:mm:ss")
            }
        }
    }

    Rectangle {
        id : textbox1
        width: window.width/2
        height: 30
        border.color: "black"
        y : window.height/2
        Text {
            id: size_str
            text: qsTr(" width : "+window.width+"  height : "+window.height)
            font.pixelSize: 20
        }
    }
    Rectangle {
        id : lineedit_box1
        x : window.width/10
        y : window.height/3
        width: 200
        height: 30
        border.color: "red"
        border.width: 2
        radius: 5
        color: "yellow"
        MouseArea {
            anchors.fill: t_input
            onClicked: {
                t_input.selectAll()
            }
        }

        TextInput {
            id : t_input
            text: ""
            cursorVisible: true

            TextArea {
                placeholderText: "Enter text here..."
            }

        }


    }



    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}

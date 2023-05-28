import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12


Window {
    visible: true
    minimumWidth: 400
    minimumHeight: 500
    title: qsTr("Calculate Triangle Square")
    color: "#e5ecef"

    Rectangle{
        id: frame
        color: "#F6F6F6"
        anchors.centerIn: parent
        radius: 5
        width: 200
        height: 270


        GridLayout {

            id: main
            anchors.fill: parent
            anchors.leftMargin: 30
            anchors.rightMargin: 30
            anchors.topMargin: 30
            anchors.bottomMargin: 30
            columnSpacing: 10
            rowSpacing: 5
            rows: 6
            columns: 3

            Label {
                Layout.row: 0
                Layout.column: 1
                text: qsTr("x")
                Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
            }

            Label {
                Layout.row: 0
                Layout.column: 2
                text: qsTr("y")
                Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
            }

            Label {
                Layout.row: 1
                Layout.column: 0
                id: label_a
                text: qsTr("A  : ")
            }
            TextField {
                Layout.row: 1
                Layout.column: 1
                Layout.preferredWidth: 50
                Layout.alignment: horizontalCenter
                background: Rectangle {width:50 ;id: input_ax_rect; color: parent.down ? "#DCDCDC" : (parent.hovered ? "#DFDFDF" : "#DCDCDC");}
                id: input_a_x
                text: qsTr("")
                horizontalAlignment: Text.AlignHCenter
                clip: false
                font.pixelSize: 14
                validator: IntValidator {}
            }
            TextField {
                Layout.row: 1
                Layout.column: 2
                Layout.preferredWidth: 50
                Layout.alignment: horizontalCenter
                background: Rectangle {width:50 ;id: input_ay_rect; color: parent.down ? "#DCDCDC" : (parent.hovered ? "#DFDFDF" : "#DCDCDC") }
                id: input_a_y
                text: qsTr("")
                horizontalAlignment: Text.AlignHCenter
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                font.pixelSize: 14
                validator: IntValidator {}
            }


            Label {
                Layout.row: 2
                Layout.column: 0
                id: label_b
                text: qsTr("B  : ")
            }
            TextField {
                Layout.row: 2
                Layout.column: 1
                Layout.preferredWidth: 50
                Layout.alignment: horizontalCenter
                background: Rectangle {width:50 ;id: input_bx_rect; color: parent.down ? "#DCDCDC" : (parent.hovered ? "#DFDFDF" : "#DCDCDC") }
                id: input_b_x
                text: qsTr("")
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                validator: IntValidator {}
            }
            TextField {
                Layout.row: 2
                Layout.column: 2
                Layout.preferredWidth: 50
                Layout.alignment: horizontalCenter
                background: Rectangle {width:50 ;id: input_by_rect; color: parent.down ? "#DCDCDC" : (parent.hovered ? "#DFDFDF" : "#DCDCDC") }
                id: input_b_y
                text: qsTr("")
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                validator: IntValidator { bottom: 0}
            }

            Label {
                Layout.row: 3
                Layout.column: 0
                id: label_c
                text: qsTr("C  : ")
            }
            TextField {
                Layout.row: 3
                Layout.column: 1
                Layout.preferredWidth: 50
                Layout.alignment: horizontalCenter
                background: Rectangle {width:50 ;id: input_cx_rect; color: parent.down ? "#DCDCDC" : (parent.hovered ? "#DFDFDF" : "#DCDCDC") }
                id: input_c_x
                text: qsTr("")
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                validator: IntValidator {}
            }
            TextField {
                Layout.row: 3
                Layout.column: 2
                Layout.preferredWidth: 50
                Layout.alignment: horizontalCenter
                background: Rectangle {width:50 ;id: input_cy_rect; color: parent.down ? "#DCDCDC" : (parent.hovered ? "#DFDFDF" : "#DCDCDC") }
                id: input_c_y
                text: qsTr("")
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                validator: IntValidator {}
            }

            Button {
                Layout.row: 4
                Layout.column: 0
                Layout.columnSpan: 3
                Layout.fillWidth: true
                background: Rectangle {color: parent.down ? "#696969" : (parent.hovered ? "#3cb371" : "#8fbc8f") }
                id: calculate
                text: qsTr("Calculate")
                Layout.fillHeight: false
                Layout.rowSpan: 1
                ToolTip{
                    id: errorTip
                    visible: false
                }
                onClicked: {
                    const ax = parseInt(input_a_x.text)
                    const ay = parseInt(input_a_y.text)
                    const bx = parseInt(input_b_x.text)
                    const by = parseInt(input_b_y.text)
                    const cx = parseInt(input_c_x.text)
                    const cy = parseInt(input_c_y.text)

                    if (!checkInput(ax,ay,bx,by,cx,cy)){

                        failAnimation.start()
                        errorTip.show("Wrong input",500)
                        result_field.text = ""
                    }else{
                        result_field.text = square(ax,ay,bx,by,cx,cy).toFixed(3)
                    }

                }


                function square(ax,ay,bx,by,cx,cy){
                    return (Math.abs((bx-ax)*(cy-ay)-(cx-ax)*(by-ay)) / 2.0)
                }
                function checkInput(ax,ay,bx,by,cx,cy){
                    if (isNaN(ax) || isNaN(ay) ||isNaN(bx) ||isNaN(by) ||isNaN(cx) ||isNaN(cy)) return false;
                    return true;
                }
            }

            Label {
                Layout.row: 5
                Layout.column: 0
                id: label_result
                text: qsTr("S  = ")
            }
            TextField{
                id: result_field
                Layout.row: 5
                Layout.column: 1
                Layout.columnSpan: 2
                Layout.fillWidth: true
                background: Rectangle {color: parent.down ? "#DCDCDC" : (parent.hovered ? "#DFDFDF" : "#DCDCDC") }
                readOnly: true
                font.pixelSize:14
            }
        }
    }

    ParallelAnimation{
        id: failAnimation
        SequentialAnimation{
            PropertyAnimation{
                targets: [input_ax_rect,input_ay_rect,input_bx_rect,input_by_rect,input_cx_rect,input_cy_rect]
                property: "color"
                to: "red"
                duration: 0
            }
            PropertyAnimation{
                targets: [input_ax_rect,input_ay_rect,input_bx_rect,input_by_rect,input_cx_rect,input_cy_rect]
                property: "color"
                to: "#DCDCDC"
                duration: 400
            }
        }
    }
}

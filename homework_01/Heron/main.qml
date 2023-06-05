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
            columnSpacing: 20
            rows: 5
            columns: 2

            Label {
                Layout.row: 0
                Layout.column: 0
                id: label_a
                text: qsTr("a  = ")
            }

            TextField {
                Layout.row: 0
                Layout.column: 1
                Layout.fillWidth: true
                background: Rectangle {id: input_a_rect; color: parent.down ? "#DCDCDC" : (parent.hovered ? "#DFDFDF" : "#DCDCDC") }
                id: input_a
                text: qsTr("")
                font.pixelSize: 14
                validator: DoubleValidator { bottom: 0; decimals: 5; locale: "EN"}
            }
            Label {
                Layout.row: 1
                Layout.column: 0
                id: label_b
                text: qsTr("b  = ")
            }

            TextField {
                Layout.row: 1
                Layout.column: 1
                Layout.fillWidth: true
                background: Rectangle {id: input_b_rect; color: parent.down ? "#DCDCDC" : (parent.hovered ? "#DFDFDF" : "#DCDCDC") }
                id: input_b
                text: qsTr("")
                font.pixelSize: 14
                validator: DoubleValidator { bottom: 0; decimals: 5; locale: "EN"}
            }

            Label {
                Layout.row: 2
                Layout.column: 0
                id: label_c
                text: qsTr("c  = ")
            }

            TextField {
                Layout.row: 2
                Layout.column: 1
                id: input_c
                Layout.fillWidth: true
                background: Rectangle {id: input_c_rect; color: parent.down ? "#DCDCDC" : (parent.hovered ? "#DFDFDF" : "#DCDCDC") }
                text: qsTr("")
                font.pixelSize:14
                validator: DoubleValidator { bottom: 0; decimals: 5; locale: "EN"}
            }

            Button {
                Layout.row: 3
                Layout.column: 0
                Layout.columnSpan: 2
                Layout.fillWidth: true
                background: Rectangle {color: parent.down ? "#696969" : (parent.hovered ? "#3cb371" : "#8fbc8f") }
                id: calculate
                text: qsTr("Calculate")
                ToolTip{
                    id: errorTip
                    visible: false
                }
                onClicked: {
                    const a = parseFloat(input_a.text)
                    const b = parseFloat(input_b.text)
                    const c = parseFloat(input_c.text)

                    if (!checkSides(a,b,c)){
                        failAnimation.start()
                        errorTip.show("Wrong input",500)
                        result_field.text = ""
                    }else{
                        const p = (a + b + c) / 2.0
                        result_field.text = Math.sqrt(p*(p-a)*(p-b)*(p-c)).toFixed(3)
                    }
                }

                function checkSides(a,b,c){
                    if ( isNaN(a) || isNaN(b) || isNaN(c)) return false;
                    if (a + b <= c || a + c <= b || b + c <= a) return false;
                    return true;
                }
            }

            Label {
                Layout.row: 4
                Layout.column: 0
                id: label_result
                text: qsTr("S  = ")
            }
            TextField{
                id: result_field
                Layout.row: 4
                Layout.column: 1
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
                targets: [input_a_rect,input_b_rect,input_c_rect]
                property: "color"
                to: "red"
                duration: 0
            }
            PropertyAnimation{
                targets: [input_a_rect,input_b_rect,input_c_rect]
                property: "color"
                to: "#DCDCDC"
                duration: 400
            }
        }
    }
}

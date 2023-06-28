import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

import "qrc:/Figures.js" as MyFigures
Window
{

    id: root
    width: 1000
    height: 500
    visible: true
    title: qsTr("Lesson 5")

//===================TASK 1=======================
    readonly property int defMargin: 10

    Rectangle
    {
        id: task1
        width: parent.width / 2
        height: parent.height
        x: 0
        y: 0
        color: "lightblue"
        Canvas
        {
            id: myCanvas
            width: parent.width
            height: parent.height - 100
            anchors.left: parent.left
            anchors.top: parent.top
            property int step: task1.width / defMargin
            onPaint:
            {
                var ctx = getContext("2d");
                if (listFigures.currentIndex === 0)
                    MyFigures.starCreated(ctx, step);
                else if (listFigures.currentIndex === 1)
                    MyFigures.ringCreated(ctx, step);
                else if (listFigures.currentIndex === 2)
                    MyFigures.houseCreated(ctx, step);
                else if (listFigures.currentIndex === 3)
                    MyFigures.hourglassCreated(ctx, step);
            }
        }

        ComboBox
        {
            id: listFigures
            height: 3 * defMargin
            width: task1.width / 5
            anchors.top: myCanvas.bottom
            anchors.margins: defMargin
            anchors.horizontalCenter: task1.horizontalCenter
            onCurrentIndexChanged:
            {
                myCanvas.requestPaint()
            }

            model:
                [ "Звезда", "Кольцо", "Домик", "Песочные часы"]
        }
    }

//===================TASK 2=======================

    property double pagewidth: 300
    property double pageheight: task2.height - defMargin * 2
    property double topmargin: (task2.height - pagewidth) / 2
    property double leftmargin: (task2.width - pagewidth) / 2

    Rectangle
    {
        id: task2
        width: parent.width / 2
        height: parent.height
        anchors.left: task1.right
        color: "lightgreen"

        Loader
        {
            id: loader
            anchors.top: task2.top
            anchors.topMargin: topmargin
            anchors.left: task2.left
            anchors.leftMargin: leftmargin
        }

        Component.onCompleted :
        {
            loader.source = "qrc:/Entrance.qml"
        }
    }
}

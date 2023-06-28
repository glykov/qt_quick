import QtQuick 2.0
import QtQuick.Controls 2.12

Item
{
    id: secondItem
    Rectangle
    {
        id: secondPage
        width: pagewidth
        height: pageheight
        color: "#7b7bf6"

        Text
        {
            anchors.centerIn: secondPage
            text: qsTr("Вторая страница")
            font.bold: true
            font.pointSize: 20
        }
        Button
        {
            id: forward
            width: 100
            height: 50
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            enabled: false
            opacity: 0.5
            Rectangle
            {
                anchors.fill: forward
                color: "green"
            }
            text: qsTr("Вперед")
        }
        Button
        {
            id: back
            width: 100
            height: 50
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked:
            {
                loader.source = "qrc:/FirstPage.qml"
                secondPage.destroy()
            }
            Rectangle
            {
                anchors.fill: back
                color: "#30b7f4"
            }

            text: qsTr("Назад")
        }
        Button
        {
            id: exit
            width: 100
            height: 50
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            Rectangle
            {
                anchors.fill: exit
                color: "#bb3f3f"
            }

            text: qsTr("Выйти")
            onClicked:
            {
                loadEntr.source = "qrc:/Entrance.qml"
                secondPage.destroy()
            }
        }
        Component.onCompleted :
        {
            console.log("first");
        }
    }
    Loader
    {
        id: loader
    }
    Loader
    {
        id: loadEntr
        anchors.top: parent.top
        anchors.topMargin: topmargin - defMargin
    }
}

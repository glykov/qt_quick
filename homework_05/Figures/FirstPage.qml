import QtQuick 2.0
import QtQuick.Controls 2.12

Item
{
    id: firstItem
    Rectangle
    {
        id: firstPage
        width: pagewidth
        height: pageheight
        color: "#caf531"
        Text
        {
            anchors.centerIn: firstPage
            text: qsTr("Первая страница")
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
            Rectangle
            {
                anchors.fill: forward
                color: "green"
            }
            text: qsTr("Вперед")
            onClicked:
            {
                loader.source = "qrc:/SecondPage.qml"
                firstPage.destroy()
            }
        }
        Button
        {
            id: back
            width: 100
            height: 50
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            enabled: false
            opacity: 0.5
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
                firstPage.destroy()
            }
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

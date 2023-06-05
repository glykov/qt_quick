import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Lesson 3")

//=====================TASK 1===================

    Rectangle
    {
        id: task1
        height: parent.height
        width: parent.width / 2
        anchors.left: parent.left
        color: "lightyellow"

        Row
        {
            id: rowButtons
            width: parent.width
            height: 50
            Button
            {
                id: defaultButton
                width: rowButtons.width / 4
                height: rowButtons.height
                text: "Красный \nквадрат"
                onClicked:
                {
                    task.state = "red_square"
                }
            }
            Button
            {
                id: firstStateButton
                width: rowButtons.width / 4
                height: rowButtons.height
                text: "Желтый \nкруг"
                onClicked:
                {
                    task.state = "yellow_circle"
                }
            }
            Button
            {
                id: secondStateButton
                width: rowButtons.width / 4
                height: rowButtons.height
                text: "Зеленый \nромб"
                onClicked:
                {
                    task.state = "green_romb"
                }
            }
            Button
            {
                id: thirdStateButton
                width: rowButtons.width / 4
                height: rowButtons.height
                text: "Синий \nпрямоугольник"
                onClicked:
                {
                    task.state = "blue_rectangle"
                }
            }
        }

        Rectangle
        {
            id: task
            width: 100
            height: width
            x: 20
            y: 100
            color: "red"

            state: "red_square"

            MouseArea
            {
                id: area
                anchors.fill: task
            }

            states:
            [

            State
            {
                name: "yellow_circle"
                PropertyChanges
                {
                    target: task
                    x: 30
                    y: 300
                    color: "yellow"
                    radius: task.width / 2
                }
            },
            State
            {
                name: "green_romb"
                PropertyChanges
                {
                    target: task
                    x: 150
                    y: 220
                    rotation: 135
                    radius: 0
                    color: "green"
                }
            },
            State {
                name: "blue_rectangle"
                PropertyChanges
                {
                    target: task
                    x: 150
                    y: 100
                    width: 150
                    height: 50
                    color: "blue"
                }
            }
            ]

        transitions:
            [
            Transition
            {
                id: tr
                to: "red_square"
                ParallelAnimation
                {
                    NumberAnimation
                    {
                        property: "x"
                        duration: 500
                    }
                    NumberAnimation
                    {
                        property: "y"
                        duration: 1000
                    }
                    ColorAnimation
                    {
                        duration: 500
                    }
                }
            },
            Transition
            {
                id: trYell
                to: "yellow_circle"
                ParallelAnimation
                {
                    NumberAnimation
                    {
                        property: "x"
                        duration: 1192
                    }
                    NumberAnimation
                    {
                        property: "y"
                        duration: 1200
                    }
                    PropertyAnimation
                    {
                        property: "radius"
                        duration: 500
                    }
                    ColorAnimation
                    {
                        duration: 700
                    }
                }
            },
            Transition
            {
                to: "green_romb"
                NumberAnimation
                {
                    property: "x"
                    duration: 200
                }
                NumberAnimation
                {
                    property: "y"
                    duration: 200
                }
                PropertyAnimation
                {
                    property: "radius"
                    duration: 400
                }
                ColorAnimation
                {
                    duration: 1400
                }
                PropertyAnimation
                {
                    property: "rotation"
                    duration: 800
                }
            },
            Transition
            {
                to: "blue_rectangle"
                NumberAnimation
                {
                    property: "x"
                    duration: 800
                }
                NumberAnimation
                {
                    property: "y"
                    duration: 150
                }
                ColorAnimation
                {
                    duration: 450
                }
                NumberAnimation
                {
                    property: "width"
                    duration: 900
                }
                NumberAnimation
                {
                    property: "height"
                    duration: 900
                }
            }
        ]
        }
    }
//=====================TASK 2===================

    Rectangle
    {
        id: task2
        height: parent.height
        width: parent.width / 2
        anchors.left: task1.right
        color: "lightblue"
        ListView
        {
            id: library
            anchors.fill: task2
            model: books
            spacing: 5
            focus: true
            header: Rectangle
            {
                width: task2.width
                height: 30
                radius: 5
                color: "#EF5048"
                Text {
                    anchors.centerIn: parent
                    text: "My library"
                    font.pointSize: 15
                    font.bold: true
                }
            }



            section.delegate: Rectangle
            {
                width: parent.width
                height: 20
                color: "#EF9848"
                Text
                {
                    anchors.centerIn: parent
                    text: section
                }
            }
            section.property: "group"

            delegate: Rectangle
            {
                id: deleRect
                width: task2.width
                height: 90
                radius: 3
                border.width: 1
                border.color: "darkgray"
                color: "#DAEFB8"
                MouseArea
                {
                    anchors.fill: parent
                    onDoubleClicked:
                    {
                        library.model.remove(index)
                    }
                }
                Image {
                    id: img
                    anchors.top: parent.top
                    anchors.left: parent.left
                    width: 60
                    height: deleRect.height
                    source: resource
                }
                Column
                {
                    anchors.top: parent.top
                    anchors.left: img.right
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    spacing: 5
                    Row
                    {
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text { text: "Название:"; font.weight: Font.Bold }
                        Text { text: name }
                        spacing: 5
                    }
                    Row
                    {
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text { text: "Автор:"; font.weight: Font.Bold }
                        Text { text: autor }
                        spacing: 5
                    }
                    Row
                    {
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text { text: "Дата выпуска:"; font.weight: Font.Bold }
                        Text { text: date }
                        spacing: 5
                    }
                }
            }
        }
        ListModel
        {
            id: books
            ListElement
            {
                group: "Ужасы"
                name: "Безнадёга"
                autor: "Стивен Кинг"
                date: "1996"
                resource: "qrc:/images/beznadega.png"
            }
            ListElement
            {
                group: "Фэнтези"
                name: "Хроники Нарнии: Лев, колдунья \n и Платяной шкаф"
                autor: "Клайв С.Льюис"
                date: "1950"
                resource: "qrc:/images/narnia.png"
            }
            ListElement
            {
                group: "Фантастика"
                name: "11.22.63"
                autor: "Стивен Кинг"
                date: "2011"
                resource: "qrc:/images/11.22.63.png"
            }
            ListElement
            {
                group: "Фантастика"
                name: "1984"
                autor: "Джордж Оруэлл"
                date: "1949"
                resource: "qrc:/images/1984.png"
            }
            ListElement
            {
                group: "Фантастика"
                name: "Кваzи"
                autor: "Сергей Лукьяненко"
                date: "2016"
                resource: "qrc:/images/kvazi.png"
            }
            ListElement
            {
                group: "Сатира"
                name: "Скотный двор"
                autor: "Джордж Оруэлл"
                date: "1945"
                resource: "qrc:/images/scot.png"
            }
            ListElement
            {
                group: "Роман"
                name: "Мальчик в полосатой пижаме"
                autor: "Джон Бойн"
                date: "2006"
                resource: "qrc:/images/boy.png"
            }
        }
    }
}

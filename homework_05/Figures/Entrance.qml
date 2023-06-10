import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick 2.12

Item
{
    anchors.top: parent.top
    property string login: "123"
    property string password: "321"
    function checkLoginPassword()
    {
        if (login === loginTextField.text && password === passwordTextField.text)
        {
            loader1.source = "qrc:FirstPage.qml";
            entranceRect.destroy()
        }
        else
        {
            animUnsuccessful.start()
        }
    }
    readonly property string textColor: "535353"

    Loader
    {
        id: loader1
        anchors.top: parent.top
        anchors.topMargin: -topmargin + defMargin
    }

    Rectangle
    {
        id: entranceRect
        color: "white"
        width: 300
        radius: 10
        height: width
        Column
        {
            id: entranceColumn
            anchors.fill: entranceRect
            padding: defMargin * 2
            spacing: defMargin * 3
            anchors.margins: defMargin
            TextField
            {
                id: loginTextField
                width: entranceRect.width - defMargin * 2
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Login")
                color: textColor
                font.pointSize: 11
                selectByMouse: true
                height: loginTextField.font.pointSize + defMargin
                Keys.onEnterPressed: checkLoginPassword()
                Keys.onReturnPressed: checkLoginPassword()
            }
            TextField
            {
                id: passwordTextField
                width: loginTextField.width
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Password")
                color: textColor
                font.pointSize: 11
                selectByMouse: true
                height: passwordTextField.font.pointSize + defMargin
                echoMode: TextInput.Password
                Keys.onEnterPressed: checkLoginPassword()
                Keys.onReturnPressed: checkLoginPassword()
            }
            Button
            {
                id: entranceButton
                anchors.horizontalCenter: parent.horizontalCenter
                width: loginTextField.width
                height: 40
                text: qsTr("Enter")
                onClicked:
                {
                    checkLoginPassword();
                }
                background: Rectangle
                {
                    anchors.fill: entranceButton
                    color: parent.down ? "#25bbbb" : (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                }
            }
            Button
            {
                id: showLoginAndPassword
                text: qsTr("Показать логин и пароль")
                width: loginTextField.width
                height: entranceButton.height
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked:
                {
                    showLoginAndPassword.text = qsTr("Login: " + login + "\nPassword: " + password)
                }
            }
        }
        //Анимация при неправильном логине или пароле
        ParallelAnimation
        {
            id: animUnsuccessful
            SequentialAnimation
            {
                PropertyAnimation
                {
                    targets: [loginTextField, passwordTextField]
                    property: "color"
                    to: "dark red"
                    duration: 0
                }
                PropertyAnimation
                {
                    targets: [loginTextField, passwordTextField]
                    property: "color"
                    to: root.textColor
                    duration: 800
                }
            }
            SequentialAnimation
            {
                PropertyAnimation
                {
                    target: entranceRect
                    property: "anchors.horizontalCenterOffset"
                    to: -5
                    duration: 50
                }
                PropertyAnimation
                {
                    target: entranceRect
                    property: "anchors.horizontalCenterOffset"
                    to: 5
                    duration: 50
                }
                PropertyAnimation
                {
                    target: entranceRect
                    property: "anchors.horizontalCenterOffset"
                    to: 0
                    duration: 50
                }
            }
        }
    }
}

#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QWidget>
#include <QLineEdit>
#include <QPushButton>
#include <QVBoxLayout>
#include <QGridLayout>

#include <QSequentialAnimationGroup>
#include <QParallelAnimationGroup>
#include <QPropertyAnimation>
#include <QGraphicsOpacityEffect>

#include <QDebug>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    mainGrid = new QGridLayout(this);


    loginForm = new QWidget(this);
    loginLayout = new QVBoxLayout(loginForm);
    loginLayout->setContentsMargins(50,0,50,0);

    loginEdit = new QLineEdit(loginForm);
    loginEdit->setPlaceholderText("Login");
    loginEdit->setTextMargins(5,0,0,0);

    passwordEdit = new QLineEdit(loginForm);
    passwordEdit->setPlaceholderText("Password");
    passwordEdit->setTextMargins(5,0,0,0);

    enterButton = new QPushButton("Enter",loginForm);
    enterButton->setStyleSheet("");

    loginLayout->addWidget(loginEdit);
    loginLayout->addWidget(passwordEdit);
    loginLayout->addWidget(enterButton);
    loginForm->setLayout(loginLayout);
    loginForm->setMinimumSize(300,250);
    loginForm->setStyleSheet("QWidget{background: white; border-radius: 5px}"
                             "QLineEdit{background: white; color: #535353; border: 1px solid #535353; height: 40}"
                             "QPushButton{background :#f6f6f6; height:40}"
                             "QPushButton:hover {background: #d6d6d6}");
    mainGrid->addWidget(loginForm,5,5,Qt::AlignCenter);
    centralWidget()->setLayout(mainGrid);
    centralWidget()->setStyleSheet("background: #e5ecef");

    connect(enterButton,SIGNAL(clicked()),this,SLOT(checkCredentials()));

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::shakeWidget()
{
    QParallelAnimationGroup* anim = new QParallelAnimationGroup;
    int init_x = loginForm->x();
    int init_y = loginForm->y();
    int w = loginForm->width();
    int h = loginForm->height();

    QPropertyAnimation* right = new QPropertyAnimation(loginForm, "geometry");
    right->setDuration(100);
    right->setStartValue(QRect(init_x, init_y, w, h));
    right->setEndValue(QRect(init_x+5, init_y, w, h));
    QPropertyAnimation* left = new QPropertyAnimation(loginForm, "geometry");
    left->setDuration(200);
    left->setStartValue(QRect(init_x+5, init_y, w, h));
    left->setEndValue(QRect(init_x-5, init_y, w, h));
    QPropertyAnimation* center = new QPropertyAnimation(loginForm, "geometry");
    center->setDuration(100);
    center->setStartValue(QRect(init_x, init_y, w, h));
    center->setEndValue(QRect(init_x, init_y, w-30, h-20));
    QSequentialAnimationGroup* shake = new QSequentialAnimationGroup;
    shake->addAnimation(right);
    shake->addAnimation(left);
    shake->addAnimation(center);


    QSequentialAnimationGroup* loginAnim = new QSequentialAnimationGroup;
    QGraphicsColorizeEffect *eEffectLogin= new QGraphicsColorizeEffect(anim);
    loginEdit->setGraphicsEffect(eEffectLogin);
    QPropertyAnimation* loginRed = new QPropertyAnimation(eEffectLogin,"color");
    loginRed->setDuration(200);
    loginRed->setStartValue(QColor("#535353"));
    loginRed->setEndValue(QColor(Qt::red));
    QPropertyAnimation* loginGrey = new QPropertyAnimation(eEffectLogin,"color");
    loginGrey->setDuration(200);
    loginGrey->setStartValue(QColor(Qt::red));
    loginGrey->setEndValue(QColor("#535353"));
    loginAnim->addAnimation(loginRed);
    loginAnim->addAnimation(loginGrey);

    QGraphicsColorizeEffect *eEffectPassword= new QGraphicsColorizeEffect(anim);
    QSequentialAnimationGroup* passwordAnim = new QSequentialAnimationGroup;
    passwordEdit->setGraphicsEffect(eEffectPassword);
    QPropertyAnimation* passwordRed = new QPropertyAnimation(eEffectPassword,"color");
    passwordRed->setDuration(200);
    passwordRed->setStartValue(QColor("#535353"));
    passwordRed->setEndValue(QColor(Qt::red));
    QPropertyAnimation* passwordGrey = new QPropertyAnimation(eEffectPassword,"color");
    passwordGrey->setDuration(200);
    passwordGrey->setStartValue(QColor(Qt::red));
    passwordGrey->setEndValue(QColor("#535353"));
    passwordAnim->addAnimation(passwordRed);
    passwordAnim->addAnimation(passwordGrey);


    anim->addAnimation(shake);
    anim->addAnimation(loginAnim);
    anim->addAnimation(passwordAnim);
    anim->start(QAbstractAnimation::DeleteWhenStopped);
}

void MainWindow::fadeWidget(QWidget *wgt)
{
    QGraphicsOpacityEffect *eff = new QGraphicsOpacityEffect();
    wgt->setGraphicsEffect(eff);
    QPropertyAnimation* anim = new QPropertyAnimation(eff,"opacity");
    anim->setDuration(500);
    anim->setStartValue(1);
    anim->setEndValue(0);
    anim->setEasingCurve(QEasingCurve::OutBack);
    anim->start(QPropertyAnimation::DeleteWhenStopped);
}

void MainWindow::checkCredentials()
{
    if (loginEdit->text() == login && passwordEdit->text() == password){
        fadeWidget(loginForm);
        disconnect(enterButton,SIGNAL(clicked()),0,0);
    }else{
        shakeWidget();
    }
}

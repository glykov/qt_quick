#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private:
    Ui::MainWindow *ui;

    class QWidget* loginForm;
    class QLineEdit* loginEdit, *passwordEdit;
    class QPushButton* enterButton;
    class QVBoxLayout* loginLayout;
    class QGridLayout* mainGrid;

    void shakeWidget();
    void fadeWidget(class QWidget*);

    const QString login = "login";
    const QString password = "password";

private slots:
    void checkCredentials();
};
#endif // MAINWINDOW_H

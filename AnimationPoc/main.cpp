#include <QGuiApplication>
#include <QQmlApplicationEngine>

//include view controllers to register
#include "ViewControllers/ViewController.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    //Register types
    qmlRegisterType<ViewController>("animation_poc", 1, 0, "ViewController");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}

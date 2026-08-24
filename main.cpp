#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "Backend/gamecontroller.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    GameController gameController;
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("gameController", &gameController);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("NumberGuess", "Main");

    return QGuiApplication::exec();
}

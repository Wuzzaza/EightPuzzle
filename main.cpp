#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QObject>
#include <gamesaver.h>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QQmlContext* context = engine.rootContext();

    GameSaver gameSaver;

    context->setContextProperty("gameSaver", &gameSaver);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}

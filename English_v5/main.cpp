#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <perform.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    perform pf;

    engine.rootContext()->setContextProperty("perform", &pf);
    engine.load(QUrl(QStringLiteral("../English_v5/main.qml")));



    // begin
    pf.oof = 1;
    pf.sendToQml(pf.oof);

    return app.exec();
}

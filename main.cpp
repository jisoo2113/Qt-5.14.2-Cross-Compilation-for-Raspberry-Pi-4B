#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include <QByteArray>
#include <QApplication>
#include "signal_generator.h"
#include <QQmlComponent>
#include <QQmlContext>

int main(int argc, char *argv[])
{

    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    Signal_generator gen;
    engine.rootContext()->setContextProperty("signal_cpp",&gen);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);




    return app.exec();
}

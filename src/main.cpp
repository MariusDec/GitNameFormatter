#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QClipboard>
#include <QIcon>

#include "qclipboardproxy.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    QClipboardProxy *clipboardProxy = new QClipboardProxy(app.clipboard());

    app.setWindowIcon(QIcon("git-branch.png"));

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.rootContext()->setContextProperty("clipboard", clipboardProxy);
    engine.load(url);

    return app.exec();
}

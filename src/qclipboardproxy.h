#ifndef QCLIPBBOARDPROXY_H
#define QCLIPBBOARDPROXY_H

#include <QObject>
#include <QString>

class QClipboard;

class QClipboardProxy : public QObject
{
    Q_OBJECT

public:
    QClipboardProxy(QClipboard* clipboard);

public slots:
    void setText(QString text);

private:
    QClipboard* _clipboard;
};

#endif // QCLIPBBOARDPROXY_H

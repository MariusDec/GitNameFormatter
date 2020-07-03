#include "qclipboardproxy.h"
#include <QClipboard>

QClipboardProxy::QClipboardProxy(QClipboard *clipboard)
{
    _clipboard = clipboard;
}

void QClipboardProxy::setText(QString text)
{
    if (_clipboard)
        _clipboard->setText(text);
}

import QtQuick 2.9
import QtQuick.Controls 2.5

Button {
    id: control
    text: qsTr("Button")

    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: root.foregroundColor
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        color: control.down ? "#303030" : (control.hovered ? "#3b3b44" : "#333333")
        border.color: "#3b3b44"
        border.width: 1
        radius: 4
    }
}

import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Window 2.3

import "functions.js" as Functions

Window {
    title: qsTr("Git Name Formatter")
    visible: true
    width: 500
    height: 400
    minimumWidth: 500
    minimumHeight: 400
    maximumHeight: 400
    maximumWidth: 800

    Rectangle {
        anchors.fill: parent
        id: root
        property int margins: 5
        property int spacing: 10
        property color foregroundColor: "#00aba9"
        property string oldResult: '';
        color: "#31313a"

        Rectangle {
            id: rectangle
            anchors.fill: parent
            color: "#31313a"

            Rectangle {
                id: editNameBackground
                anchors {
                    top: parent.top
                    right: parent.right
                    left: parent.left
                    margins: 10
                }
                height: 62
                color: "#3b3b44"
                border.color: "#444444"

                Flickable {
                     id: flickName

                     anchors.fill: parent
                     contentWidth: editName.paintedWidth
                     contentHeight: editName.paintedHeight + 10
                     clip: true

                     function ensureVisible(r)
                     {
                         if (contentX >= r.x)
                             contentX = r.x;
                         else if (contentX+width <= r.x+r.width)
                             contentX = r.x+r.width-width;
                         if (contentY >= r.y)
                             contentY = r.y;
                         else if (contentY+height <= r.y+r.height)
                             contentY = r.y+r.height-height;
                     }

                     TextEdit {
                         id: editName
                         padding: 5
                         antialiasing: true
                         focus: true
                         selectByMouse: true
                         selectByKeyboard: true

                         wrapMode: TextEdit.Wrap
                         width: flickName.width
                         onCursorRectangleChanged: flickName.ensureVisible(cursorRectangle)

                         color: root.foregroundColor

                         property string placeholderText: "Enter task name here..."

                         Text {
                             padding: 5
                             text: editName.placeholderText
                             color: "#708b89"
                             visible: !editName.text
                         }
                     }
                }
            }

            Row {
                anchors {
                    left: parent.left
                    top: editNameBackground.bottom
                    margins: 10
                    topMargin: 30
                    bottom: btnToPlainText.top
                }

                spacing: 30

                GroupBox {
                    title: "To Git Branch Name"
                    width: root.width / 2 - 25
                    bottomPadding: 22

                    label: Rectangle {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.top
                        anchors.bottomMargin: -height / 2
                        color: "#32323a"
                        border.color: "#3b3b44"
                        width: parent.width * 0.7
                        height: gitTitle.font.pixelSize + 10
                        Text {
                            id: gitTitle
                            text: parent.parent.title
                            anchors.centerIn: parent
                            font.pixelSize: 14
                            color: root.foregroundColor
                        }
                    }

                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 40
                        opacity: enabled ? 1 : 0.3
                        color: "#303038"
                        border.color: "#3b3b44"
                        border.width: 1
                        radius: 4
                    }

                    Column {
                        y: 10
                        spacing: 10
                        anchors.fill: parent
                        anchors.topMargin: 10

                        DarkButton {
                            id: btnGitFeature
                            text: "To <u>F</u>eature Name"
                            action: Action {
                                shortcut: "Ctrl+F"
                            }

                            anchors {
                                left: parent.left
                                right: parent.right
                            }

                            onClicked: Functions.formatGitBranchName(
                                           "Feature", editName.text, editResult)
                        }

                        DarkButton {
                            id: btnGitBugfix
                            text: "To <u>B</u>ugfix Name"
                            action: Action {
                                shortcut: "Ctrl+B"
                            }

                            anchors {
                                left: parent.left
                                right: parent.right
                            }

                            onClicked: Functions.formatGitBranchName(
                                           "Bugfix", editName.text, editResult)
                        }

                        DarkButton {
                            id: btnGitHotfix
                            text: "To <u>H</u>otfix Name"
                            action: Action {
                                shortcut: "Ctrl+H"
                            }

                            anchors {
                                left: parent.left
                                right: parent.right
                            }

                            onClicked: Functions.formatGitBranchName(
                                           "Hotfix", editName.text, editResult)
                        }
                    }
                }

                GroupBox {
                    title: "To Task Name"
                    width: root.width / 2 - 25

                    label: Rectangle {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.top
                        anchors.bottomMargin: -height / 2
                        color: "#32323a"
                        border.color: "#3b3b44"
                        width: parent.width * 0.7
                        height: taskTitle.font.pixelSize + 10
                        Text {
                            id: taskTitle
                            text: parent.parent.title
                            anchors.centerIn: parent
                            font.pixelSize: 14
                            color: root.foregroundColor
                        }
                    }

                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 40
                        opacity: enabled ? 1 : 0.3
                        color: "#303038"
                        border.color: "#3b3b44"
                        border.width: 1
                        radius: 4
                    }
                    padding: 12
                    bottomPadding: 22

                    Column {
                        spacing: 10
                        anchors.fill: parent
                        anchors.topMargin: 10

                        DarkButton {
                            id: btnTaskFeature
                            text: "To <u>F</u>eature Name"
                            action: Action {
                                shortcut: "Ctrl+Shit+F"
                            }
                            anchors {
                                left: parent.left
                                right: parent.right
                            }

                            onClicked: Functions.formatTaskName("Feature",
                                                                editName.text,
                                                                editResult)
                        }

                        DarkButton {
                            id: btnTaskBugfix
                            text: "To <u>B</u>ugfix Name"
                            action: Action {
                                shortcut: "Ctrl+Shit+B"
                            }
                            anchors {
                                left: parent.left
                                right: parent.right
                            }

                            onClicked: Functions.formatTaskName("Bugfix",
                                                                editName.text,
                                                                editResult)
                        }

                        DarkButton {
                            id: btnTaskHotfix
                            text: "To <u>H</u>otfix Name"
                            action: Action {
                                shortcut: "Ctrl+Shit+H"
                            }
                            anchors {
                                left: parent.left
                                right: parent.right
                            }

                            onClicked: Functions.formatTaskName("Hotfix",
                                                                editName.text,
                                                                editResult)
                        }
                    }
                }
            }

            DarkButton {
                id: btnToPlainText
                y: 386
                text: "To Plain Text"
                width: 200
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    bottom: editResultBackground.top
                    margins: 10
                }

                onClicked: Functions.formatToPlainText(editName.text,
                                                       editResult)
            }

            Rectangle {
                id: editResultBackground
                anchors {
                    bottom: parent.bottom
                    right: parent.right
                    left: parent.left
                    margins: 10
                }
                height: 45
                color: "#3b3b44"
                border.color: "#444444"



                Flickable {
                     id: flickResult

                     anchors.fill: parent
                     contentWidth: editResult.paintedWidth
                     contentHeight: editResult.paintedHeight + 10
                     clip: true

                     function ensureVisible(r)
                     {
                         if (contentX >= r.x)
                             contentX = r.x;
                         else if (contentX+width <= r.x+r.width)
                             contentX = r.x+r.width-width;
                         if (contentY >= r.y)
                             contentY = r.y;
                         else if (contentY+height <= r.y+r.height)
                             contentY = r.y+r.height-height;
                     }

                     TextEdit {
                         id: editResult
                         antialiasing: true
                         readOnly: true
                         onTextChanged: if (text && text != root.oldResult) { clipboard.setText(text); root.oldResult = text; }
                         selectByMouse: true
                         selectByKeyboard: true
                         padding: 5

                         color: root.foregroundColor

                         wrapMode: TextEdit.Wrap
                         width: flickResult.width
                         onCursorRectangleChanged: flickResult.ensureVisible(cursorRectangle)
                     }
                }
            }
        }
    }
}

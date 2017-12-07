import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {
    id: page
    property alias page: page
    property alias icon: icon
    property alias topLeftrect: topLeftrect
    property alias mouseArea: mouseArea
    property alias middleRightRect: middleRightRect
    property alias bottomLeftRect: bottomLeftRect
    property alias mouseArea1: mouseArea1
    property alias mouseArea2: mouseArea2

    Image {
        id: icon
        x: 10
        y: 10
        source: "Japan_small_icon.png"
    }

    Rectangle {
        id: middleRightRect
        width: 128
        height: 128
        color: "#ffffff"
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        visible: false
        border.color: "#808080"
    }

    Rectangle {
        id: topLeftrect
        x: 10
        y: 10
        width: 128
        height: 128
        color: "#ffffff"
        border.color: "#808080"
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 20
        visible: false
    }

    MouseArea {
        id: mouseArea
        x: 20
        y: 30
        anchors.rightMargin: 502
        anchors.bottomMargin: 342
        anchors.leftMargin: 10
        anchors.topMargin: 20
        anchors.fill: parent
    }

    Rectangle {
        id: bottomLeftRect
        y: 3
        width: 128
        height: 128
        color: "#ffffff"
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        visible: false
        border.color: "#808080"
    }

    MouseArea {
        id: mouseArea1
        x: 0
        y: -5
        anchors.leftMargin: 502
        anchors.fill: parent
        anchors.topMargin: 176
        anchors.rightMargin: 10
        anchors.bottomMargin: 176
    }

    MouseArea {
        id: mouseArea2
        x: 9
        y: 8
        anchors.leftMargin: 10
        anchors.fill: parent
        anchors.topMargin: 332
        anchors.rightMargin: 502
        anchors.bottomMargin: 16
    }
}

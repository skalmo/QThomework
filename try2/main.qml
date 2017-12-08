import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtCharts 2.2

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Bitcoin Time expansion")

    SwipeView {
        id: view
        anchors.fill: parent
        currentIndex: 1

        Item {
            id: item1
            property alias chartView: chartView

            Connections {
                target: netManager
                onValueUpdated: {
                    y = y / 1000
                    series.append(x, y)
                    if (x > xAxis.max) {
                        xAxis.max = x
                    }
                    if (y > yAxis.max) {
                        yAxis.max = y
                    }
                }
            }

            ColumnLayout {
                id: columnLayout
                anchors.fill: parent

                RowLayout {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    Text {
                        id: text1
                        color: "#31389e"
                        text: qsTr("Daily Bitcoing vs RUB Rates")
                        font.family: "OCR A Extended"
                        font.bold: true
                        z: 1
                        font.italic: true
                        font.pointSize: 20
                    }
                }
            }

            Item {
                id: item2
                x: 0
                y: 58
                width: parent.width
                height: parent.height
                anchors.top: parent.top
                anchors.topMargin: 40
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 40

                ChartView {
                    id: chartView
                    title: "Bitcoin vs RUB chart"
                    anchors.fill: parent
                    theme: ChartView.ChartThemeBlueIcy
                    ValueAxis {
                        id: yAxis
                        titleText: "*1000 RUB"
                        titleVisible: true
                        gridVisible: true
                        tickCount: 11
                        min: 0
                        max: 1000
                    }
                    DateTimeAxis {
                        id: xAxis
                        tickCount: 20
                        visible: true
                        labelsAngle: 90
                        gridVisible: true
                        format: "yyyy-MM-dd"
                        min: "2015-08-01"
                        max: "2016-12-01"
                    }

                    LineSeries {
                        id: series
                        axisX: xAxis
                        axisY: yAxis
                        name: "Bitcoin vs RUB series"
                        visible: true
                    }
                }
            }
        }
        Item {

            id: item12
            property alias chartView: chartView2
            Connections {
                target: netManager
                onValueUpdated2: {
                    series22.append(x, y)
                    if (x > xAxis2.max) {
                        xAxis2.max = x
                    }
                    if (y > yAxis2.max) {
                        yAxis2.max = y
                    }
                }
            }

            ColumnLayout {
                id: columnLayout2
                anchors.fill: parent

                RowLayout {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    Text {
                        id: text12
                        color: "#31389e"
                        text: qsTr("Bitcoin volume")
                        font.family: "OCR A Extended"
                        font.bold: true
                        z: 1
                        font.italic: true
                        font.pointSize: 20
                    }
                }
            }
            Item {
                id: item22
                x: 0
                y: 58
                width: parent.width
                anchors.top: parent.top
                anchors.topMargin: 40
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 40
                ChartView {
                    id: chartView2
                    title: "Bitcoin Daily Volume"
                    anchors.fill: parent
                    theme: ChartView.ChartThemeBrownSand
                    ValueAxis {
                        id: yAxis2
                        titleText: "Volume of trade"
                        titleVisible: true
                        gridVisible: true
                        tickCount: 11
                        min: 0
                        max: 2
                    }
                    DateTimeAxis {
                        id: xAxis2
                        tickCount: 20
                        visible: true
                        labelsAngle: 90
                        gridVisible: true
                        format: "yyyy-MM-dd"
                        min: "2015-08-01"
                        max: "2016-12-01"
                    }
                    LineSeries {
                        id: series22
                        name: "BTC volume series"
                        visible: true
                        axisX: xAxis2
                        axisY: yAxis2
                    }
                }
            }
        }
        Item {
            id: item13
            property alias columnLayout: columnLayout3
            property alias chartView: chartView3

            Connections {
                target: netManager
                onValueUpdated3: {
                    y = y / 100
                    series3.append(x, y)
                    if (x > xAxis3.max) {
                        xAxis3.max = x
                    }
                    if (y > yAxis.max) {
                        yAxis3.max = y
                    }
                }
            }

            ColumnLayout {
                id: columnLayout3
                anchors.fill: parent

                RowLayout {
                    z: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    Text {
                        id: text13
                        color: "#31389e"
                        text: qsTr("Daily Bitcoing vs USD Rates")
                        font.family: "OCR A Extended"
                        font.bold: true
                        z: 1
                        font.italic: true
                        font.pointSize: 20
                    }
                }
            }
            Item {
                id: item23
                x: 0
                y: 58
                width: parent.width
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 40
                anchors.top: parent.top
                anchors.topMargin: 40

                ChartView {
                    id: chartView3
                    title: "Bitcoin-USD chart"
                    anchors.fill: parent
                    theme: ChartView.ChartThemeQt
                    ValueAxis {
                        id: yAxis3
                        titleText: "*100 USD"
                        titleVisible: true
                        gridVisible: true
                        tickCount: 11
                        min: 0
                        max: 100
                    }
                    DateTimeAxis {
                        id: xAxis3
                        tickCount: 20
                        visible: true
                        labelsAngle: 90
                        gridVisible: true
                        format: "yyyy-MM-dd"
                        min: "2015-08-01"
                        max: "2016-12-01"
                    }
                    LineSeries {
                        id: series3
                        axisX: xAxis3
                        axisY: yAxis3
                        name: "BTC-USD series"
                        visible: true
                    }
                }
            }
        }
    }

    PageIndicator {
        id: indicator

        count: view.count
        currentIndex: view.currentIndex

        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
    //    RowLayout {
    //        anchors.bottom: tabBar.top
    //        anchors.bottomMargin: 10
    //        anchors.horizontalCenter: parent.horizontalCenter
    //        Button {
    //            id: button1
    //            text: qsTr("Refresh")
    //            onClicked: {

    //            }
    //        }
    //        Button {
    //            id: button2
    //            text: qsTr("Save")
    //            onClicked: {

    //            }
    //        }
    //    }
    SwipeView {
        Repeater {
            model: 6
            Loader {
                active: SwipeView.isCurrentItem || SwipeView.isNextItem
                        || SwipeView.isPreviousItem
                sourceComponent: Text {
                    text: index
                    Component.onCompleted: console.log("created:", index)
                    Component.onDestruction: console.log("destroyed:", index)
                }
            }
        }
    }
}

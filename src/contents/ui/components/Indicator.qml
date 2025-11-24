import QtQuick

import "../components" as Components

Rectangle {
    id: indicator
    property var activeZone: []
    property var highlightedZone: []
    property bool hovering: false
    property var indicatorZones: []
    width: parent.width
    height: parent.height
    color: "transparent"
    opacity: 1

    Repeater {
        id: indicators
        model: indicatorZones

        Item {
            id: zone
            x: ((modelData.x / 100) * (indicator.width)) 
            y: ((modelData.y / 100) * (indicator.height)) 
            width: ((modelData.width / 100) * (indicator.width)) 
            height: ((modelData.height / 100) * (indicator.height))

            Rectangle {
                property int padding: 2
                anchors.fill: parent
                anchors.margins: padding
                color: {
                    if (activeZone.includes(index)) {
                        return modelData.color ? colorHelper.tintWithAlpha(colorHelper.buttonColor, modelData.color, 0.6) : colorHelper.accentColor
                    } else if (indicator.highlightedZone.includes(index) && indicator.highlightedZone.includes(activeIndex)) {
                        return modelData.color ? colorHelper.tintWithAlpha(colorHelper.buttonColor, modelData.color, 0.2) : Qt.rgba(colorHelper.accentColor.r, colorHelper.accentColor.g, colorHelper.accentColor.b, 0.2)
                    } else {
                        return modelData.color ? colorHelper.tintWithAlpha(colorHelper.buttonColor, modelData.color, 0.2) : colorHelper.buttonColor
                    }
                }
                border.color: colorHelper.getBorderColor(color)
                border.width: 1
                radius: 5

                Behavior on color {
                    ColorAnimation {
                        duration: 150
                    }
                }
            }

        }

    }

    Components.ColorHelper {
        id: colorHelper
    }

}

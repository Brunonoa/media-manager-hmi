/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
//import utils 1.0
import "qrc:/imports/utils/";
import "qrc:/imports/components/";
//import Automotive.MediaManagerInterface 1.0     // MediaManager


Item {
    height: 200

    property real value
    property real max

    function formatDuration(v) {
        var s = Math.floor(v % 60)
        var m = Math.floor(v / 60)
        return m + ":" + ("00" + s).slice(-2)
    }

    Timer {
        interval: 500
        running: true
        repeat: true
        onTriggered: {
            value = mm.getPositionAttribute()/1000000
            max = mm.getDurationAttribute()/1000000
        }
    }

    Image {
        id: handle
        anchors.top: parent.top
        anchors.topMargin: 80
        x: (parent.width - width + 60) * value / max - 30
        source: "images/handle_blue.png"
    }

    Rectangle {
        id: line
        anchors.top: handle.bottom
        anchors.topMargin: -22
        width: parent.width
        height: 2
        y: -30
        color: Style.blueViv
    }

    Text {
        anchors.top: line.bottom
        anchors.topMargin: 5
        color: Style.blueViv
        font.pixelSize: 30
        text: formatDuration(value)
    }
}

/* Copyright 2017 Esri
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

import QtQuick 2.6
import QtQuick.Controls 2.1
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtPositioning 5.3
import QtSensors 5.3

import ArcGIS.AppFramework 1.0
import ArcGIS.AppFramework.Controls 1.0
import Esri.ArcGISRuntime 100.1


//------------------------------------------------------------------------------

App {
    id: app
    width: 414
    height: 736

    property real scaleFactor: AppFramework.displayScaleFactor

    //header bar
    Rectangle {
        id: titleRect

        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }

        height: 50 * AppFramework.displayScaleFactor
        color: app.info.propertyValue("titleBackgroundColor", "purple")

        Text {
            id: titleText

            anchors.centerIn: parent

            text: app.info.title
            color: app.info.propertyValue("titleTextColor", "white")
            font {
                pointSize: 18
            }
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            maximumLineCount: 2
            elide: Text.ElideRight
            horizontalAlignment: Text.AlignHCenter
        }
    }

    MapView {
        id:mapView

        property real initialMapRotation: 0

        anchors {
            left: parent.left
            //right: parent.right
            top: titleRect.bottom
            //bottom: parent.bottom
        }
        width: parent.width * 0.5
        height: parent.height * 0.5

        rotationByPinchingEnabled: true
        zoomByPinchingEnabled: true

        locationDisplay {
            positionSource: PositionSource {
            }
        }

        // add a basemap
        Map{
            id:map

            BasemapDarkGrayCanvasVector{}
            initialViewpoint: ViewpointCenter {
                id:initialViewpoint
                center: Point {
                    x: -11e6
                    y: 6e6
                    spatialReference: SpatialReference {wkid: 102100}
                }
                targetScale: 9e7
            }
        }

        // map control buttons
        Column{
            id:buttons
            spacing: 5 * scaleFactor
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right
                margins: 5 * scaleFactor
            }

            Button{
                id:homeButton
                Image{
                    source: "./images/home.png"
                    height: 40 * scaleFactor
                    width : height
                    anchors.centerIn: parent
                }

                height: 40 * scaleFactor
                width : height

                onHoveredChanged: hovered ? homeButton.opacity = 1 : homeButton.opacity = .5;
                opacity: .5

                onClicked:{
                    mapView.setViewpointWithAnimationCurve(map.initialViewpoint, 1.0, Enums.AnimationCurveEaseInOutCubic)
                    mapView.setViewpointRotation(mapView.initialMapRotation)

                }
            }

            Button{
                id:locationButton
                Image{
                    source:"./images/location.png"
                    height: 30 * scaleFactor
                    width: height
                    anchors.centerIn: parent
                }
                onHoveredChanged: hovered ? locationButton.opacity = 1 : locationButton.opacity = .5;
                height: 40 * scaleFactor
                width : height
                opacity: .5

                onClicked: {
                    if (!mapView.locationDisplay.started) {
                        mapView.locationDisplay.start()
                        mapView.locationDisplay.autoPanMode = Enums.LocationDisplayAutoPanModeRecenter
                    } else {
                        mapView.locationDisplay.stop()
                    }
                }

            }
        }
    }
    MapView {
        id:mapView2

        property real initialMapRotation: 0

        anchors {
            left: parent.left
            //right: parent.right
            //top: titleRect.bottom
            bottom: parent.bottom
        }
        width: parent.width * 0.5
        height: parent.height * 0.5

        rotationByPinchingEnabled: true
        zoomByPinchingEnabled: true

        locationDisplay {
            positionSource: PositionSource {
            }
        }

        // add a basemap
        Map{
            id:map2

            BasemapImageryWithLabels{}
            initialViewpoint: ViewpointCenter {
                id:initialViewpoint2
                center: Point {
                    x: -11e6
                    y: 6e6
                    spatialReference: SpatialReference {wkid: 102100}
                }
                targetScale: 9e7
            }
        }

        // map control buttons
        Column{
            id:buttons2
            spacing: 5 * scaleFactor
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right
                margins: 5 * scaleFactor
            }

            Button{
                id:homeButton2
                Image{
                    source: "./images/home.png"
                    height: 40 * scaleFactor
                    width : height
                    anchors.centerIn: parent
                }

                height: 40 * scaleFactor
                width : height

                onHoveredChanged: hovered ? homeButton.opacity = 1 : homeButton.opacity = .5;
                opacity: .5

                onClicked:{
                    mapView.setViewpointWithAnimationCurve(map.initialViewpoint, 1.0, Enums.AnimationCurveEaseInOutCubic)
                    mapView.setViewpointRotation(mapView.initialMapRotation)

                }
            }

            Button{
                id:locationButton2
                Image{
                    source:"./images/location.png"
                    height: 30 * scaleFactor
                    width: height
                    anchors.centerIn: parent
                }
                onHoveredChanged: hovered ? locationButton.opacity = 1 : locationButton.opacity = .5;
                height: 40 * scaleFactor
                width : height
                opacity: .5

                onClicked: {
                    if (!mapView.locationDisplay.started) {
                        mapView.locationDisplay.start()
                        mapView.locationDisplay.autoPanMode = Enums.LocationDisplayAutoPanModeRecenter
                    } else {
                        mapView.locationDisplay.stop()
                    }
                }

            }
        }
    }
    MapView {
        id:mapView3

        property real initialMapRotation: 0

        anchors {
            //left: parent.left
            right: parent.right
            top: titleRect.bottom
            //bottom: parent.bottom
        }
        width: parent.width * 0.5
        height: parent.height * 0.5

        rotationByPinchingEnabled: true
        zoomByPinchingEnabled: true

        locationDisplay {
            positionSource: PositionSource {
            }
        }

        // add a basemap
        Map{
            id:map3

            BasemapNationalGeographic{}
            initialViewpoint: ViewpointCenter {
                id:initialViewpoint3
                center: Point {
                    x: -11e6
                    y: 6e6
                    spatialReference: SpatialReference {wkid: 102100}
                }
                targetScale: 9e7
            }
        }

        // map control buttons
        Column{
            id:buttons3
            spacing: 5 * scaleFactor
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right
                margins: 5 * scaleFactor
            }

            Button{
                id:homeButton3
                Image{
                    source: "./images/home.png"
                    height: 40 * scaleFactor
                    width : height
                    anchors.centerIn: parent
                }

                height: 40 * scaleFactor
                width : height

                onHoveredChanged: hovered ? homeButton.opacity = 1 : homeButton.opacity = .5;
                opacity: .5

                onClicked:{
                    mapView.setViewpointWithAnimationCurve(map.initialViewpoint, 1.0, Enums.AnimationCurveEaseInOutCubic)
                    mapView.setViewpointRotation(mapView.initialMapRotation)

                }
            }

            Button{
                id:locationButton3
                Image{
                    source:"./images/location.png"
                    height: 30 * scaleFactor
                    width: height
                    anchors.centerIn: parent
                }
                onHoveredChanged: hovered ? locationButton.opacity = 1 : locationButton.opacity = .5;
                height: 40 * scaleFactor
                width : height
                opacity: .5

                onClicked: {
                    if (!mapView.locationDisplay.started) {
                        mapView.locationDisplay.start()
                        mapView.locationDisplay.autoPanMode = Enums.LocationDisplayAutoPanModeRecenter
                    } else {
                        mapView.locationDisplay.stop()
                    }
                }

            }
        }
    }
    MapView {
        id:mapView4

        property real initialMapRotation: 0

        anchors {
            //left: parent.left
            right: parent.right
            //top: titleRect.bottom
            bottom: parent.bottom
        }
        width: parent.width * 0.5
        height: parent.height * 0.5

        rotationByPinchingEnabled: true
        zoomByPinchingEnabled: true

        locationDisplay {
            positionSource: PositionSource {
            }
        }

        // add a basemap
        Map{
            id:map4

            BasemapStreetsWithReliefVector{}
            initialViewpoint: ViewpointCenter {
                id:initialViewpoint4
                center: Point {
                    x: -11e6
                    y: 6e6
                    spatialReference: SpatialReference {wkid: 102100}
                }
                targetScale: 9e7
            }
        }

        // map control buttons
        Column{
            id:buttons4
            spacing: 5 * scaleFactor
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right
                margins: 5 * scaleFactor
            }

            Button{
                id:homeButton4
                Image{
                    source: "./images/home.png"
                    height: 40 * scaleFactor
                    width : height
                    anchors.centerIn: parent
                }

                height: 40 * scaleFactor
                width : height

                onHoveredChanged: hovered ? homeButton.opacity = 1 : homeButton.opacity = .5;
                opacity: .5

                onClicked:{
                    mapView.setViewpointWithAnimationCurve(map.initialViewpoint, 1.0, Enums.AnimationCurveEaseInOutCubic)
                    mapView.setViewpointRotation(mapView.initialMapRotation)

                }
            }

            Button{
                id:locationButton4
                Image{
                    source:"./images/location.png"
                    height: 30 * scaleFactor
                    width: height
                    anchors.centerIn: parent
                }
                onHoveredChanged: hovered ? locationButton.opacity = 1 : locationButton.opacity = .5;
                height: 40 * scaleFactor
                width : height
                opacity: .5

                onClicked: {
                    if (!mapView.locationDisplay.started) {
                        mapView.locationDisplay.start()
                        mapView.locationDisplay.autoPanMode = Enums.LocationDisplayAutoPanModeRecenter
                    } else {
                        mapView.locationDisplay.stop()
                    }
                }

            }
        }
    }
}

//------------------------------------------------------------------------------

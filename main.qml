import QtQuick 2.0
import QtQuick.Controls 2.5



ApplicationWindow {

    property bool width_changed:false
    property bool height_changed:false
    property bool new_orientation:false
    onWidthChanged: {
        width_changed=true
        new_orientation=width_changed&&height_changed
    }
    onHeightChanged: {
        height_changed=true
        new_orientation=width_changed&&height_changed
    }
    onNew_orientationChanged: {
        height_changed=false
        width_changed=false
        page2.k_scale = width/(height-height/8)
        page2.update_series()
    }

    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Gap Calculator")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex
        Page1Form {
            id:page
        }
        Page2 {
            id:page2

        }
        Page3 {
            id:page3
        }

        onCurrentIndexChanged: {
            if(currentIndex==1) {
                page2.k_scale = window.width/(window.height-window.height/8)
                page2.update_series()

            }
            else if (currentIndex==0){
                Qt.inputMethod.hide();
            }
        }
    }

    footer: TabBar {
        id: tabBar
        spacing: 5
        height: window.height/8
        contentHeight: window.height/8
        font.pointSize: 20
        clip: false
        currentIndex: swipeView.currentIndex
        TabButton {
            id: tab1
            text: qsTr("Ввод")
        }
        TabButton {
            id: tab2
            text: qsTr("Гэп")
        }
        TabButton {
            id: tab3
            text: qsTr("Инфо")
        }
    }
}

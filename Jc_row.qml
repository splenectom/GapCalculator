import QtQuick.Controls 2.0
import QtQuick 2.0

Row{

    property string label_text
    property string edit_text

    property var row_height: page.height / 7 - 6
    property var left_column_width: page.width / 1.5
    property var right_column_width: this_row.width-left_column_width-5

    id: this_row
    spacing: 5
    anchors.left: parent.left
    anchors.right: parent.right
    Label{
        id: this_label
        text: label_text
        lineHeight: 1
        rightPadding: 5
        transformOrigin: Item.Center
        renderType: Text.QtRendering
        fontSizeMode: Text.Fit
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignRight
        wrapMode: Text.WordWrap
        font.pointSize: 18
        height: row_height
        width: left_column_width
        background: Rectangle{
            color: field_color
        }
    }

    TextField{

        id: this_text
        text: edit_text
        font.letterSpacing: 0
        leftPadding: 5
        antialiasing: true
        topPadding: 0
        bottomPadding: 0
        font.pointSize: 18
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        wrapMode: Text.NoWrap
        clip: true
        color: "white"
        height: row_height
        width: right_column_width
        background: Rectangle{

            color: edit_field_color
        }
        inputMethodHints: Qt.ImhDigitsOnly
    }
}

import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import Qaterial 1.0 as Qaterial

import QtGraphicalEffects 1.0

import App 1.0

import "../../../Components"
import Dex.Themes 1.0 as Dex

Rectangle
{
    property var            details
    property alias          clickable: mouse_area.enabled
    readonly property bool  is_placed_order: !details ? false : details.order_id !== ''

    width: list.model.count > 6 ? list.width - 15 : list.width - 8
    height: 40
    color: mouse_area.containsMouse? DexTheme.hightlightColor : "transparent"

    DefaultMouseArea
    {
        id: mouse_area
        anchors.fill: parent
        hoverEnabled: enabled
        onClicked:
        {
            order_modal.open()
            order_modal.item.details = details
        }
    }

    RowLayout
    {
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10

        DefaultText
        {
            id: status_text
            Layout.preferredWidth: (parent.width / 100) * 4
            Layout.alignment: Qt.AlignVCenter
            visible: clickable ? !details ? false :
                (details.is_swap || !details.is_maker) : false

            font.pixelSize: getStatusFontSize(details.order_status)
            color: !details ? Dex.CurrentTheme.foregroundColor : getStatusColor(details.order_status)
            text_value: !details ? "" : visible ? getStatusStep(details.order_status) : ''
        }

        Item
        {
            Layout.fillHeight: true
            Layout.preferredWidth: (parent.width / 100) * 4
            Layout.alignment: Qt.AlignVCenter
            visible: !status_text.visible ? clickable ? true : false : false

            Qaterial.ColorIcon
            {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                iconSize: 17
                color: Dex.CurrentTheme.foregroundColor
                source: Qaterial.Icons.clipboardTextSearchOutline
            }
        }

        DefaultText
        {
            visible: clickable
            font.pixelSize: base_amount.font.pixelSize
            text_value: !details ? "" : details.date ?? ""
            Layout.fillHeight: true
            Layout.preferredWidth: (parent.width / 100) * 10
            verticalAlignment: Label.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        DefaultImage
        {
            id: base_icon
            source: General.coinIcon(!details ? atomic_app_primary_coin :
                details.base_coin ?? atomic_app_primary_coin)
            Layout.preferredWidth: Style.textSize1
            Layout.preferredHeight: Style.textSize1
            Layout.alignment: Qt.AlignVCenter
            Layout.leftMargin: 2
        }

        DefaultText
        {
            id: base_amount
            text_value: !details ? "" : General.formatCrypto("", details.base_amount, details.base_coin, details.base_amount_current_currency, API.app.settings_pg.current_currency)
            font.pixelSize: 10
            Layout.fillHeight: true
            Layout.preferredWidth: (parent.width / 100) * 33
            verticalAlignment: Label.AlignVCenter
            privacy: is_placed_order
        }

        Item
        {
            Layout.fillHeight: true
            Layout.fillWidth: true
            SwapIcon
            {
                visible: !status_text.visible
                anchors.fill: parent
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                top_arrow_ticker: !details ? atomic_app_primary_coin : details.base_coin ?? ""
                bottom_arrow_ticker: !details ? atomic_app_primary_coin : details.rel_coin ?? ""
            }
        }

        DefaultText
        {
            id: rel_amount
            text_value: !details ? "" : General.formatCrypto("", details.rel_amount, details.rel_coin, details.rel_amount_current_currency, API.app.settings_pg.current_currency)
            font.pixelSize: base_amount.font.pixelSize
            Layout.fillHeight: true
            Layout.preferredWidth: (parent.width / 100) * 33
            verticalAlignment: Label.AlignVCenter
            horizontalAlignment: Label.AlignRight
            privacy: is_placed_order
        }

        DefaultImage
        {
            id: rel_icon
            source: General.coinIcon(!details ? atomic_app_primary_coin :
                details.rel_coin ?? atomic_app_secondary_coin)

            width: base_icon.width
            Layout.preferredWidth: Style.textSize1
            Layout.preferredHeight: Style.textSize1
            Layout.alignment: Qt.AlignVCenter
        }

        DefaultText
        {
            font.pixelSize: base_amount.font.pixelSize
            visible: !details || details.recoverable === undefined ? false :
                details.recoverable && details.order_status !== "refunding"
            Layout.fillHeight: true
            Layout.preferredWidth: (parent.width / 100) * 5
            verticalAlignment: Label.AlignVCenter
            horizontalAlignment: Label.AlignHCenter
            text_value: Style.warningCharacter
            color: Style.colorYellow

            DefaultTooltip
            {
                contentItem: DefaultText
                {
                    text_value: qsTr("Funds are recoverable")
                    font.pixelSize: Style.textSizeSmall4
                }

                visible: (parent.visible && mouse_area.containsMouse) ?? false
            }
        }

        Qaterial.FlatButton
        {
            id: cancel_button_text

            visible: (!is_history ? details.cancellable ?? false : false) === true ? (mouse_area.containsMouse || hovered) ? true : false : false

            Layout.fillHeight: true
            Layout.preferredWidth: (parent.width / 100) * 3
            Layout.alignment: Qt.AlignVCenter

            outlinedColor: Dex.CurrentTheme.noColor
            hoverEnabled: true

            onClicked: if (details) cancelOrder(details.order_id)

            Behavior on scale
            {
                NumberAnimation
                {
                    duration: 200
                }
            }
            Qaterial.ColorIcon
            {
                anchors.centerIn: parent
                iconSize: 13
                color: Dex.CurrentTheme.noColor
                source: Qaterial.Icons.close
                scale: parent.visible ? 1 : 0
            }

        }
    }

    // Separator
    HorizontalLine
    {
        width: parent.width
        anchors.bottom: parent.bottom
    }
}

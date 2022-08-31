#!/usr/bin/env bash
set -ex

# Add GR keyboard layout, change key to CAPSLOCK switch layouts
xfconf-query -c keyboard-layout -p /Default/XkbDisable       -n -t bool -s false
xfconf-query -c keyboard-layout -p /Default/XkbLayout        -n -t string -s 'us,gr'
xfconf-query -c keyboard-layout -p /Default/XkbVariant       -n -t string -s ','
xfconf-query -c keyboard-layout -p /Default/XkbOptions/Group -n -t string -s 'grp:caps_toggle'
    
# Desktop appearance: eDP-1 is the laptop screen
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-home                   -t bool -s false
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-filesystem             -t bool -s false
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitoreDP-1/workspace0/rgba1       -n -t double -t double -t double -t double -s 0.136667 -s 0.136667 -s 0.136667 -s 1.000000
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitoreDP-1/workspace0/image-style -t int -s 1
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitoreDP-1/workspace0/last-image  -t string -s '/home/vag/.desktop-photos/howorth-1-960x640@2x_S.jpeg'

# Desktop appearance: HDMI-1 is the exrenral monitor
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorHDMI-1/workspace0/rgba1       -n -t double -t double -t double -t double -s 0.136667 -s 0.136667 -s 0.136667 -s 1.000000
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorHDMI-1/workspace0/image-style -t int -s 1
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorHDMI-1/workspace0/last-image  -t string -s '/home/vag/.desktop-photos/toor-7-1202x1536.jpg'

# Appearance - Fonts
xfconf-query -c xsettings -p /Gtk/FontName -t string -s 'Inter 12'

# Configure new displays when connected
xfconf-query -c displays -p /Notify -t bool -s true

# workspaces
xfconf-query -c xfwm4 -p /general/workspace_count -t int -s 4
xfconf-query -c xfwm4 -p /general/workspace_names -t string -t string -t string -t string -s 'work' -s 'mail' -s 'work mail' -s 'misc'

# power mngt
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/blank-on-ac  -t int -s 0

# top panel already exists. Reconfigure it
xfconf-query -c 'xfce4-panel' -p /panels/panel-0/autohide-behavior -t int -s 2
xfconf-query -c 'xfce4-panel' -p /panels/panel-0/background-alpha  -n -t int -s 100
xfconf-query -c 'xfce4-panel' -p /panels/panel-0/background-rgba   -n -t double -t double -t double -t double -s 0.180392 -s 0.203922 -s 0.211765 -s 1.000000
xfconf-query -c 'xfce4-panel' -p /panels/panel-0/background-style  -t int -s 1
xfconf-query -c 'xfce4-panel' -p /panels/panel-0/enter-opacity     -n -t int -s 100
xfconf-query -c 'xfce4-panel' -p /panels/panel-0/leave-opacity     -n -t int -s 100

# Add new plugins for top panel
xfconf-query -c xfce4-panel -p /plugins/plugin-30                    -n -t string -s whiskermenu

xfconf-query -c xfce4-panel -p /plugins/plugin-31                    -n -t string -s separator
xfconf-query -c xfce4-panel -p /plugins/plugin-31/expand             -n -t bool -s true
xfconf-query -c xfce4-panel -p /plugins/plugin-31/style              -n -t int -s 0

xfconf-query -c xfce4-panel -p /plugins/plugin-40                    -n -t string -s cpugraph

xfconf-query -c xfce4-panel -p /plugins/plugin-32                    -n -t string -s systray
xfconf-query -c xfce4-panel -p /plugins/plugin-32/show-frame         -n -t bool -s false
xfconf-query -c xfce4-panel -p /plugins/plugin-32/size-max           -n -t int -s 22
xfconf-query -c xfce4-panel -p /plugins/plugin-32/square-icons       -n -t bool -s true

xfconf-query -c xfce4-panel -p /plugins/plugin-33                    -n -t string -s 'notification-plugin'

xfconf-query -c xfce4-panel -p /plugins/plugin-34                    -n -t string -s indicator
xfconf-query -c xfce4-panel -p /plugins/plugin-34/blacklist          -n --force-array -t string -s 'libappmenu.so'
xfconf-query -c xfce4-panel -p /plugins/plugin-34/known-indicators   -n --force-array -t string -s 'com.canonical.indicator.messages'
xfconf-query -c xfce4-panel -p /plugins/plugin-34/square-icons       -n -t bool -s true

# on 22.04 this seems identical to plugin-32 / systray
# xfconf-query -c xfce4-panel -p /plugins/plugin-35                    -n -t string -s statusnotifier
# xfconf-query -c xfce4-panel -p /plugins/plugin-35/icon-size          -n -t int -s 22
# xfconf-query -c xfce4-panel -p /plugins/plugin-35/known-items        -n -t string -t string -s 'blueman' -s 'nm-applet'
# xfconf-query -c xfce4-panel -p /plugins/plugin-35/menu-is-primary    -n -t bool -s true
# xfconf-query -c xfce4-panel -p /plugins/plugin-35/mode-whitelist     -n -t bool -s false
# xfconf-query -c xfce4-panel -p /plugins/plugin-35/single-row         -n -t bool -s false
# xfconf-query -c xfce4-panel -p /plugins/plugin-35/square-icons       -n -t bool -s true
# xfconf-query -c xfce4-panel -p /plugins/plugin-35/symbolic-icons     -n -t bool -s true

xfconf-query -c xfce4-panel -p /plugins/plugin-36                    -n -t string -s power-manager-plugin

xfconf-query -c xfce4-panel -p /plugins/plugin-37                           -n -t string -s pulseaudio
xfconf-query -c xfce4-panel -p /plugins/plugin-37/enable-keyboard-shortcuts -n -t bool -s true
xfconf-query -c xfce4-panel -p /plugins/plugin-37/enable-mpris              -n -t bool -s true
xfconf-query -c xfce4-panel -p /plugins/plugin-37/mixer-command             -n -t string -s pavucontrol
xfconf-query -c xfce4-panel -p /plugins/plugin-37/mpris-players             -n -t string -s parole
xfconf-query -c xfce4-panel -p /plugins/plugin-37/show-notifications        -n -t bool -s true

xfconf-query -c xfce4-panel -p /plugins/plugin-38                    -n -t string -s separator
xfconf-query -c xfce4-panel -p /plugins/plugin-38/expand             -n -t bool -s false
xfconf-query -c xfce4-panel -p /plugins/plugin-38/style              -n -t int  -s 0

xfconf-query -c xfce4-panel -p /plugins/plugin-39                    -n -t string -s clock
xfconf-query -c xfce4-panel -p /plugins/plugin-39/digital-format     -n -t string -s '%a %d %b, %R'

# Top panel will now use the new plugins
xfconf-query -c xfce4-panel -p /panels/panel-0/plugin-ids \
-t int -t int -t int -t int -t int -t int -t int -t int -t int -t int \
-s 30  -s 31  -s 40  -s 32  -s 33  -s 34  -s 36  -s 37  -s 38  -s 39

# Add new plugins for bottom panel
xfconf-query -c xfce4-panel -n -p /plugins/plugin-20                  -t string -s tasklist
xfconf-query -c xfce4-panel -n -p /plugins/plugin-20/flat-buttons     -t bool -s true
xfconf-query -c xfce4-panel -n -p /plugins/plugin-20/show-handle      -t bool -s false
xfconf-query -c xfce4-panel -n -p /plugins/plugin-20/show-labels      -t bool -s true
xfconf-query -c xfce4-panel -n -p /plugins/plugin-20/sort-order       -t int -s 4
xfconf-query -c xfce4-panel -n -p /plugins/plugin-20/window-scrolling -t bool -s false
xfconf-query -c xfce4-panel -n -p /plugins/plugin-21                  -t string -s separator
xfconf-query -c xfce4-panel -n -p /plugins/plugin-21/expand           -t bool -s true
xfconf-query -c xfce4-panel -n -p /plugins/plugin-21/style            -t int -s 0
xfconf-query -c xfce4-panel -n -p /plugins/plugin-22                  -t string -s pager

# Add new bottom panel
xfconf-query -c xfce4-panel -n -p /panels/panel-1/autohide-behavior -t int -s 0
xfconf-query -c xfce4-panel -n -p /panels/panel-1/background-rgba   -t double -t double -t double -t double -s 0.180392 -s 0.203922 -s 0.211765 -s 1.000000
xfconf-query -c xfce4-panel -n -p /panels/panel-1/background-style  -t int -s 1
xfconf-query -c xfce4-panel -n -p /panels/panel-1/length            -t int -s 100
xfconf-query -c xfce4-panel -n -p /panels/panel-1/mode              -t int -s 0
xfconf-query -c xfce4-panel -n -p /panels/panel-1/nrows             -t int -s 1
xfconf-query -c xfce4-panel -n -p /panels/panel-1/plugin-ids        -t int -t int -t int -s 20 -s 21 -s 22
xfconf-query -c xfce4-panel -n -p /panels/panel-1/position          -t string -s 'p=12;x=492;y=875'
xfconf-query -c xfce4-panel -n -p /panels/panel-1/position-locked   -t bool -s true
xfconf-query -c xfce4-panel -n -p /panels/panel-1/size              -t int -s 25

# configure 2 panels in total
xfconf-query -c xfce4-panel -p /panels -t int -t int -s 0 -s 1

xfce4-panel --restart

# configure thunar
xfconf-query -c thunar -p /last-compact-view-zoom-level    -n -t string -s 'THUNAR_ZOOM_LEVEL_SMALL'
xfconf-query -c thunar -p /last-details-view-column-widths -n -t string -s '50,140,50,50,766,50,50,80,220,158'
xfconf-query -c thunar -p /last-details-view-zoom-level    -n -t string -s 'THUNAR_ZOOM_LEVEL_50_PERCENT'
xfconf-query -c thunar -p /last-icon-view-zoom-level       -n -t string -s 'THUNAR_ZOOM_LEVEL_LARGEST'
xfconf-query -c thunar -p /last-location-bar               -n -t string -s ThunarLocationEntry
xfconf-query -c thunar -p /last-separator-position         -n -t int -s 187
xfconf-query -c thunar -p /last-show-hidden                -n -t bool -s true
xfconf-query -c thunar -p /last-side-pane                  -n -t string -s void
xfconf-query -c thunar -p /last-sort-column                -n -t string -s THUNAR_COLUMN_NAME
xfconf-query -c thunar -p /last-sort-order                 -n -t string -s GTK_SORT_ASCENDING
xfconf-query -c thunar -p /last-view                       -t string -s ThunarDetailsView
xfconf-query -c thunar -p /last-window-height              -n -t int -s 610
xfconf-query -c thunar -p /last-window-maximized           -n -t bool -s false
xfconf-query -c thunar -p /last-window-width               -n -t int -s 1145
xfconf-query -c thunar -p /misc-single-click               -n -t bool -s false
xfconf-query -c thunar -p /misc-volume-management          -t bool -s true
xfconf-query -c thunar -p /shortcuts-icon-size             -t string -s THUNAR_ICON_SIZE_SMALLEST

# configure keyboard shortcuts: remove unused keyboard shortcuts
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Alt>F1'                -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Alt>F2'                -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Alt>F2/startup-notify' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Alt>F3'                -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Alt>F3/startup-notify' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Primary><Alt>Escape'   -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Primary><Alt>l'        -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Primary><Alt>t'        -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Shift>Print'           -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Super>e'               -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Super>f'               -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Super>F1'              -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Super>m'               -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Super>w'               -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/XF86Explorer'           -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/XF86Mail'               -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/XF86Messenger'          -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/XF86Music'              -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary><Alt>d'    -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary><Alt>Down' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary><Alt>End'  -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary><Alt>Home' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Alt><Control>End'  -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Alt><Control>Home' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Alt><Control>KP_1' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Alt><Control>KP_2' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Alt><Control>KP_3' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Alt><Control>KP_4' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Alt><Control>KP_5' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Alt><Control>KP_6' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Alt><Control>KP_7' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Alt><Control>KP_8' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Alt><Control>KP_9' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Alt>Insert'        -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary><Alt>KP_1' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary><Alt>KP_2' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary><Alt>KP_3' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary><Alt>KP_4' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary><Alt>KP_5' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary><Alt>KP_6' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary><Alt>KP_7' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary><Alt>KP_8' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary><Alt>KP_9' -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F1'        -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F10'       -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F11'       -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F12'       -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F2'        -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F3'        -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F4'        -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F5'        -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F6'        -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F7'        -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F8'        -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>F9'        -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Super>d'           -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Super>Down'        -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Super>KP_1'        -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Super>KP_3'        -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Super>KP_7'        -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Super>KP_9'        -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Super>Left'        -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Super>Right'       -r
xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Super>Up'          -r

# configure keyboard shortcuts: existing keyboard shortcuts, different settings
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Super>1'       -t string -s 'gnome-calculator'
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Super>2'       -t string -s 'exo-open --launch WebBrowser'
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Super>3'       -t string -s 'keepassx'
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Super>4'       -t string -s 'firefox %u -P Adzuna'
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Super>5'       -n -t string -s 'google-chrome-stable %U'
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/XF86Calculator' -t string -s 'gnome-calculator'
xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Super>w'       -n -t string -s 'xfce4-appfinder'

# desktop notification settings
xfconf-query -c xfce4-notifyd -p /do-not-disturb         -n -t bool -s false
xfconf-query -c xfce4-notifyd -p /applications/muted_applications \
-t string          -t string   \
-s 'google-chrome' -s 'Skype' 

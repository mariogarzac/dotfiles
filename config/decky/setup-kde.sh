#!/bin/bash

echo "Setting up KDE configuration..."

# Wait for KWin to be ready
sleep 2

# ===========================
# VIRTUAL DESKTOPS SETUP
# ===========================
echo "Configuring 6 virtual desktops..."
kwriteconfig6 --file kwinrc --group Desktops --key Number 6
kwriteconfig6 --file kwinrc --group Desktops --key Rows 1

# Name the desktops
kwriteconfig6 --file kwinrc --group Desktops --key Name_1 "1"
kwriteconfig6 --file kwinrc --group Desktops --key Name_2 "2"
kwriteconfig6 --file kwinrc --group Desktops --key Name_3 "3"
kwriteconfig6 --file kwinrc --group Desktops --key Name_4 "4"
kwriteconfig6 --file kwinrc --group Desktops --key Name_5 "5"
kwriteconfig6 --file kwinrc --group Desktops --key Name_6 "6"

# ===========================
# KWIN SHORTCUTS
# ===========================
echo "Setting up KWin shortcuts..."

# Switch to Desktop shortcuts (Alt+1 through Alt+6)
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch to Desktop 1" "Alt+1,none,Switch to Desktop 1"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch to Desktop 2" "Alt+2,none,Switch to Desktop 2"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch to Desktop 3" "Alt+3,none,Switch to Desktop 3"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch to Desktop 4" "Alt+4,none,Switch to Desktop 4"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch to Desktop 5" "Alt+5,none,Switch to Desktop 5"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch to Desktop 6" "Alt+6,none,Switch to Desktop 6"

# Window to Desktop shortcuts (Alt+Shift+Number)
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Window to Desktop 1 and Switch" "Alt+!,none,Window to Desktop 1 and Switch"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Window to Desktop 2 and Switch" "Alt+@,none,Window to Desktop 2 and Switch"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Window to Desktop 3 and Switch" "Alt+#,none,Window to Desktop 3 and Switch"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Window to Desktop 4 and Switch" "Alt+\$,none,Window to Desktop 4 and Switch"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Window to Desktop 5 and Switch" "Alt+%,none,Window to Desktop 5 and Switch"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Window to Desktop 6 and Switch" "Alt+^,none,Window to Desktop 6 and Switch"
# Window Maximize
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Window Maximize" "Alt+F,none,Maximize Window"

# ===========================
# DISABLE CONFLICTING SHORTCUTS
# ===========================
echo "Disabling conflicting shortcuts..."

# Disable KRunner (we're using Rofi)
kwriteconfig6 --file kglobalshortcutsrc --group org.kde.krunner.desktop --key "_launch" "none,none,KRunner"

# Disable Plasma Search
kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate task manager entry 1" "none,none,Activate Task Manager Entry 1"
kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate task manager entry 2" "none,none,Activate Task Manager Entry 2"
kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate task manager entry 3" "none,none,Activate Task Manager Entry 3"
kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate task manager entry 4" "none,none,Activate Task Manager Entry 4"
kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate task manager entry 5" "none,none,Activate Task Manager Entry 5"
kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate task manager entry 6" "none,none,Activate Task Manager Entry 6"

# ===========================
# ROFI CUSTOM COMMAND
# ===========================
echo "Setting up Rofi launcher..."

# Create the custom command entry
kwriteconfig6 --file kglobalshortcutsrc --group "launch_rofi.desktop" --key "_launch" "Alt+Space,none,Launch Rofi"

# Create the actual .desktop file for the custom command
mkdir -p ~/.local/share/kservices5
cat > ~/.local/share/kservices5/launch_rofi.desktop << 'EOF'
[Desktop Entry]
Type=Service
Name=Launch Rofi
Exec=rofi -show drun -theme ~/.config/rofi/config.rasi
Icon=system-search
X-KDE-Shortcuts=Alt+Space
EOF

# ===========================
# APPLY CHANGES
# ===========================
echo "Restarting KWin to apply changes..."
qdbus org.kde.KWin /KWin reconfigure

# For Plasma 6, kglobalaccel is managed differently
# Just restart plasmashell to reload shortcuts
echo "Reloading shortcuts..."
kquitapp6 kglobalaccel 2>/dev/null
sleep 1

echo ""
echo "==================================="
echo "KDE configuration complete!"
echo "==================================="
echo ""
echo "Changes applied:"
echo "  ✓ 6 virtual desktops created"
echo "  ✓ Alt+1-6 to switch desktops"
echo "  ✓ Alt+Shift+1-6 to move windows"
echo "  ✓ Alt+F to maximize windows"
echo "  ✓ Alt+Space for Rofi"
echo ""
echo "If shortcuts don't work immediately:"
echo "  1. Log out and back in (recommended)"
echo "  2. Or restart plasmashell: kquitapp6 plasmashell && plasmashell &"
echo ""

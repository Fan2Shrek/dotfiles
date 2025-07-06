#!/bin/bash

THEME_FILE="$1.theme"
[ ! -f "$THEME_FILE" ] && { echo "Theme not found: $THEME_FILE"; exit 1; }

KITTY_FILE="$HOME/.config/kitty/current_theme.conf"
HYPRLAND_FILE="$HOME/.config/hypr/colors.conf"
GTK_FILE="$HOME/.config/gtk-3.0/settings.ini"
FAST_FETCH_DIR="$HOME/.config/fastfetch"

# Load theme into bash variables
declare -A colors
while IFS="=" read -r key value; do
  key=$(echo "$key" | xargs)
  value=$(echo "$value" | xargs)
  [[ $key == \#* || -z $key ]] && continue
  colors[$key]="$value"
done < "$THEME_FILE"

# Generate kitty.conf
cat > $KITTY_FILE <<EOF
background ${colors[background]}
foreground ${colors[foreground]}
cursor ${colors[cursor]}
color0 ${colors[color0]}
color1 ${colors[color1]}
color2 ${colors[color2]}
color3 ${colors[color3]}
color4 ${colors[color4]}
color5 ${colors[color5]}
color6 ${colors[color6]}
color7 ${colors[color7]}
EOF

# Generate gtk.ini
THEME_NAME=$(echo "$1" | tr '[:upper:]' '[:lower:]')
sed -i "s/^[[:space:]]*gtk-theme-name[[:space:]]*=.*/gtk-theme-name = $THEME_NAME/" "$GTK_FILE"

# Generate hyprland.conf
cat > $HYPRLAND_FILE <<EOF
\$surface = rgb(${colors[background]#\#})
\$scrim = rgb(${colors[foreground]#\#})
EOF

# Generate fastfetch config
cat "$FAST_FETCH_DIR/themes/$1.txt" > "$FAST_FETCH_DIR/current.txt"

sleep 0.5
hyprctl reload

function light_theme() {
  # gtk
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'

  # terminal
  sed -i 's/dark.toml/light.toml/' ~/.config/alacritty/alacritty.toml
  sed -i 's|theme = "ayu_evolve"|theme = "solarized_light"|' ~/.config/helix/config.toml
  
  # waybar
  sed -i 's/@dark/@light/' ~/.config/waybar/style.css
}

function dark_theme() {
  # gtk
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

  # terminal
  sed -i 's/light.toml/dark.toml/' ~/.config/alacritty/alacritty.toml
  sed -i 's|theme = "solarized_light"|theme = "ayu_evolve"|' ~/.config/helix/config.toml

  # waybar
  sed -i 's/@light/@dark/' ~/.config/waybar/style.css
}

function restart_waybar(){
  pkill waybar && hyprctl dispatch exec waybar 
}

if [ "$(gsettings get org.gnome.desktop.interface color-scheme)" = "'prefer-dark'" ]; then
    light_theme
else
    dark_theme
fi

restart_waybar

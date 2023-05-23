#!/USR/BIN/ENV BASH
#
# TODO: СДЕЛАТЬ НУМЕРОВАНЫЙ СПИСОК ИКОНОК И ПРИНИМАТЬ КАК АРГУМЕНТ ТОЛЬКО ИКОНКУ.
#
ICONS_LIST="\N \N  \N  \N \N \N \N \N \N \N \N \N \N \N \N \N \N \N \N \N"
PRESET_LIST="
CFG
EDIT
SSH
X7
TERMINAL
JP
I3
CS"

NAMES_LIST="
ANSIBLE
DEPLOY
EDIT
FIREFOX
I3
MSGR
DEV
STAGE
PROD
TERMINAL"

# icon=$(echo -e "${ICONS_LIST}" | rofi -dmenu -p "SET ICON")
prefix="$(echo -e "${PRESET_LIST}" | rofi -dmenu -p "SET PREFIX")"
if [[ ! -z "$prefix" ]]; then
  label="$icon $prefix | $(echo -e "${NAMES_LIST}" | rofi -dmenu -p "SET NAME")"
else
  label="$icon $prefix $(echo -e "${NAMES_LIST}" | rofi -dmenu -p "SET NAME")"

fi

echo "$label"

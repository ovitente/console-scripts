#!/usr/bin/env bash
#
# TODO: СДЕЛАТЬ НУМЕРОВАНЫЙ СПИСОК ИКОНОК И ПРИНИМАТЬ КАК АРГУМЕНТ ТОЛЬКО ИКОНКУ.
#
ICONS_LIST="\N \N  \N  \N \N \N \N \N \N \N \N \N \N \N \N \N \N \N \N \N"
PRESET_LIST="
CFG |
EDIT |
SSH |
X7 |
TERMINAL |
JP |
I3 |
CS | "

NAMES_LIST="
BROWSER
ANSIBLE
DEPLOY
EDIT
FIREFOX
I3
MESSENGER
DEV
STAGE
PROD
TERMINAL"

# icon=$(echo -e "${ICONS_LIST}" | rofi -dmenu -p "SET ICON")
CURRENT_NAME=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2 | cut -c 4-)
answer="$(echo -e "${CURRENT_NAME}" | rofi -dmenu -p "CHANGE NAME")"
if [[ ! -z "$answer" ]]; then
# if [[ "$answer" -ne "$CURRENT_NAME" ]] || [[ ! -z "$answer" ]]; then
  prefix="$(echo -e "${PRESET_LIST}" | rofi -dmenu -p "SET PREFIX")"
  label="$prefix $(echo -e "${NAMES_LIST}" | rofi -dmenu -p "SET NAME")"
else
  echo "$CURRENT_NAME"
  exit 0
fi

echo "$label"

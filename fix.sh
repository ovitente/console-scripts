COMMANDS_LIST='
sudo ln /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin/kubectl /usr/local/bin/kubectl # Fix kubectl after install via gcloud components
'

choise=$(echo -n "${COMMANDS_LIST}" | fzf )
echo -n "$choise" | pbcopy

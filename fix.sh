COMMANDS_LIST='
sudo ln /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin/kubectl /usr/local/bin/kubectl # Fix kubectl after install via gcloud components
sudo ln -s /Users/det/Library/Application\ Support/cloud-code/installer/google-cloud-sdk/bin/gke-gcloud-auth-plugin /usr/local/bin
'

choise=$(echo -n "${COMMANDS_LIST}" | fzf )
echo -n "$choise" | pbcopy

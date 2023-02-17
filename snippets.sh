COMMANDS_LIST='
ag --nobreak --nonumbers --noheading . | fzf
ansible all -m shell -a "echo test"
cat .gitlab-ci.yml | pbcopy
cat FILE | base64 -w0 | xclip -selection clipboard
circleci config validate config.yaml
docker build -t $(basename $(pwd)) .
docker build -t $(basename $(pwd)) . --build-arg CI_PROJECT_NAME="$(basename $(pwd))" --build-arg CI_PROJECT_NAMESPACE="vcg"
git add . && git commit -a && git push
git commit --amend --author="Ivan Kostrubin <ivan.kostrubin01@currys.co.uk>"
git config --global user.email "ivan.kostrubin01@currys.co.uk"
git config --global user.name "Ivan Kostrubin"
grep --line-buffered --color=never -r "" * | fzf
grep -rnw './' -e 'testtosearch' # Search test in files
hcloud server create --image=ubuntu-22.04 --type=cpx41 --location=hel1 --ssh-key=IvanKostrubin --user-data-from-file=userdata.yaml --name instance-name
python3 -m http.server
rsync -av -P server:~/unsted/movie.mkv .
rsync -rvhH --delete --progress /Users/det/x7/Pictures /Volumes/
s/^\(.*\)\(\n\1\)\+// # Delete all strings but uniq. List MUST BE SORTED
shell openssl x509 -enddate -noout -in  %s
ssh -C2qTnN -D 8080 proxy
sudo lsof -i -P -n | grep LISTEN # Port scan
sudo lsof -i:22 ## see a specific port such as 22 ## # Port scan
sudo netstat -tulpn | grep LISTEN # Port scan
sudo nmap -sTU -O IP-address-Here
sudo ss -tulpn | grep LISTEN
'

choise=$(echo -n "${COMMANDS_LIST}" | fzf )
# choise=$(echo -n "${COMMANDS_LIST}" | rofi -dmenu -p "Choose fast cmd")
echo -n "$choise" | pbcopy
# pbpaste

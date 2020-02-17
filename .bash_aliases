alias docker='sudo docker'
alias docker-compose='sudo docker-compose'
alias Deset='docker stop $(docker ps -q); docker container prune -f'

alias est="sudo netstat -tunap | grep ESTABLISHED"
alias listen="sudo netstat -tunap | grep LISTEN"

# Start the VPN connection
alias VPN='cd /etc/openvpn/client/ ; sudo openvpn --config client.conf &> /dev/null &'

alias Logs='tail -f ~/log/dionaea.json'

function Enter () { docker exec -it $(docker ps | grep "$1" | awk '{print $1}') bash; }

function Prune () { docker rmi $(docker images | grep "\<none\>" | awk '{print $3}'); }

### Outdated, use docker-compose
#alias Dio='docker run -d --rm -v $HOME/Dionaea/log_json.yaml:/opt/dionaea/etc/dionaea/ihandlers/log_json.yaml -p 21:21 -p 42:42 -p 69:69/udp -p 80:80 -p 135:135 -p 443:443 -p 445:445 -p 1433:1433 -p 1723:1723 -p 1883:1883 -p 1900:1900/udp -p 3306:3306 -p 5060:5060 -p 5060:5060/udp -p 5061:5061 -p 11211:11211 dionaea'
#alias Dio='docker run -d --rm -v $HOME/Dionaea/log_json.yaml:/opt/dionaea/etc/dionaea/ihandlers/log_json.yaml -v $HOME/log:/opt/diolog -p 3306:3306 -p 21:21 dionaea'

alias buildDio='docker build . --rm --tag=dionaea'
alias Deset='docker stop $(docker ps -q); docker container prune -f'

alias sqlLogs='sqlite3 /opt/dionaea/var/lib/dionaea/dionaea.sqlite'
alias jsonLogs='tail -f /opt/dionaea/var/lib/dionaea/dionaea.json'
alias DioBin='ls /opt/dionaea/var/lib/dionaea/binaries/'

alias PUSH='git add . && git commit -m "drive" && git push origin master'
export PATH="$PATH:/opt/dionaea/bin"

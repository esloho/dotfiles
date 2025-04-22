# General
alias l='ls -laFG'

# docker & docker-compose
alias dc='docker compose'
alias dcs='docker compose stop'
alias dcb='docker compose build'
alias dcub='docker compose up --build -d'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dce='docker compose exec'
alias dcl='docker compose logs -f'
alias dcr='docker compose restart'

# Google Cloud
alias gsh='gcloud compute ssh'
alias k='kubectl'

# git
alias gs='git status'
alias gb='git branch'
alias goto='git checkout'
alias gf='git fetch'
alias gc='git commit -am'
alias gfix='git commit -a --amend --no-edit'
alias gm='git merge'
alias gpull='git pull'
alias gpush='git push'
alias gforce='git push --force-with-lease'
alias glg='git lg'
alias gdiff='git diff'

# Maven
#alias mvn='export JAVA_TOOL_OPTIONS="-Xmx4096m -XX:MaxPermSize=2048m -Xms2048m"; color_maven'
#alias maven=$M2_HOME/bin/mvn
#alias mi='mvn install'
#alias mci='mvn clean install'
#alias mcit='mci -DskipTests'

# Elixir & Mix
alias mixc='mix compile --warnings-as-errors'
alias mixg='mix graphql.schema.dump'
alias mixq='mix queries.dump'

# Python
alias python='python3'
alias pip='pip3'

alias new_uuid=$'python -c "import uuid; print(uuid.uuid4(), end=\'\')" | pbcopy'

# Tinybird
export REDIS_CONF=/Users/esloho/tinybird/redis
alias tb_redis='redis-server $REDIS_CONF/redis1.conf; redis-server $REDIS_CONF/redis2.conf'
alias tb_sentinel='redis-sentinel $REDIS_CONF/sentinel1.conf; redis-sentinel $REDIS_CONF/sentinel2.conf; redis-sentinel $REDIS_CONF/sentinel3.conf'

alias chc1='clickhouse client -h clickhouse-01 --port 9000'
alias chc2='clickhouse client -h clickhouse-02 --port 9001'
alias chcin='clickhouse client -h clickhouse-internal-01 --port 9002'

alias vn='varnishd -a :6081 -T 127.0.0.1:6082 -f /Users/esloho/tinybird/dev/analytics/ch_lb.vcl -s malloc,32m -F -p max_retries=1'
alias tb_services='brew services start kafka; /Users/esloho/tinybird/zookeeper-3.8.1/bin/zkServer.sh start; vn'
alias tb_services_stop='brew services stop kafka; /Users/esloho/tinybird/zookeeper-3.8.1/bin/zkServer.sh stop'

#alias tbmux='tmuxp load ./tb_tmux.yaml -d; tmux a'
alias tbmux='tmuxp load ~/tinybird/tb_tmux.yaml -d; tmux a'

alias tba='tinybird_server --port 8001'
alias tbas='ps -ef | grep "tinybird_server" | grep -v grep | awk "{print $2}" | xargs kill -9'
alias tbasp='ps -ef | grep "analytics/.e/bin/python" | grep -v grep | awk "{print $2}" | xargs kill -9'
alias tbastop='tbas & tbasp' 

alias awsprod='aws sso login --profile=production'


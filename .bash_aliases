# General
alias l='ls -laFG'

# docker & docker-compose
alias dc='docker compose'
alias dcs='docker compose stop'
alias dcb='docker compose build'
alias dcub='docker compose up --build -d'
alias dcu='docker compose up -d'
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
alias mvn='export JAVA_TOOL_OPTIONS="-Xmx4096m -XX:MaxPermSize=2048m -Xms2048m"; color_maven'
alias maven=$M2_HOME/bin/mvn
alias mi='mvn install'
alias mci='mvn clean install'
alias mcit='mci -DskipTests'

# Elixir & Mix
alias mixc='mix compile --warnings-as-errors'
alias mixg='mix graphql.schema.dump'
alias mixq='mix queries.dump'


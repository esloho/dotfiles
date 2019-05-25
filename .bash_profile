export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home
#export JAVA_TOOL_OPTIONS="-Xmx4096m -XX:MaxPermSize=2048m -Xms2048m"
export M2_HOME=/opt/maven
export MAVEN_OPTS="-Dmaven.multiModuleProjectDirectory -Djava.awt.headless=true -Xmx4096m -XX:MaxPermSize=2048m -Xms4095m"
export GRADLE_HOME=/opt/gradle
export GRADLE_OPTS="-Xmx768m -XX:MaxPermSize=128"
export SEEDTAG_HOME=$HOME/seedtag/devenvironment

#Colorize Maven Output
# Colors reference: http://en.wikipedia.org/wiki/ANSI_escape_code
color_maven() {
  $M2_HOME/bin/mvn $* | sed \
    -e 's/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/[32;1mTests run: \1[0m, Failures: [31;1m\2[0m, Errors: [33;1m\3[0m, Skipped: [34;1m\4[0m/g' \
    -e 's/\(\[INFO\] \-[-]*$\)/[36;1m\1[0m/g' \
    -e 's/\(\[INFO\] Building.*\)/[36;1m\1[0m/g' \
    -e 's/\(.*WARN.*\)/[33;1m\1[0m/g' \
    -e 's/\(.*ERROR.*\)/[31;1m\1[0m/g' \
    -e 's/\(Downloaded:.*\)/[32;1m\1[0m/g'
}
alias mvn='export JAVA_TOOL_OPTIONS="-Xmx4096m -XX:MaxPermSize=2048m -Xms2048m"; color_maven'
alias maven=$M2_HOME/bin/mvn
alias mi='mvn install'
alias mci='mvn clean install'
alias mcit='mci -DskipTests'

alias l='ls -laFG'

############## Docker and kubernetes #########################

alias remove-all-containers="docker ps -aq | xargs docker stop && docker ps -aq | xargs docker rm"
alias remove-all-images="docker rmi \$( docker images -a | grep '<none>' | tr -s ' ' | cut -d ' ' -f 3)"

alias dc='docker-compose'
alias dcs='docker-compose stop'
alias dcb='docker-compose build'
alias dcub='docker-compose up --build -d'
alias dcu='docker-compose up -d'
alias dce='docker-compose exec'
alias dcl='docker-compose logs -f'
alias dcr='docker-compose restart'

alias gsh='gcloud compute ssh'
alias k='kubectl'

# Google Cloud Platform
source /opt/google-cloud-sdk/completion.bash.inc
source /opt/google-cloud-sdk/path.bash.inc

export GCE_INI_PATH=~/seedtag/ansible/inventory/gce.ini


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#PATH=/usr/local/bin:${PATH/:\/usr\/local\/bin}

export CLICOLOR=1

############## Git #########################

source /usr/local/git/contrib/completion/git-prompt.sh
source /usr/local/git/contrib/completion/git-completion.bash

# Turn the prompt symbol red if the user is root
if [ $(id -u) -eq 0 ] ; then
    # you are root, make the prompt red
    PS1='\[\033[31m\]\u@\h:\w\[\033[32m\]$(__git_ps1 " (%s)")\[\033[31m\]#\[\033[0m\] '
else
    PS1='\[\033[32m\]\u@\h: \[\033[34m\]\w\[\033[35m\]$(__git_ps1 " (%s)")\[\033[34m\] $\[\033[0m\] '
fi
export PS1

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS=true

alias gs='git status'
alias gb='git branch'
alias go='git checkout'
alias gf='git fetch'
alias gc='git commit -am'
alias gm='git merge'
alias gpull='git pull'
alias gpush='git push'
alias glg='git lg'
alias gdiff='git diff'

__git_complete go _git_checkout
__git_complete gb _git_branch
__git_complete gm _git_merge

# MacPorts Installer addition on 2017-01-26_at_16:50:07: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH


# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

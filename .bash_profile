export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home
export M2_HOME=/opt/maven

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
alias mvn=color_maven
alias maven=$M2_HOME/bin/mvn
alias mi='mvn install'
alias mic='mvn clean install'

alias l='ls -laFG'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#PATH=/usr/local/bin:${PATH/:\/usr\/local\/bin}

export CLICOLOR=1

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

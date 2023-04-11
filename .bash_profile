source ~/.bashrc

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home
#export JAVA_TOOL_OPTIONS="-Xmx4096m -XX:MaxPermSize=2048m -Xms2048m"
export M2_HOME=/opt/maven
export MAVEN_OPTS="-Dmaven.multiModuleProjectDirectory -Djava.awt.headless=true -Xmx4096m -XX:MaxPermSize=2048m -Xms4095m"
export GRADLE_HOME=/opt/gradle
export GRADLE_OPTS="-Xmx768m -XX:MaxPermSize=128"

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

# Google Cloud Platform
#source /usr/lib/google-cloud-sdk/completion.bash.inc
#source /usr/lib/google-cloud-sdk/path.bash.inc

#export GCE_INI_PATH=~/seedtag/ansible/inventory/gce.ini


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#PATH=/usr/local/bin:${PATH/:\/usr\/local\/bin}

export CLICOLOR=1

############## Git #########################

#source /etc/bash_completion.d/git-prompt
#source /etc/bash_completion.d/git-completion.bash

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

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

__git_complete goto _git_checkout
__git_complete gb _git_branch
__git_complete gm _git_merge

# MacPorts Installer addition on 2017-01-26_at_16:50:07: adding an appropriate PATH variable for use with MacPorts.
#export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

################ Python #########################

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
#export PATH


############### Elixir #################
. $(brew --prefix asdf)/asdf.sh

export CFLAGS="-O2 -g -fno-stack-check"
export KERL_CONFIGURE_OPTIONS="--disable-hipe --with-ssl=$(brew --prefix openssl)"
export KERL_CONFIGURE_OPTIONS="--disable-hipe --without-javac --with-ssl=$(brew --prefix openssl)"


############## MacOS #################
export BASH_SILENCE_DEPRECATION_WARNING=1

############## asdf ##################
. /usr/local/opt/asdf/libexec/asdf.sh

source ~/.bashrc

export LANG="en_US.UTF-8"

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#PATH=/usr/local/bin:${PATH/:\/usr\/local\/bin}

export CLICOLOR=1

############## Git #########################

source /opt/homebrew/etc/bash_completion.d/git-completion.bash
source /opt/homebrew/etc/bash_completion.d/git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS=

if [ $(id -u) -eq 0 ] ; then
    # you are root, make the prompt red
    PS1='\[\033[31m\]\u@\h:\w\[\033[32m\]$(__git_ps1 " (%s)")\[\033[31m\]#\[\033[0m\] '
else
    #PS1='\[\033[32m\]\u@\h: \[\033[34m\]\w\[\033[35m\]$(__git_ps1 " (%s)")\[\033[34m\] $\[\033[0m\] ' #version for no- TB prompt
    PS1='\[\033[32m\]\u@\h: \[\033[34m\]\w\[\033[35m\]$(__git_ps1 " (%s)")\[\033[34m\]'
fi
export PS1

__git_complete goto _git_checkout
__git_complete gb _git_branch
__git_complete gm _git_merge


############### Elixir #################
#. $(brew --prefix asdf)/asdf.sh

#export CFLAGS="-O2 -g -fno-stack-check"
#export KERL_CONFIGURE_OPTIONS="--disable-hipe --with-ssl=$(brew --prefix openssl)"
#export KERL_CONFIGURE_OPTIONS="--disable-hipe --without-javac --with-ssl=$(brew --prefix openssl)"


############## MacOS #################
export BASH_SILENCE_DEPRECATION_WARNING=1


############## asdf ##################
. "$(brew --prefix asdf)/libexec/asdf.sh"
. "$(brew --prefix asdf)/etc/bash_completion.d/asdf.bash"


############# Java ##################
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home"

launchctl setenv JAVA_HOME $JAVA_HOME

############ Tinybird ##############

export PATH="/opt/homebrew/opt/curl/bin:$PATH"

export CH_LB_HOST=ci_ch CH_LB_PORT=6081

export KAFKA_PATH="/Users/esloho/tinybird/kafka_2.13-3.4.0/"

prompt_tb() {
if [ -e ".tinyb" ]; then
    TB_CHAR="🐣"
    branch_name=`grep '"name":' .tinyb | cut -d : -f 2 | cut -d '"' -f 2`
    region=`grep '"host":' .tinyb | cut -d / -f 3 | cut -d . -f 2 | cut -d : -f 1`
    if [ "$region" = "tinybird" ]; then
    region=`grep '"host":' .tinyb | cut -d / -f 3 | cut -d . -f 1`
    fi
    TB_BRANCH=" ${TB_CHAR} tb:${region}=>${branch_name}"
else
    TB_BRANCH=''
fi

echo $TB_BRANCH
}

################ Python #########################

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
#export PATH

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

################ Misc ###########################

#export PS1="$PS1\[\033[31m\]\$(prompt_tb)\[\033[0m\]"
export PS1="$PS1\[\033[31m\]\$(prompt_tb)\[\033[0m\]\[\033[34m\] $\[\033[0m\] "

export HOMEBREW_NO_AUTO_UPDATE=1

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/esloho/google-cloud-sdk/path.bash.inc' ]; then . '/Users/esloho/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/esloho/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/esloho/google-cloud-sdk/completion.bash.inc'; fi

ulimit -n 2048


# Added by OrbStack: command-line tools and integration
# Comment this line if you don't want it to be added again.
source ~/.orbstack/shell/init.bash 2>/dev/null || :

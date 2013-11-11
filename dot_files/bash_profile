# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m[\w]\n\u@\h\[\033[00m\]:\$ '
export PS1

# set EPOS variable to ambient
if [ -d "/usr/local/lib/epos" ]; then
	EPOS="/usr/local/lib/epos"
	export EPOS
fi

# set JAVA_HOME variable to ambient
if [ -d "/usr/lib/jvm/java-7-oracle" ]; then
	JAVA_HOME="/usr/lib/jvm/java-7-oracle"
	export JAVA_HOME
fi

# set ECLIPSE variable to ambient
if [ -d "/usr/local/lib/eclipse" ]; then
	ECLIPSE="/usr/local/lib/eclipse"
	export ECLIPSE
fi

# set YOXOS variable to ambient
if [ -d "/usr/local/lib/yoxos_launcher" ]; then
	YOXOS="/usr/local/lib/yoxos_launcher"
	export YOXOS
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# add EPOS bin to the PATH variable
if [ -d "$HOME/Workspace/Bash/bin" ]; then
	PATH="$HOME/Workspace/Bash/bin:$PATH"
fi

# set CATALINA_HOME 
if [ -d "/usr/local/lib/apache-tomcat" ]; then
   CATALINA_HOME="/usr/local/lib/apache-tomcat"
   export CATALINA_HOME
fi

PATH="$PATH:/sbin/"

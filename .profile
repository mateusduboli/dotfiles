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

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# programs dir
PROGRAMS=/usr/local/lib

# EPOS Path
if [ -d "$HOME/Workspace/EPOS/EPOS_Install" ]; then
	EPOS="$HOME/Workspace/EPOS/EPOS_Install"
	export EPOS
fi

# EPOS bin
if [ -d "$EPOS/bin" ]; then
    PATH="$EPOS/bin:$PATH"
fi

# ARM bin
if [ -d "/usr/local/arm/gcc/bin" ]; then
    PATH="/usr/local/arm/gcc/bin:$PATH"
fi

# IA32 bin
if [ -d "/usr/local/ia32/gcc/bin" ]; then
    PATH="/usr/local/ia32/gcc/bin:$PATH"
fi

# Yoxos Path
if [ -d "$PROGRAMS/yoxos_launcher" ]; then
	YOXOS="$PROGRAMS/yoxos_launcher"
	export YOXOS
fi

# Java Home
if [ -d "/usr/lib/jvm/java-7-oracle/" ]; then
	JAVA_HOME="/usr/lib/jvm/java-7-oracle"
	export JAVA_HOME
fi

# Eclipse Home
if [ -d "$PROGRAMS/eclipse/" ]; then
	ECLIPSE_HOME="$PROGRAMS/eclipse/"
	export ECLIPSE_HOME
fi

# Catalina Home
if [ -d "$PROGRAMS/apache-tomcat-7.0.35" ]; then
	CATALINA_HOME="$PROGRAMS/apache-tomcat-7.0.35"
	export CATALINA_HOME
fi

# SystemC Include
if [ -d "$PROGRAMS/systemc-2.3.0" ]; then
	SYSTEMC="$PROGRAMS/systemc-2.3.0"
	export SYSTEMC
fi

# Jason Home
if [ -d "$PROGRAMS/jason-1.3.9" ]; then
	JASON_HOME="$PROGRAMS/jason-1.3.9"
	export JASON_HOME
fi

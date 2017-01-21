# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Start the gpg-agent if not already running
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
	gpg-connect-agent /bye >/dev/null 2>&1
fi

# Kill all ssh-agent things
pkill ssh-agent

# Set GPG TTY
export GPG_TTY=$(tty)

# Set SSH to use gpg-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_BY:-0}" -ne $$ ]; then
	#export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
	# Do I remember why I put this here, rather than the line above?
	# Perhaps Googling that particular path will help. I believe this is a Fedora-specific configuration
	# Might want to consider writing a blog post about it.
	export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
	export GPG_AGENT_INFO
fi

# Refresh gpg-agent tty in case user switches to an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

# User specific aliases and function
export PS1="\[$(tput bold)\]\[$(tput setaf 7)\][\u\[$(tput setaf 0)\]@\[$(tput setaf 7)\]\H\[$(tput setaf 4)\]:\W\[$(tput setaf 7)\]]\\$ \[$(tput sgr0)\]"

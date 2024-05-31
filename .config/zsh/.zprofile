# ~/.zprofile
# 
# Order of file load --> .zshenv → .zprofile → .zshrc → .zlogin → .zlogout
#
# Loaded for login shells (interactive and non-interactive).
# Ideal for setting PATH and other environment variables for new terminal sessions.

eval "$(/opt/homebrew/bin/brew shellenv)"

# Setting PATH for Python 3.10
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
export PATH

##
# Your previous /Users/karimstekelenburg/.zprofile file was backed up as /Users/karimstekelenburg/.zprofile.macports-saved_2023-02-24_at_10:50:15
##

# MacPorts Installer addition on 2023-02-24_at_10:50:15: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2023-02-24_at_10:50:15: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your MANPATH environment variable for use with MacPorts.

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

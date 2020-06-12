set -gx PATH /opt/bin $PATH
set -gx USE_CCACHE 1
set -gx CCACHE_DIR ~/.ccache
set -gx CC "ccache gcc"
alias CC="ccache gcc"
alias gcc="ccache gcc"
alias g++="ccache g++"

alias repo2sync="repo sync -c -j(nproc --all) --force-sync --no-clone-bundle --no-tags"
set -gx PATH /opt/bin $PATH
set -gx USE_CCACHE 1
set -gx CCACHE_DIR ~/.ccache
set -gx CC "ccache gcc"
alias CC="ccache gcc"
alias gcc="ccache gcc"
alias g++="ccache g++"
function ssh-automate
        eval (ssh-agent -c)
        ssh-add ~/.ssh/id_ed25519
end
sudo chown -R anbuilder:anbuilder ~/android/

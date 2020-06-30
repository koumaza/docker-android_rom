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
function setupgit
        while true
                read name -p "echo -e 'Your Name: |> '"
                git config --global user.name "$name"
                if test $status = 0
                        break
                end
        end
        while true
                read email -p "echo -e 'Email Address: |> '"
                git config --global user.email "$email"
                if test $status = 0
                        break
                end
        end
end
sudo chown -R anbuilder:anbuilder ~/android/

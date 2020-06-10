ARG   VERSION=latest
FROM  ubuntu:$VERSION

USER  root
ARG   VERSION
RUN   echo -e 'Version': $VERSION'\n''Build date: '$(date) > /etc/image_version

# Apt

ARG   apt_user_packages='colordiff fish git neovim vim'
ARG   apt_requ_packages='bc bison build-essential curl flex gcc-multilib git-core g++-multilib gnupg gperf lib32ncurses5-dev lib32readline-gplv2-dev lib32z1-dev lib32z-dev libc6-dev libc6-dev-i386 libesd0-dev libgl1-mesa-dev libncurses5-dev libsdl1.2-dev libwxgtk2.8-dev libx11-dev libxml2 libxml2-utils lzop maven ncftp openjdk-8-jdk openjdk-8-jre pngcrush schedtool screen squashfs-tools tmux unzip w3m x11proto-core-dev xsltproc zip zlib1g-dev'
ARG   apt_addi_packages='python2-pip python3-pip jq p7zip-full zstd'
RUN   apt update ;\
      apt full-upgrade ;\
      apt install -y $apt_user_packages $apt_requ_packages $apt_addi_packages

# Bin

RUN   mkdir /opt/bin ;\
      curl https://storage.googleapis.com/git-repo-downloads/repo > /opt/bin/repo ;\
      chmod a+x /opt/bin/repo ;\
      ln -s /opt/bin/repo /usr/bin/repo ;\
      gpg --recv-key 8BB9AD793E8E6153AF0F9A4416530D5E920F5C65 ;\
      curl https://storage.googleapis.com/git-repo-downloads/repo.asc | gpg --verify - /opt/bin/repo
      
# User

RUN   useradd anbuilder -md /android-build/ ;\
      echo 'anbuilder ALL=NOPASSWD: ALL' >> /etc/sudoers ;\
      echo 'anbuilder:tin' > /android-build/password-info ;\
      chpasswd < /android-build/password-info
      
# Login
USER    anbuilder
WORKDIR /android-build
## Copy document
COPY    document/ /android-build/
## Copy dot files
COPY    script/*  /android-build/
CMD     ["fish --login"]

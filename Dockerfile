ARG   VERSION=latest
FROM  ubuntu:$VERSION

USER  root
ARG   VERSION
RUN   echo -e 'Version': $VERSION'\n''Build date: '$(date) > /etc/image_version

# Install requirements
ARG   apt_packages='fish neovim'
RUN   apt install -y $apt_packages

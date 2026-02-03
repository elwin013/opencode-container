FROM registry.fedoraproject.org/fedora:43

# Install base dependencies
RUN dnf install npm git \
    curl wget gnupg jq  ca-certificates  \
    vim nano make \
    zip unzip procps ripgrep tree ImageMagick -y && \
    dnf clean all

# Store globally installed packages in /root/.npm-global
ENV NPM_CONFIG_PREFIX=/root/.npm-global
ENV PATH=$NPM_CONFIG_PREFIX/bin:$PATH

RUN mkdir -p /root/.npm-global && \
  mkdir -p /root/.config && \
  mkdir -p /root/.local 


RUN npm install -g opencode-ai && \
  echo "Installed Open Code version: $(opencode --version)"

# Install custom dependencies here - for example, to install Java 25, uncomment the following line:
# RUN dnf install -y java-25-openjdk && dnf clean all

WORKDIR /app
CMD ["opencode"]
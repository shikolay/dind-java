FROM gradle:6.4.1-jdk11

RUN apt-get update
RUN apt-get install -y apt-transport-https ca-certificates curl gnupg sudo lsb-release

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update
RUN apt-get -y install docker-ce docker-ce-cli containerd.io

RUN useradd -u 1001 ciuser
RUN usermod -aG sudo ciuser
RUN echo "ciuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers



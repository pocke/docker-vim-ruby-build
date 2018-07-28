ARG os=debian
ARG version=stretch
ARG variant=-slim
ARG mirror=http://deb.debian.org/debian

FROM ${os}:${version}${variant} AS build

ENV DEBIAN_FRONTEND=noninteractive
RUN dpkg --add-architecture i386
ARG mirror
ARG version
RUN echo "deb-src ${mirror} ${version} main" > /etc/apt/sources.list.d/deb-src.list
RUN echo $'Dpkg::Use-Pty "0";\nquiet "2";\nAPT::Install-Recommends "0";' > /etc/apt/apt.conf.d/99autopilot
RUN echo 'Acquire::HTTP::No-Cache "True";' > /etc/apt/apt.conf.d/99no-cache
ARG system_ruby=ruby2.3
RUN apt-get update && apt-get upgrade
RUN apt-get install lib${system_ruby}:amd64
RUN apt-get install lib${system_ruby}:i386
RUN apt-get build-dep ${system_ruby}
RUN apt-get build-dep vim
RUN apt-get install build-essential gcc-multilib bison rdfind git curl

ADD all-ruby.patch /tmp/

RUN git clone https://github.com/akr/all-ruby /all-ruby
WORKDIR /all-ruby
RUN git apply /tmp/all-ruby.patch
RUN rake 1.8.7
RUN rake 1.9.3-p551
RUN rake 2.0.0-p648
RUN rake 2.1.10
RUN rake 2.2.10
RUN rake 2.3.7
RUN rake 2.4.4
RUN rake 2.5.1

ADD build-vim.sh /bin/

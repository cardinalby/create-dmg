FROM debian

RUN apt-get update
RUN wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0-dev_1.0.2n-1ubuntu5.13_amd64.deb && \
    dpkg -i libssl1.0-dev_1.0.2n-1ubuntu5.13_amd64.deb || apt-get install -f -y

RUN apt-get install -y \
    autoconf \
    build-essential \
    cmake \
    genisoimage \
    git \
    zlib1g-dev

# Clone and build libmdg-hfsplus
RUN git clone --depth=1 https://github.com/planetbeing/libdmg-hfsplus.git
RUN cd libdmg-hfsplus && \
    cmake . && \
    make && \
    make install && \
    cd - && rm -r libdmg-hfsplus

COPY entrypoint.sh .

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
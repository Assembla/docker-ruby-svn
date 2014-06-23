FROM assembla/ruby
MAINTAINER Artiom Di <kron82@gmail.com>

RUN apt-get install -y libaprutil1-dev apache2-prefork-dev swig libserf-dev
RUN curl https://archive.apache.org/dist/subversion/subversion-1.8.9.tar.gz | tar zx
RUN cd subversion* && \
    ./configure --with-apxs=/usr/bin/apxs2 && make && make install && \
    make swig-rb && make install-swig-rb && \
    mv /usr/local/lib/libsvn_* /usr/lib/x86_64-linux-gnu/

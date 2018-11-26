FROM ubuntu:18.04

RUN apt-get -yqq update
RUN apt-get -yqq install software-properties-common gcc autoconf libssl1.0-dev libtool make python3 python3-dev python3-setuptools python3-pip flex bison libgmp-dev libflint-dev wget tar

# install pbc
RUN wget https://crypto.stanford.edu/pbc/files/pbc-0.5.14.tar.gz
RUN tar xvvf pbc-0.5.14.tar.gz
WORKDIR /pbc-0.5.14/
RUN ./configure && make && make install
RUN ldconfig
WORKDIR /

RUN pip3 install charm-crypto

# install fhipe
ADD . / fhipe/
WORKDIR /fhipe/
RUN make clean && make

# test
RUN python3 tests/test_ipe.py


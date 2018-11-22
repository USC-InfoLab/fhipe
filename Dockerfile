FROM ubuntu:18.04

RUN apt-get -y update
RUN apt-get -y install software-properties-common
RUN apt-get -y install git
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test
RUN apt-get -y install gcc
RUN apt-get -y install autoconf
RUN apt-get -y install libtool
RUN apt-get -y install make
RUN apt-get -y install python3 python3-dev python3-setuptools python3-pip
RUN apt-get -y install flex bison
RUN apt-get -y install libssl1.0-dev
RUN apt-get -y install libgmp-dev
RUN apt-get -y install wget
RUN apt-get -y install tar
RUN apt-get -y install libflint-dev
RUN pip3 install charm-crypto



# install pbc
RUN wget https://crypto.stanford.edu/pbc/files/pbc-0.5.14.tar.gz
RUN tar xvvf pbc-0.5.14.tar.gz
WORKDIR pbc-0.5.14/
RUN ./configure && make && make install
WORKDIR /

# install pbc
RUN git clone https://github.com/USC-InfoLab/fhipe.git
WORKDIR fhipe.git/
RUN make
WORKDIR /

#RUN python3 tests/test_ipe.py


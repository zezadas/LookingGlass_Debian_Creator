# deb package based on http://deb.debian.org/debian/pool/main/l/looking-glass/looking-glass_0+b6-1.debian.tar.xz
# docker build -t lg . && docker run -v `pwd`/output:/mnt lg
ARG debian=debian:bookworm-20230725
FROM $debian as base
WORKDIR /root
RUN apt update && apt install -y build-essential git dh-make dh-dkms
RUN git clone --recursive https://github.com/gnif/LookingGlass.git
WORKDIR /root/LookingGlass
COPY debian ./debian
COPY scriptzadas.sh ./scriptzadas.sh
RUN apt-get install -y $(dpkg-checkbuilddeps 2>&1 | sed -e 's/dpkg-checkbuilddeps:\serror:\sUnmet build dependencies: //g' -e  's/[\(][^)]*[\)] //g')
RUN dpkg-buildpackage -rfakeroot -b -uc -us
ENTRYPOINT ["/bin/bash","-c","cp ../*.deb /mnt"]

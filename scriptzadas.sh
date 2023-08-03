apt-get install -y $(dpkg-checkbuilddeps 2>&1 | sed -e 's/dpkg-checkbuilddeps:\serror:\sUnmet build dependencies: //g' -e  's/[\(][^)]*[\)] //g')
dpkg-buildpackage -rfakeroot -b -uc -us
cp ../*.deb /mnt

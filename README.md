
Container to build Looking Glass debian packages, since official repo only provides client and obs studio.
After compilation the following debs can be installed:
 - client
 - host
 - module
 - obs

This can be run with the following commands:
 - docker build -t lg .
 - docker run -v \
    /usr/src/linux-headers-$(uname -r):/usr/src/linux-headers-$(uname -r):ro \
    -v/lib/modules/$(uname -r):/lib/modules/$(uname -r):ro \
    -v /usr/src/linux-headers-$(uname -r)-common:/usr/src/linux-headers-$(uname -r)-common:ro \
    -v /usr/lib/linux-kbuild-6.1:/usr/lib/linux-kbuild-6.1:ro \
    -v `pwd`/output:/mnt lg

Note: header files are passed by using volumes. it may be necessary to adapt to your scenario.

Looking Glass source code seems to be not totally adjusted for a debian building environment, such as, for example the version variables used on the module Makefile could be better integrated, however, this recipe did not made any improvements on Looking Glass source code and focused on creating installable .deb files. 

There's always oppurtunity for improvements, as so, this project is open for pull request submissions.

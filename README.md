
Container to build Looking Glass debian packages, since official repo only provides client and obs studio.
After compilation the following debs can be installed:
 - client
 - host
 - module
 - obs

This can be run with the following commands:
 - docker build -t lg .
 - docker run \ -v `pwd`/output:/mnt lg

After sucessfull run, debian packages will be placed on ./output folder.

Note: Make sure to have necessary header files when installing module package.

Looking Glass source code seems to be not totally adjusted for a debian building environment, such as, for example the version variables used on the module Makefile could be better integrated, however, this recipe did not made any improvements on Looking Glass source code and focused on creating installable .deb files. 

There's always oppurtunity for improvements, as so, this project is open for pull request submissions.

# Windows build script for GNU diffutils

[GNU diffutils](https://www.gnu.org/software/diffutils/) is a package of
several programs related to finding differences between files.

Diffutils can be built build for Windows, using the mingw64 toolset. Rather than building
direct on a Windows host, cross-compilation on [Fedora Linux](https://getfedora.org/)
is far easier, as Fedora provides []prebuilt binaries](https://fedoraproject.org/wiki/MinGW/Tutorial)
for both the mingw64 toolset and many of the supporting libraries needed by tools like
diffutils.

This project is simply a script to build diffutils, along with CI infrastructure to
publish the resulting binaries.

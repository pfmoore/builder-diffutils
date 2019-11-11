# Build GNU utilities using Fedora's packaged version of mingw64
# All the build work is done in "docker build", so that all that
# needs to be done with the resulting image is copy the built files
# out.

# A basic Linux image. Yes, it should be pinned to a version.
FROM fedora

# File author / maintainer
LABEL maintainer="p.f.moore@gmail.com"

# Install:
#   Mingw64 C toolchain
#   Static winpthreads libraries
#   Static PCRE library, for grep PCRE support
#   Utilities wget zip xz make
RUN dnf install -y mingw64-gcc mingw64-winpthreads-static \
                   mingw64-pcre-static \
                   wget zip xz make \
    && dnf clean all

# Copy the build script into the image
ADD build.sh /build/build.sh

# Run the actual build
RUN cd /build && /bin/bash build.sh

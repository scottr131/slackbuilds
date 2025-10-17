#### libnbd

Source: <https://download.libguestfs.org/libnbd/1.22-stable/>  
SlackBuild: https://github.com/scottr131/slackbuilds/tree/main/libnbd  
Build time: 20 sec

This package provides a client library for the NBD protocol.  It is used by Ceph.  **libnbd** uses a typical *Autoconf* build process.

```bash
CFLAGS="$SLKCFLAGS" \
CXXFLAGS="$SLKCFLAGS" \
./configure \
  --prefix=/usr \
  --libdir=/usr/lib${LIBDIRSUFFIX} \
  --sysconfdir=/etc \
  --localstatedir=/var \
  --mandir=/usr/man \
  --docdir=/usr/doc/$PRGNAM-$VERSION \
  --disable-static \
  --build=$ARCH-slackware-linux 

CFLAGS="$SLKCFLAGS" \
CXXFLAGS="$SLKCFLAGS" \
make -j ${BLDTHREADS:-1}
make install DESTDIR=$PKG
```


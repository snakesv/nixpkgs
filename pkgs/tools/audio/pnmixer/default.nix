{ stdenv, fetchgit, alsaLib, pkgconfig, gtk3, glibc, autoconf, automake, libnotify, libX11, gettext }:

stdenv.mkDerivation rec {
  name = "pa-applet";

  src = fetchgit {
    url = "git://github.com/nicklan/pnmixer.git";
    rev = "1e09a075c0c63d8b161b13ea92528a798bdb464a";
    sha256 = "15k689xycpc6pvq9vgg9ak92b9sg09dh4yrh83kjcaws63alrzl5";
  };

  buildInputs = [
    alsaLib pkgconfig gtk3 glibc autoconf automake libnotify libX11 gettext
  ];

  preConfigure = ''
    ./autogen.sh
  '';

  # work around a problem related to gtk3 updates
  NIX_CFLAGS_COMPILE = "-Wno-error=deprecated-declarations";

  postInstall = ''
  '';

  meta = with stdenv.lib; {
    description = "";
    license = licenses.gpl3;
    maintainers = with maintainers; [ iElectric ];
    platforms = platforms.linux;
  };
}
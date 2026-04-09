{ lib
, stdenv
, fetchurl
, autoPatchelfHook
, makeWrapper
, python3
, libGL
, libGLU
, xorg
, zlib
, libffi
, openssl
, boost
, tbb
, alsa-lib
, fontconfig
, freetype
, expat
, libuuid
, libxkbcommon
, dbus
, gtk3
, glib
, pango
, cairo
, gdk-pixbuf
, atk
}:

let
  version = "1.6.15.0";
  pname = "gaffer";
in
stdenv.mkDerivation rec {
  inherit pname version;

  src = fetchurl {
    url = "https://github.com/GafferHQ/gaffer/releases/download/${version}/gaffer-${version}-linux-gcc11.tar.gz";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    # Per ottenere l'hash corretto, scarica il tarball e lancia:
    #   nix-prefetch-url --type sha256 <url>
    # oppure usa `nix hash file gaffer-*.tar.gz`
  };

  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
  ];

  buildInputs = [
    python3
    libGL
    libGLU
    xorg.libX11
    xorg.libXext
    xorg.libXrender
    xorg.libXi
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXinerama
    xorg.libXfixes
    xorg.libXcomposite
    xorg.libxcb
    zlib
    libffi
    openssl
    boost
    tbb
    alsa-lib
    fontconfig
    freetype
    expat
    libuuid
    libxkbcommon
    dbus
    gtk3
    glib
    pango
    cairo
    gdk-pixbuf
    atk
  ];

  # autoPatchelfHook cerca le .so nelle buildInputs; aggiunge anche le
  # librerie bundled nella directory lib/ del tarball stesso.
  appendRunpaths = [ "${placeholder "out"}/opt/gaffer/lib" ];

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    runHook preInstall

    # Copia l'albero estratto nella destinazione
    mkdir -p $out/opt/gaffer
    cp -r . $out/opt/gaffer

    # Wrapper che punta ai binari reali
    mkdir -p $out/bin
    makeWrapper $out/opt/gaffer/bin/gaffer $out/bin/gaffer

    # Icona e desktop entry
    mkdir -p $out/share/icons
    ln -s $out/opt/gaffer/graphics/GafferLogoMini.png $out/share/icons/gafferhq.png

    mkdir -p $out/share/applications
    cat > $out/share/applications/gaffer.desktop <<EOF
    [Desktop Entry]
    Name=Gaffer
    Comment=VFX application for look development, lighting, and compositing
    Exec=$out/bin/gaffer
    Icon=gafferhq
    Terminal=false
    Type=Application
    Categories=Graphics;Video;
    MimeType=application/x-gaffer;
    EOF

    mkdir -p $out/share/mime/application
    cat > $out/share/mime/application/x-gaffer.xml <<EOF
    <?xml version="1.0" encoding="UTF-8"?>
    <mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
      <mime-type type="application/x-gaffer">
        <comment>Gaffer Scene</comment>
        <glob pattern="*.gfr"/>
      </mime-type>
    </mime-info>
    EOF

    runHook postInstall
  '';

  meta = with lib; {
    description = "VFX application for look development, lighting, and compositing";
    homepage = "https://www.gafferhq.org/";
    license = licenses.bsd3;
    platforms = [ "x86_64-linux" ];
    maintainers = [ ];
    sourceProvenance = [ sourceTypes.binaryNativeCode ];
  };
}

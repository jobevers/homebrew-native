require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class PangoNative < Formula
  homepage 'http://www.pango.org/'
  url 'http://ftp.gnome.org/pub/GNOME/sources/pango/1.36/pango-1.36.2.tar.xz'
  sha256 'f07f9392c9cf20daf5c17a210b2c3f3823d517e1917b72f20bb19353b2bc2c63'

  # depends_on 'cmake' => :build
  # depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on 'pkg-config'
  depends_on 'cairo-native'
  depends_on :libpng
  depends_on 'fontconfig'
  depends_on 'freetype'
  depends_on 'harfbuzz-native'
  depends_on 'gettext'
  depends_on 'glib'
  depends_on 'libffi'
  depends_on 'pixman'
  depends_on 'icu4c'
  depends_on 'xz'
  depends_on 'gobject-introspection'
  
  conflicts_with "pango", :because=>"installs the same binaries"
  
  def install
    args = %W[
      --disable-dependency-tracking
      --disable-silent-rules
      --prefix=#{prefix}
      --enable-man
      --with-html-dir=#{share}/doc
      --enable-introspection=yes
      --disable-xft
    ]
    system "./configure", *args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    system "#{bin}/pango-querymodules", "--version"
  end
end

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

  #keg_only "for inkscape"
  
  conflicts_with "pango", :because=>"installs the same binaries"
  
  def install
    # ENV.j1  # if your formula's build system can't parallelize

    system "./configure", "--prefix=#{prefix}", "--disable-xft"
    # system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test pango-native`.
    system "false"
  end
end

require "formula"

class Unicornleap < Formula
  homepage "https://github.com/jgdavey/unicornleap"
  url "https://github.com/jgdavey/unicornleap/archive/v0.1.0.tar.gz"
  sha1 "4cc24cd63829fdca4ac6e8315ed72626e7971d4c"

  def install
    system "make"
    image_folder = File.join(File.expand_path("~"), ".unicornleap")
    system "make", image_folder
    bin.install "build/unicornleap"
    man.mkpath
    man1.install "unicornleap.1"
  end

  test do
    system "#{bin}/unicornleap"
  end
end

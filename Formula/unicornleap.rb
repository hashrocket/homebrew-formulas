require "pathname"
require "etc"

class Unicornleap < Formula
  homepage "https://github.com/jgdavey/unicornleap"
  url "https://github.com/jgdavey/unicornleap/archive/v1.0.2.tar.gz"
  sha256 "153b297f9e4823e8ab227fa8725aa606d8bc59e2fa500d66d9ece9161c9de48d"

  def install
    system "make"
    system "make", "images"

    fake_image_folder = Pathname(File.join(File.expand_path("~"), ".unicornleap"))
    real_image_folder = Pathname(File.join(Etc.getpwuid.dir, ".unicornleap"))

    if fake_image_folder.exist? && !real_image_folder.exist?
      cp_r fake_image_folder, real_image_folder
    end

    bin.install "build/unicornleap"
    man.mkpath
    man1.install "unicornleap.1"
  end

  test do
    system "#{bin}/unicornleap"
  end
end

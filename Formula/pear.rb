require "formula"

class Pear < Formula
  homepage "https://github.com/derekparker/go-pear"
  url "https://github.com/derekparker/go-pear/releases/download/v1.3.2/pear1.3.2.tar.gz"
  sha256 "ee468483788f28cac5a64b029907d49b3b5da99748e32bde2a65e99d3eed1125"

  def install
    if ENV['SHELL'] == '/bin/zsh'
      ohai "Installing zshell auto complete function"
      cp "_pear", File.join(Etc.getpwuid.dir, ".zsh/functions")
    end

    ohai "Installing binary"
    bin.install "pear"
  end

  def caveats
    <<-MSG.undent
      #####
      In order to get zsh autocomplion to reload, run:

      rm -f ~/.zcompdump; compinit

      #####
    MSG
  end

  test do
    system "pear -v"
  end
end

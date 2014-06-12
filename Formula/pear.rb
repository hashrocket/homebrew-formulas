require "formula"

class Pear < Formula
  homepage "https://github.com/derekparker/go-pear"
  url "https://github.com/derekparker/go-pear/releases/download/v1.3.2/pear1.3.2.tar.gz"
  sha1 "6895352abf1782f446ef4d3cb950d9cc62d660b1"

  def install
    if ENV['SHELL'] == '/bin/zsh'
      ohai "Installing zshell auto complete function"
      cp "_pear", File.expand_path("~/.zsh/functions")
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

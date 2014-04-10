require "formula"

class Pear < Formula
  homepage "https://github.com/Dparker1990/go-pear"
  url "https://github.com/Dparker1990/go-pear/releases/download/v1.2.0/pear1.2.0.tar.gz"
  sha1 "6dbf8892519074e317a09578ff8c5e64e48b3f25"

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
end

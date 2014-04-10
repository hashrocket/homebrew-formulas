require "formula"

class Pear < Formula
  homepage "https://github.com/Dparker1990/go-pear"
  url "https://github.com/Dparker1990/go-pear/releases/download/v1.1.0/pear1.1.0.tar.gz"
  sha1 "6936fd6fe091cfcde3025cdb6f0171fe2c5784be"

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

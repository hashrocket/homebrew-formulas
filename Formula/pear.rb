require "formula"

class Pear < Formula
  homepage "https://github.com/derekparker/go-pear"
  url "https://github.com/derekparker/go-pear/releases/download/v1.3.2/pear1.3.2.tar.gz"
  sha1 "f4354f2f015b2e627754c7466830200744e82445"

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

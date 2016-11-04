class PostgresqlAutodoc < Formula
  desc "Generates a Graphviz representation of a PostgreSQL schema"
  homepage "https://github.com/cbbrowne/autodoc"
  url "https://github.com/cbbrowne/autodoc.git", :revision => '44f0e390a6b50632827afd58b1903e0ceab34268', :using => :git
  version '1.41.0'

  def install
    system 'cpan', '-i', '-T', 'DBI', 'HTML::Template', 'Term::ReadKey', 'DBD::Pg'
    system "make", "install", "PREFIX=#{prefix}"
  end
end

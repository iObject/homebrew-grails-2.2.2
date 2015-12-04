class Grails < Formula
  desc "Web application framework for the Groovy language"
  homepage "https://grails.org"
  url "https://github.com/grails/grails-core/releases/download/v2.2.2/grails-2.2.2.zip"
  sha256 "23dab69c42decca4d1da5bae0337fc47b0823faeb441150cec126f18ec76a09e"

  bottle :unneeded

  def install
    rm_f Dir["bin/*.bat", "bin/cygrails", "*.bat"]
    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats; <<-EOS.undent
    The GRAILS_HOME directory is:
      #{opt_libexec}
    EOS
  end

  test do
    output = shell_output("#{bin}/grails --version")
    assert_match /Grails Version: #{version}/, output
  end
end

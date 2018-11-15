class Heroku < Formula

  desc "Heroku CLI"
  homepage "https://github.com/raicheff/docker-heroku-cli"
  url "https://github.com/raicheff/docker-heroku-cli/archive/master.zip"
  sha256 "64c3a823f1baed909cc1be78ada31a1ca1a258bc2d709272cc0ff0eff6b27d82"

  def install

    # Alter PATH to ensure `docker' is available
    if Formula["docker"].linked_keg.exist?
      ENV.prepend_path "PATH", Formula["docker"].opt_bin
    else
      ENV.prepend_path "PATH", "/usr/local/bin"
    end

    ENV["PREFIX"] = prefix

    system "make", "install"

  end

  test do
    system "heroku", "help"
  end

end

require 'formula'
require File.expand_path("../../Requirements/php-meta-requirement", Pathname.new(__FILE__).realpath)
require File.expand_path("../../Requirements/phar-requirement", Pathname.new(__FILE__).realpath)

class Phpcpd < Formula
  homepage 'https://github.com/sebastianbergmann/phpcpd'
  url 'http://pear.phpunit.de/get/phpcpd-1.4.3.phar'
  sha1 '8a71cfd8bf46fc52a19040b6d22af0ffeebecddf'

  depends_on PhpMetaRequirement
  depends_on PharRequirement

  def install
    libexec.install "phpcpd-#{version}.phar"
    sh = libexec + "phpcpd"
    sh.write("#!/bin/sh\n\n/usr/bin/env php -d allow_url_fopen=On -d detect_unicode=Off #{libexec}/phpcpd-#{version}.phar $*")
    chmod 0755, sh
    bin.install_symlink sh
  end

  def test
    system 'phpcpd --version'
  end

  def caveats; <<-EOS.undent
    Verify your installation by running:
      "phpcpd --version".

    You can read more about phpcpd by running:
      "brew home phpcpd".
    EOS
  end
end

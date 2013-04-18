require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php53Pcntl < AbstractPhp53Extension
  init
  homepage 'http://php.net/manual/en/book.pcntl.php'
  url 'http://www.php.net/get/php-5.3.24.tar.bz2/from/this/mirror'
  sha1 'ff591a89d77123c7823adf94fea4aca7de5a3dc6'
  version '5.3.24'

  def install
    Dir.chdir "ext/pcntl"

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig,
                          "--disable-dependency-tracking"
    system "make"
    prefix.install "modules/pcntl.so"
    write_config_file unless build.include? "without-config-file"
  end
end

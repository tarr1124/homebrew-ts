require 'formula'
HOMEBREW_TS_VERSION='0.3.2'

class Ts < Formula
  homepage 'https://github.com/tarr1124/ts'
  url 'https://github.com/tarr1124/ts.git', :tag => "v#{HOMEBREW_TS_VERSION}"
  version HOMEBREW_TS_VERSION
  head 'https://github.com/tarr1124/ts.git', :branch => 'master'

  depends_on 'go' => :build
  depends_on 'hg' => :build

  def install
    ENV['GOPATH'] = buildpath
    system 'go', 'get', 'github.com/kyeah/gohunt/gohunt'
    system 'go', 'get', 'github.com/jteeuwen/go-pkg-rss'
    system 'go', 'get', 'github.com/codegangsta/cli'
    system 'go', 'get', 'github.com/jzelinskie/geddit'
    system 'go', 'get', "github.com/getwe/figlet4go"
    system 'go', 'get', 'github.com/tarr1124/ts'
    mkdir_p buildpath/'src/github.com/tarr1124/ts'
    ln_s buildpath, buildpath/'src/github.com/tarr1124/ts'
    system 'go', 'build', '-o', 'ts'
    bin.install 'ts'
  end
end

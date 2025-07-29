class Ftr < Formula
  desc "Fast, parallel ICMP traceroute with ASN lookup"
  homepage "https://github.com/dweekly/ftr"
  url "https://github.com/dweekly/ftr/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "bc56998568cc9219e534115ea02417e61e7b5e857da020f029d1e9662d125d74"
  license "MIT"
  head "https://github.com/dweekly/ftr.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # Test that the binary runs and shows help
    output = shell_output("#{bin}/ftr --help")
    assert_match "Fast parallel ICMP traceroute with ASN lookup", output
    
    # Test version output
    assert_match version.to_s, shell_output("#{bin}/ftr --version")
  end
end

class Ftr < Formula
  desc "Fast, parallel ICMP traceroute with ASN lookup"
  homepage "https://github.com/dweekly/ftr"
  url "https://github.com/dweekly/ftr/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "5bfaeff8e4048e7cf3252c6afaf4b8995517c0b22ee6b2f6c39a00f5f7a50e59"
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

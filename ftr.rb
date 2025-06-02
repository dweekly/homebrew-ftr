class Ftr < Formula
  desc "Fast, parallel ICMP traceroute with ASN lookup"
  homepage "https://github.com/dweekly/ftr"
  url "https://github.com/dweekly/ftr/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "6bf423c0e260b44c702cb92d41635ae39634d5b710bd64ca3b1448762d269d5a"
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
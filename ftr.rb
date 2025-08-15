class Ftr < Formula
  desc "Fast, parallel ICMP traceroute with ASN lookup"
  homepage "https://github.com/dweekly/ftr"
  url "https://github.com/dweekly/ftr/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "a9554a8e3f405e932fe8f02ed4f3ee8fb3f63b1841833785a7cd952fd68c0dc6"
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

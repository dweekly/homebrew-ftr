class Ftr < Formula
  desc "Fast, parallel ICMP traceroute with ASN lookup"
  homepage "https://github.com/dweekly/ftr"
  url "https://github.com/dweekly/ftr/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "b3819aa20c93943d836a58c10f1031bd1aba5babf91f6f3ad79495277c0e1506"
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

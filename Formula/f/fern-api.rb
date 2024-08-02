class FernApi < Formula
  desc "Stripe-level SDKs and Docs for your API"
  homepage "https://buildwithfern.com/"
  url "https://registry.npmjs.org/fern-api/-/fern-api-0.37.6.tgz"
  sha256 "85da00b1b9b5df7f117c453d484332f1a217e345e8e8c7e3666fccf17b8f240b"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "14dc46a137496c6702106670383b148e534f7d8e2a0d78c901ecc88c0a249753"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "14dc46a137496c6702106670383b148e534f7d8e2a0d78c901ecc88c0a249753"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "14dc46a137496c6702106670383b148e534f7d8e2a0d78c901ecc88c0a249753"
    sha256 cellar: :any_skip_relocation, sonoma:         "14dc46a137496c6702106670383b148e534f7d8e2a0d78c901ecc88c0a249753"
    sha256 cellar: :any_skip_relocation, ventura:        "14dc46a137496c6702106670383b148e534f7d8e2a0d78c901ecc88c0a249753"
    sha256 cellar: :any_skip_relocation, monterey:       "14dc46a137496c6702106670383b148e534f7d8e2a0d78c901ecc88c0a249753"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "dd1bba75a88b9cd0e4e73e01bdb075b9796a12d382e057e0b0af5ae86e508359"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    output = shell_output("#{bin}/fern init 2>&1", 1)
    assert_match "Login required", output

    assert_match version.to_s, shell_output("#{bin}/fern --version")
  end
end

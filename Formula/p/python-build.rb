class PythonBuild < Formula
  include Language::Python::Virtualenv

  desc "Simple, correct PEP 517 build frontend"
  homepage "https://github.com/pypa/build"
  url "https://files.pythonhosted.org/packages/dd/bb/4a1b7e3a7520e310cf7bfece43788071604e1ccf693a7f0c4638c59068d6/build-1.2.2.tar.gz"
  sha256 "119b2fb462adef986483438377a13b2f42064a2a3a4161f24a0cca698a07ac8c"
  license "MIT"
  head "https://github.com/pypa/build.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "8a02b06273633d165aeb7f3a6f9c799c688e95a3e0e6a99dff4447c0d174b49c"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "8a02b06273633d165aeb7f3a6f9c799c688e95a3e0e6a99dff4447c0d174b49c"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "8a02b06273633d165aeb7f3a6f9c799c688e95a3e0e6a99dff4447c0d174b49c"
    sha256 cellar: :any_skip_relocation, sonoma:         "40ca53f82b413997243774f2adf79eb0baa6900d9ed6db87c4269fa8d43f1908"
    sha256 cellar: :any_skip_relocation, ventura:        "40ca53f82b413997243774f2adf79eb0baa6900d9ed6db87c4269fa8d43f1908"
    sha256 cellar: :any_skip_relocation, monterey:       "40ca53f82b413997243774f2adf79eb0baa6900d9ed6db87c4269fa8d43f1908"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "7f685d6de8ad4b0d9779ea800b6c3b4a5f7af3caa5d4b8ea8064dff279fb6906"
  end

  depends_on "python@3.12"

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/51/65/50db4dda066951078f0a96cf12f4b9ada6e4b811516bf0262c0f4f7064d4/packaging-24.1.tar.gz"
    sha256 "026ed72c8ed3fcce5bf8950572258698927fd1dbda10a5e981cdf0ac37f4f002"
  end

  resource "pyproject-hooks" do
    url "https://files.pythonhosted.org/packages/c7/07/6f63dda440d4abb191b91dc383b472dae3dd9f37e4c1e4a5c3db150531c6/pyproject_hooks-1.1.0.tar.gz"
    sha256 "4b37730834edbd6bd37f26ece6b44802fb1c1ee2ece0e54ddff8bfc06db86965"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    stable.stage do
      system bin/"pyproject-build"
      assert_predicate Pathname.pwd/"dist/build-#{stable.version}.tar.gz", :exist?
      assert_predicate Pathname.pwd/"dist/build-#{stable.version}-py3-none-any.whl", :exist?
    end
  end
end
